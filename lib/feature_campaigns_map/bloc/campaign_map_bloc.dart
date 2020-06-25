import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/error/exception_to_message_mapper.dart';
import 'package:lykke_mobile_mavn/base/repository/campaign/campaign_repository.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/bloc/campaign_map_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/di/campaign_map_module.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';

export 'package:lykke_mobile_mavn/base/common_blocs/country_list_bloc_output.dart';

class CampaignMapBloc extends Bloc<CampaignMapState> {
  CampaignMapBloc(
    this._campaignRepository,
    this._exceptionToMessageMapper,
  );

  static const _maxRadius = 128.0;
  static const _pageSize = 100;
  static const double _defaultRadius = 2;
  static const _defaultCountry = 'CHE';

  final CampaignRepository _campaignRepository;
  final ExceptionToMessageMapper _exceptionToMessageMapper;

  @override
  CampaignMapState initialState() => CampaignMapUninitializedState();

  Future<void> loadCampaignsForLocation({
    @required double lat,
    @required double long,
    double radius = _defaultRadius,
  }) async {
    ///if radius is larger than max appointed by BE
    ///BE will return an error
    if (radius > _maxRadius) return;

    final isFirstLoad = currentState is CampaignMapUninitializedState;

    ///if newly selected radius is contained within the previous bigger radius
    ///do not load campaigns
    if (currentState is CampaignMapLoadedState &&
            (currentState as CampaignMapLoadedState).radius > radius ||
        currentState is CampaignMapLoadingState) {
      return;
    }

    setState(CampaignMapLoadingState());

    try {
      final campaignListResponse = await _campaignRepository.getCampaigns(
        pageSize: _pageSize,
        currentPage: 1,
        long: long,
        lat: lat,
        radius: radius,
      );

      setState(CampaignMapLoadedState(
        campaignList: campaignListResponse.campaigns,
        isForUserLocation: true,
        isFirstLoad: isFirstLoad,
        radius: radius,
      ));

      sendEvent(CampaignMapLoadedEvent(
        campaignList: campaignListResponse.campaigns,
        isForUserLocation: true,
        isFirstLoad: isFirstLoad,
        radius: radius,
      ));
    } on Exception catch (e) {
      final errorMessage = _exceptionToMessageMapper.map(e);

      setState(CampaignMapErrorState(errorMessage));
    }
  }

  Future<void> loadCampaignsForCountry({
    String countryCode = _defaultCountry,
  }) async {
    setState(CampaignMapLoadingState());
    final isFirstLoad = currentState is CampaignMapUninitializedState;

    try {
      final campaignListResponse = await _campaignRepository.getCampaigns(
        pageSize: _pageSize,
        currentPage: 1,
        countryCode: countryCode,
      );

      setState(CampaignMapLoadedState(
        campaignList: campaignListResponse.campaigns,
        isForUserLocation: false,
        isFirstLoad: isFirstLoad,
      ));
      sendEvent(CampaignMapLoadedEvent(
        campaignList: campaignListResponse.campaigns,
        isForUserLocation: false,
        isFirstLoad: isFirstLoad,
      ));
    } on Exception catch (e) {
      final errorMessage = _exceptionToMessageMapper.map(e);

      setState(CampaignMapErrorState(errorMessage));
    }
  }
}

CampaignMapBloc useCampaignMapBloc() =>
    ModuleProvider.of<CampaignMapModule>(useContext()).campaignMapBloc;
