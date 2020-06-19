import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/bloc/campaign_map_bloc.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/bloc/campaign_map_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/ui_components/partner_bottom_sheet.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/ui_components/pop_back_button.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/util/location_to_marker_mapper.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/util/map_utils.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/util/marker_helper.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc_state.dart';
import 'package:lykke_mobile_mavn/feature_location/util/user_position.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:pedantic/pedantic.dart';

class CampaignMapPage extends HookWidget {
  static const _defaultInitialPosition = LatLng(47.3769, 8.5417);

  ///a rough estimate of Switzerland's size
  static const _radiusDefault = 350000.0;

  ///default radius by AC
  static const _radiusUserLocation = 2000.0;
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final localizedStrings = useLocalizedStrings();

    final userLocationBloc = useUserLocationBloc();

    final campaignMapBloc = useCampaignMapBloc();
    final campaignMapBlocState = useBlocState(campaignMapBloc);
    final mapper = useLocationToMarkerMapper();
    final markerHelper = useMarkerHelper();

    final isErrorDismissed = useState(false);
    final isCenteredLocation = useState(false);
    final isReturningFromSettings = useState(false);
    final currentUserLocation = useState<UserPosition>();
    final data = useState<List<Marker>>([]);

    useBlocEventListener(userLocationBloc, (event) async {
      if (event is UserLocationFetchedLocationEvent) {
        isErrorDismissed.value = false;

        ///load campaigns for this location
        unawaited(campaignMapBloc.loadCampaignsForLocation(
          lat: event.userPosition.lat,
          long: event.userPosition.long,
        ));
        currentUserLocation.value = event.userPosition;

        ///animate to user location
        _centerCamera(
          lat: currentUserLocation.value.lat,
          long: currentUserLocation.value.long,
          isCenteredCamera: isCenteredLocation,
          radius: _radiusUserLocation,
          context: context,
        );

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

      /// fallback
      /// Load campaigns for default location
      unawaited(campaignMapBloc.loadCampaignsForCountry());
      //center on Switzerland
      _centerCamera(
        lat: _defaultInitialPosition.latitude,
        long: _defaultInitialPosition.longitude,
        isCenteredCamera: isCenteredLocation,
        radius: _radiusUserLocation,
        context: context,
      );
    });

    useEffect(() {
      userLocationBloc.getUserLocation();
    }, [userLocationBloc]);

    void _onMapCreated(GoogleMapController controller) {
      _mapController = controller;
      final mapLocation = currentUserLocation.value != null
          ? LatLng(
              currentUserLocation.value.lat,
              currentUserLocation.value.long,
            )
          : _defaultInitialPosition;

      final radius = currentUserLocation.value != null
          ? _radiusUserLocation
          : _radiusDefault;

      ///center camera when map is ready
      ///in case it wasn't when user location was received
      _centerCamera(
        lat: mapLocation.latitude,
        long: mapLocation.longitude,
        isCenteredCamera: isCenteredLocation,
        radius: radius,
        context: context,
      );
    }

    if (campaignMapBlocState is CampaignMapLoadedState) {
      data.value = mapper.mapCampaignsToMarkers(
        campaignMapBlocState.campaignList,
        (partnerLocation) => _showPartnerBottomSheet(
          campaigns: markerHelper.getCampaignsForPartnerLocation(
            campaigns: campaignMapBlocState.campaignList,
            partnerId: partnerLocation.partnerId,
            lat: partnerLocation.location.lat,
            long: partnerLocation.location.long,
          ),
          partnerLocation: partnerLocation,
          context: context,
        ),
      );
    }

    Future<void> onCameraIdle() async {
      final bounds = await _mapController.getVisibleRegion();
      final centerLat =
          (bounds.northeast.latitude + bounds.southwest.latitude) / 2.0;
      final centerLng =
          (bounds.northeast.longitude + bounds.southwest.longitude) / 2.0;
      final radius = bounds.getRadius();

      ///when user moves position
      ///reload campaigns
      unawaited(campaignMapBloc.loadCampaignsForLocation(
          lat: centerLat, long: centerLng, radius: radius));
    }

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  const CameraPosition(target: _defaultInitialPosition),
              myLocationEnabled: true,
              markers: data.value.toSet(),
              onCameraIdle: onCameraIdle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: FloatingBackButton(),
            ),
          ],
        ),
      ),
    );
  }

  void _centerCamera({
    double lat,
    double long,
    ValueNotifier<bool> isCenteredCamera,
    double radius,
    BuildContext context,
  }) {
    if (isCenteredCamera.value || _mapController == null) return;
    isCenteredCamera.value = true;
    unawaited(
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              lat,
              long,
            ),
            zoom: MapUtils.getZoomForRadius(
              radius: radius,
              mapWidth: MediaQuery.of(context).size.width,
              latitude: lat,
            ),
          ),
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
