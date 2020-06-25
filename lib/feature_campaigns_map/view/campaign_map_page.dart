import 'package:app_settings/app_settings.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/country/response_model/partner_country_list_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/bloc/campaign_map_bloc.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/bloc/campaign_map_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/ui_components/partner_bottom_sheet.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/util/location_to_marker_mapper.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/util/map_utils.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/util/marker_helper.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_country_search/view/search_bar.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc_state.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_extensions/list_extensions.dart';
import 'package:lykke_mobile_mavn/library_ui_components/buttons/custom_back_button.dart';
import 'package:pedantic/pedantic.dart';

class CampaignMapPage extends HookWidget {
  static const _defaultInitialPosition = LatLng(47.3769, 8.5417);

  GoogleMapController _mapController;
  final partnerCountryInputGlobalKey =
      GlobalKey<AutoCompleteTextFieldState<PartnerCountry>>();

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final localizedStrings = useLocalizedStrings();

    final userLocationBloc = useUserLocationBloc();
    final userLocationState = useBlocState(userLocationBloc);
    final partnerCountryBloc = usePartnerCountryListBloc();

    final campaignMapBloc = useCampaignMapBloc();
    final mapper = useLocationToMarkerMapper();
    final markerHelper = useMarkerHelper();

    final isErrorDismissed = useState(false);
    final isForcedCameraUpdate = useState(false);
    final isReturningFromSettings = useState(false);
    final currentUserLocation = useState<LatLng>();
    final data = useState<List<Marker>>([]);
    final selectedCountry = useValueNotifier<PartnerCountry>(null);

    ///listen for user location
    useBlocEventListener(userLocationBloc, (event) async {
      if (event is UserLocationFetchedLocationEvent) {
        isErrorDismissed.value = false;
        currentUserLocation.value = LatLng(
          event.userPosition.lat,
          event.userPosition.long,
        );

        ///load campaigns for this location
        unawaited(campaignMapBloc.loadCampaignsForLocation(
          lat: event.userPosition.lat,
          long: event.userPosition.long,
        ));

        return;
      }

      ///if location is disabled, show prompt
      else if (event is UserLocationServiceDisabledEvent) {
        final result = await router.showEnableLocationsDialog(localizedStrings);

        ///if user won't enable location
        ///do not prompt them again
        if (result) {
          isReturningFromSettings.value = true;
          await AppSettings.openLocationSettings();
        } else {
          userLocationBloc.stopUsingLocation();
        }
      }
    });

    ///listen for new campaigns
    useBlocEventListener(campaignMapBloc, (event) {
      if (event is CampaignMapLoadedEvent) {
        if (event.campaignList.isNotEmpty) {
          data.value = mapper.mapCampaignsToMarkers(
            event.campaignList,
            (partnerLocation) => _showPartnerBottomSheet(
              campaigns: markerHelper.getCampaignsForPartnerLocation(
                campaigns: event.campaignList,
                partnerId: partnerLocation.partnerId,
                lat: partnerLocation.location.lat,
                long: partnerLocation.location.long,
              ),
              partnerLocation: partnerLocation,
              context: context,
            ),
          );
          if (event.isFirstLoad || !event.isForUserLocation) {
            final markerBounds = MapUtils.getBoundsFromMarkerList(
              markers: data.value,
              userLocation: currentUserLocation.value,
            );

            ///fit all markers on screen
            isForcedCameraUpdate.value = true;
            _mapController
                ?.animateCamera(CameraUpdate.newLatLngBounds(markerBounds, 50));
          }
          return;
        }

        if (event.campaignList.isEmpty) {
          data.value = [];
        }

        ///zoom to user location on first load
        if (event.isForUserLocation &&
            event.isFirstLoad &&
            event.campaignList.isEmpty) {
          _mapController?.animateCamera(CameraUpdate.newLatLngZoom(
              currentUserLocation.value,
              MapUtils.getZoomForRadius(
                radius: event.radius,
                mapWidth: MediaQuery.of(context).size.width,
                latitude: currentUserLocation.value.latitude,
              )));
        }
      }
    });

    ///listen for selected countries
    useBlocEventListener(partnerCountryBloc, (event) {
      if (event is PartnerCountrySelectedEvent) {
        campaignMapBloc.loadCampaignsForCountry(
          countryCode: event.userPartnerCountry.countryIso3Code,
        );
      }
    });

    useEffect(() {
      userLocationBloc.getUserLocation();
    }, [userLocationBloc]);

    Future<void> onCameraIdle() async {
      ///if we're not using user location
      ///we don't need to update on camera move
      ///since we show campaigns for countries
      if (currentUserLocation.value == null || isForcedCameraUpdate.value) {
        isForcedCameraUpdate.value = false;
        return;
      }
      final bounds = await _mapController.getVisibleRegion();

      ///if scrolled area doesn't contain user location
      ///do not load campaigns
      if (!bounds.contains(currentUserLocation.value)) return;

      ///get distance to farthest point
      final distance = [
        MapUtils.getDistance(currentUserLocation.value, bounds.northeast),
        MapUtils.getDistance(currentUserLocation.value, bounds.southwest),
      ].max().toDouble();

      unawaited(campaignMapBloc.loadCampaignsForLocation(
        lat: currentUserLocation.value.latitude,
        long: currentUserLocation.value.longitude,
        radius: distance,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: ColorStyles.offWhite,
        centerTitle: false,
        leading: const CustomBackButton(),
        title: (userLocationState is UserLocationPermissionDeniedState ||
                userLocationState is UserLocationServiceDisabledState ||
                userLocationState is UserLocationDoNotUseLocationState)
            ? SearchBar(
                inputGlobalKey: partnerCountryInputGlobalKey,
                selectedCountryValueNotifier: selectedCountry,
              )
            : Container(),
      ),
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: (controller) => _mapController = controller,
          initialCameraPosition:
              const CameraPosition(target: _defaultInitialPosition),
          myLocationEnabled: true,
          markers: data.value.toSet(),
          onCameraIdle: onCameraIdle,
        ),
      ),
    );
  }

  void _showPartnerBottomSheet({
    @required PartnerLocation partnerLocation,
    @required List<CampaignResponseModel> campaigns,
    @required BuildContext context,
  }) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        backgroundColor: ColorStyles.white,
        barrierColor: ColorStyles.white.withOpacity(0),
        context: context,
        builder: (context) => PartnerBottomSheet(
              partnerName: partnerLocation.partnerName,
              partnerLocationAddress: partnerLocation.location.address,
              campaigns: campaigns,
            ));
  }
}
