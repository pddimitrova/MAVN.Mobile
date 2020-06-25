import 'package:app_settings/app_settings.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/image_assets.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/svg_assets.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/generic_list_bloc_output.dart';
import 'package:lykke_mobile_mavn/base/constants/bottom_bar_navigation_constants.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/country/response_model/partner_country_list_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_bottom_bar/bloc/bottom_bar_page_bloc.dart';
import 'package:lykke_mobile_mavn/feature_bottom_bar/bloc/bottom_bar_refresh_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_campaign_list/bloc/campaign_list_bloc.dart';
import 'package:lykke_mobile_mavn/feature_campaign_list/ui_components/campaign_widget.dart';
import 'package:lykke_mobile_mavn/feature_campaign_list/ui_components/custom_sliver_persistent_header_delegate.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_country_search/view/preferred_size_wrapper.dart';
import 'package:lykke_mobile_mavn/feature_country_search/view/search_bar.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc.dart';
import 'package:lykke_mobile_mavn/feature_location/bloc/user_location_bloc_state.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_custom_hooks/app_lifecycle_hook.dart';
import 'package:lykke_mobile_mavn/library_custom_hooks/throttling_hook.dart';
import 'package:lykke_mobile_mavn/library_ui_components/list/infinite_list_view.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/material_hero.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/spinner.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/standard_sized_svg.dart';
import 'package:pedantic/pedantic.dart';

class CampaignListPage extends HookWidget {
  static const campaignHeroTag = 'campaign_';
  final partnerCountryInputGlobalKey =
      GlobalKey<AutoCompleteTextFieldState<PartnerCountry>>();

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final localizedStrings = useLocalizedStrings();

    final campaignListBloc = useCampaignListBloc();
    final campaignListBlocState = useBlocState(campaignListBloc);

    final userLocationBloc = useUserLocationBloc();
    final userLocationState = useBlocState(userLocationBloc);

    final selectedCountryBloc = usePartnerCountryListBloc();
    final selectedCountryBlocState = useBlocState(selectedCountryBloc);

    final bottomBarPageBloc = useBottomBarPageBloc();
    final throttler = useThrottling(duration: const Duration(seconds: 30));

    final data = useState(<CampaignResponseModel>[]);
    final isErrorDismissed = useState(false);
    final isReturningFromSettings = useState(false);

    final selectedCountry = useValueNotifier<PartnerCountry>(null);

    void loadData() {
      isErrorDismissed.value = false;
      campaignListBloc.getList();
    }

    void loadInitialData() {
      isErrorDismissed.value = false;
      userLocationBloc.getUserLocation();
    }

    useBlocEventListener(userLocationBloc, (event) async {
      ///if we have received location, load campaigns
      if (event is UserLocationFetchedLocationEvent) {
        isErrorDismissed.value = false;
        unawaited(campaignListBloc.getCampaignsForUserLocation(
            currentPosition: event.userPosition));
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

    useBlocEventListener(selectedCountryBloc, (event) {
      if (event is PartnerCountrySelectedEvent) {
        campaignListBloc.getCampaignsForCountry(
            partnerCountry: event.userPartnerCountry);
      }
    });

    useBlocEventListener(bottomBarPageBloc, (event) {
      if (event is BottomBarRefreshEvent &&
          event.index == BottomBarNavigationConstants.offersPageIndex) {
        throttler.throttle(loadInitialData);
      }
    });

    useAppLifecycle((appLifecycleState) {
      ///if the user comes back to the app and
      ///it's from settings
      if (appLifecycleState == AppLifecycleState.resumed &&
          isReturningFromSettings.value) {
        isReturningFromSettings.value = false;

        ///try to get location again
        loadInitialData();
      }
    });

    if (campaignListBlocState is GenericListLoadedState) {
      data.value = campaignListBlocState.list;
    }

    return Scaffold(
      backgroundColor: ColorStyles.alabaster,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, isScrolling) => [
                SliverAppBar(
                  title: Text(
                    localizedStrings.offers,
                    style: TextStyles.lightHeaderTitle,
                  ),
                  brightness: Brightness.dark,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: ColorStyles.white,
                  elevation: 0,
                  expandedHeight: 150,
                  floating: false,
                  pinned: true,
                  actions: <Widget>[
                    IconButton(
                      key: const Key('campaignListMapButton'),
                      tooltip: localizedStrings.accountPageTitle,
                      icon: StandardSizedSvg(
                        SvgAssets.location,
                        color: ColorStyles.white,
                      ),
                      onPressed: router.pushCampaignMapPage,
                    ),
                  ],
                  flexibleSpace: Container(
                    color: ColorStyles.salmon,
                    child: FlexibleSpaceBar(
                      background: Image(
                        image: AssetImage(ImageAssets.backgroundFoodItems),
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),

                ///show [SearchBar] only if location will not be used
                if (userLocationState is UserLocationPermissionDeniedState ||
                    userLocationState is UserLocationServiceDisabledState ||
                    userLocationState is UserLocationDoNotUseLocationState)
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CustomSliverAppBarDelegate(
                      PreferredSizeWrapper(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 4),
                          child: SearchBar(
                            inputGlobalKey: partnerCountryInputGlobalKey,
                            selectedCountryValueNotifier: selectedCountry,
                          ),
                        ),
                        preferredHeight: SearchBar.preferredHeight,
                      ),
                    ),
                  )
              ],
              body: RefreshIndicator(
                color: ColorStyles.gold1,
                onRefresh: () async =>
                    campaignListBloc.updateGenericList(refresh: true),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: InfiniteListWidget(
                        data: data.value,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        errorPadding: const EdgeInsets.all(16),
                        backgroundColor: ColorStyles.offWhite,
                        isLoading: campaignListBlocState
                            is GenericListPaginationLoadingState,
                        isEmpty:
                            campaignListBlocState is GenericListEmptyState ||
                                (campaignListBlocState
                                        is GenericListUninitializedState &&
                                    selectedCountryBlocState
                                        is! PartnerCountrySelectedState),
                        emptyText: _getEmptyText(
                          userLocationState: userLocationState,
                          partnerCountryState: selectedCountryBlocState,
                          campaignListState: campaignListBlocState,
                          localizedStrings: localizedStrings,
                        ),
                        emptyIcon: _getEmptyIcon(
                          userLocationState: userLocationState,
                          partnerCountryState: selectedCountryBlocState,
                          campaignListState: campaignListBlocState,
                        ),
                        retryOnError: loadData,
                        loadData: loadData,
                        showError:
                            campaignListBlocState is GenericListErrorState,
                        errorText: campaignListBlocState
                                is GenericListErrorState
                            ? campaignListBlocState.error.localize(useContext())
                            : null,
                        itemBuilder: (campaign, _, itemContext) => InkWell(
                          onTap: () => router.pushCampaignDetailsPage(
                              campaign: campaign),
                          child: MaterialHero(
                            tag: '$campaignHeroTag${campaign.id}',
                            child: CampaignWidget(
                              title: campaign.name,
                              imageUrl: campaign.imageUrl,
                              price: campaign.price,
                            ),
                          ),
                        ),
                        separatorBuilder: (position) => Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (campaignListBlocState is GenericListLoadingState)
              const Center(child: Spinner())
          ],
        ),
      ),
    );
  }

  String _getEmptyText({
    @required UserLocationState userLocationState,
    @required PartnerCountryListState partnerCountryState,
    @required GenericListState campaignListState,
    @required LocalizedStrings localizedStrings,
  }) {
    if ((userLocationState is UserLocationPermissionDeniedState ||
            userLocationState is UserLocationServiceDisabledState ||
            userLocationState is UserLocationDoNotUseLocationState) &&
        partnerCountryState is! PartnerCountrySelectedState &&
        campaignListState is GenericListUninitializedState) {
      return localizedStrings.selectCampaignLocation;
    }
    return localizedStrings.voucherListEmpty;
  }

  String _getEmptyIcon({
    @required UserLocationState userLocationState,
    @required PartnerCountryListState partnerCountryState,
    @required GenericListState campaignListState,
  }) {
    if ((userLocationState is UserLocationPermissionDeniedState ||
            userLocationState is UserLocationServiceDisabledState ||
            userLocationState is UserLocationDoNotUseLocationState) &&
        partnerCountryState is! PartnerCountrySelectedState &&
        campaignListState is GenericListUninitializedState) {
      return SvgAssets.search;
    }
    return SvgAssets.voucher;
  }
}
