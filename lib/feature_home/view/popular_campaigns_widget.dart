import 'package:app_settings/app_settings.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/svg_assets.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/country/response_model/partner_country_list_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_campaign_list/ui_components/campaign_widget.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_country_search/view/search_bar.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/popular_offers_bloc.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/popular_offers_bloc_outut.dart';
import 'package:lykke_mobile_mavn/feature_home/ui_elements/carousel.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc_state.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/empty_list_widget.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/material_hero.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/secondary_call_to_action.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/spinner.dart';
import 'package:pedantic/pedantic.dart';

class PopularCampaignsWidget extends HookWidget {
  static const _heroTag = 'popular_campaign_hero_';

  final partnerCountryInputGlobalKey =
      GlobalKey<AutoCompleteTextFieldState<PartnerCountry>>();

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final localizedStrings = useLocalizedStrings();

    final userLocationBloc = useUserLocationBloc();
    final userLocationState = useBlocState(userLocationBloc);
    final partnerCountryBloc = usePartnerCountryListBloc();
    final partnerCountryState = useBlocState(partnerCountryBloc);

    final popularCampaignsBloc = usePopularCampaignsBloc();
    final popularCampaignsState = useBlocState(popularCampaignsBloc);

    final isErrorDismissed = useState(false);
    final isReturningFromSettings = useState(false);
    final selectedCountry = useValueNotifier<PartnerCountry>(null);

    ///listen for user location
    useBlocEventListener(userLocationBloc, (event) async {
      if (event is UserLocationFetchedLocationEvent) {
        isErrorDismissed.value = false;

        ///load campaigns for this location
        unawaited(popularCampaignsBloc.loadCampaignsForLocation(
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

    ///listen for selected countries
    useBlocEventListener(partnerCountryBloc, (event) {
      if (event is PartnerCountrySelectedEvent) {
        popularCampaignsBloc.loadCampaignsForCountry(
          countryCode: event.userPartnerCountry.countryIso3Code,
        );
      }
    });

    useEffect(() {
      userLocationBloc.getUserLocation(delay: const Duration(seconds: 2));
    }, [userLocationBloc]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                localizedStrings.popularOffers,
                style: TextStyles.darkHeadersH3,
              ),
              SecondaryCallToAction(
                text: localizedStrings.viewAll,
                onTap: router.switchToOffersTab,
              )
            ],
          ),
          const SizedBox(height: 8),
          if ((userLocationState is UserLocationPermissionDeniedState ||
                  userLocationState is UserLocationServiceDisabledState ||
                  userLocationState is UserLocationDoNotUseLocationState) &&
              partnerCountryState is PartnerCountryListUninitializedState)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SearchBar(
                inputGlobalKey: partnerCountryInputGlobalKey,
                selectedCountryValueNotifier: selectedCountry,
              ),
            ),
          if ((userLocationState is UserLocationPermissionDeniedState ||
                  userLocationState is UserLocationServiceDisabledState ||
                  userLocationState is UserLocationDoNotUseLocationState) &&
              popularCampaignsState is PopularCampaignsUninitializedState &&
              partnerCountryState is! PartnerCountrySelectedState)
            Container(
              height: 200,
              child: FittedBox(
                fit: BoxFit.contain,
                child: EmptyListWidget(
                  text: localizedStrings.selectCampaignLocation,
                  asset: SvgAssets.search,
                ),
              ),
            ),
          if (popularCampaignsState is PopularCampaignsLoadingState)
            const Center(child: Spinner()),
          if (popularCampaignsState is PopularCampaignsLoadedState)
            _buildCarousel(popularCampaignsState, router),
        ],
      ),
    );
  }

  Widget _buildCarousel(
    PopularCampaignsLoadedState popularCampaignsState,
    Router router,
  ) =>
      Carousel<CampaignResponseModel, CampaignWidget>(
        dataSet: popularCampaignsState.campaignList,
        itemBuilder: (item) => MaterialHero(
          tag: '$_heroTag${item.id}',
          child: InkWell(
            onTap: () {
              router.pushCampaignDetailsPage(
                campaign: item,
                heroTag: _heroTag,
              );
            },
            child: CampaignWidget(
              title: item.name,
              imageUrl: item.imageUrl,
              price: item.price,
            ),
          ),
        ),
      );
}
