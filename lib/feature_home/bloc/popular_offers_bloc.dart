import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/error/exception_to_message_mapper.dart';
import 'package:lykke_mobile_mavn/base/repository/campaign/campaign_repository.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/popular_offers_bloc_outut.dart';
import 'package:lykke_mobile_mavn/feature_home/di/home_page_module.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';

export 'package:lykke_mobile_mavn/base/common_blocs/country_list_bloc_output.dart';

class PopularCampaignsBloc extends Bloc<PopularCampaignsState> {
  PopularCampaignsBloc(
    this._campaignRepository,
    this._exceptionToMessageMapper,
  );

  static const _defaultCountry = 'CHE';

  final CampaignRepository _campaignRepository;
  final ExceptionToMessageMapper _exceptionToMessageMapper;

  @override
  PopularCampaignsState initialState() => PopularCampaignsUninitializedState();

  Future<void> loadCampaignsForLocation({
    @required double lat,
    @required double long,
  }) async {
    setState(PopularCampaignsLoadingState());

    try {
      final campaignListResponse =
          await _campaignRepository.getPopularCampaigns(
        long: long,
        lat: lat,
      );

      setState(PopularCampaignsLoadedState(
        campaignList: campaignListResponse.campaigns,
      ));
    } on Exception catch (e) {
      final errorMessage = _exceptionToMessageMapper.map(e);

      setState(PopularCampaignsErrorState(errorMessage));
    }
  }

  Future<void> loadCampaignsForCountry({
    String countryCode = _defaultCountry,
  }) async {
    setState(PopularCampaignsLoadingState());

    try {
      final campaignListResponse = await _campaignRepository.getCampaigns(
        currentPage: 1,
        countryCode: countryCode,
      );

      setState(PopularCampaignsLoadedState(
        campaignList: campaignListResponse.campaigns,
      ));
    } on Exception catch (e) {
      final errorMessage = _exceptionToMessageMapper.map(e);

      setState(PopularCampaignsErrorState(errorMessage));
    }
  }
}

PopularCampaignsBloc usePopularCampaignsBloc() =>
    ModuleProvider.of<HomePageModule>(useContext()).popularCampaignsBloc;
