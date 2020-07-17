import 'package:lykke_mobile_mavn/app/resources/lazy_localized_strings.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/base_bloc_output.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:meta/meta.dart';

abstract class PopularCampaignsState extends BaseState {}

class PopularCampaignsUninitializedState extends PopularCampaignsState {}

class PopularCampaignsLoadingState extends PopularCampaignsState
    with BaseLoadingState {}

class PopularCampaignsErrorState extends PopularCampaignsState {
  PopularCampaignsErrorState(this.error);

  final LocalizedStringBuilder error;

  @override
  List get props => super.props..addAll([error]);
}

class PopularCampaignsNetworkErrorState extends PopularCampaignsState
    with BaseNetworkErrorState {}

class PopularCampaignsLoadedState extends PopularCampaignsState {
  PopularCampaignsLoadedState({
    @required this.campaignList,
  });

  final List<CampaignResponseModel> campaignList;
}
