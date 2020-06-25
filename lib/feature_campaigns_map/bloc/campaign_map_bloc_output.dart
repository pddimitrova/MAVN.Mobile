import 'package:lykke_mobile_mavn/app/resources/lazy_localized_strings.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/base_bloc_output.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:meta/meta.dart';

abstract class CampaignMapState extends BaseState {}

class CampaignMapUninitializedState extends CampaignMapState {}

class CampaignMapLoadingState extends CampaignMapState with BaseLoadingState {}

class CampaignMapErrorState extends CampaignMapState {
  CampaignMapErrorState(this.error);

  final LocalizedStringBuilder error;

  @override
  List get props => super.props..addAll([error]);
}

class CampaignMapNetworkErrorState extends CampaignMapState
    with BaseNetworkErrorState {}

class CampaignMapLoadedState extends CampaignMapState {
  CampaignMapLoadedState({
    @required this.campaignList,
    this.isForUserLocation,
    this.isFirstLoad,
    this.radius,
  });

  final List<CampaignResponseModel> campaignList;
  final bool isForUserLocation;
  final bool isFirstLoad;
  final double radius;
}

class CampaignMapLoadedEvent extends BlocEvent {
  CampaignMapLoadedEvent({
    @required this.campaignList,
    this.isForUserLocation,
    this.isFirstLoad,
    this.radius,
  });

  final List<CampaignResponseModel> campaignList;
  final bool isForUserLocation;
  final bool isFirstLoad;
  final double radius;
}
