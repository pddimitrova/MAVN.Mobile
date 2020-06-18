import 'package:flutter/cupertino.dart';
import 'package:lykke_mobile_mavn/app/resources/lazy_localized_strings.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/voucher_purchase_response_model.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';

abstract class VoucherPurchaseState extends BlocState {}

class VoucherPurchaseUninitializedState extends VoucherPurchaseState {}

class VoucherPurchaseLoadingState extends VoucherPurchaseState {}

class VoucherPurchaseLoadedState extends VoucherPurchaseState {
  VoucherPurchaseLoadedState({@required this.voucherPurchaseResponseModel});

  final VoucherPurchaseResponseModel voucherPurchaseResponseModel;

  @override
  List get props => super.props..addAll([voucherPurchaseResponseModel]);
}

class VoucherPurchaseResponseEvent extends BlocEvent {
  VoucherPurchaseResponseEvent({@required this.voucherPurchaseResponseModel});

  final VoucherPurchaseResponseModel voucherPurchaseResponseModel;

  @override
  List get props => super.props..addAll([voucherPurchaseResponseModel]);
}

class VoucherPurchaseErrorState extends VoucherPurchaseState {
  VoucherPurchaseErrorState({@required this.error});

  final LocalizedStringBuilder error;

  @override
  List get props => super.props..addAll([error]);
}

class VoucherPurchaseNetworkErrorState extends VoucherPurchaseState {
  VoucherPurchaseNetworkErrorState();
}
