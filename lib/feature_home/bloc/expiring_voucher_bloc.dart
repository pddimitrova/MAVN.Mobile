import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/generic_details_bloc.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/voucher/response_model/voucher_response_model.dart';
import 'package:lykke_mobile_mavn/base/repository/voucher/voucher_repository.dart';
import 'package:lykke_mobile_mavn/feature_home/di/home_page_module.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';

export 'package:lykke_mobile_mavn/feature_payment_request/bloc/payment_request_details_bloc_output.dart';

class ExpiringVoucherBloc extends GenericDetailsBloc<VoucherResponseModel> {
  ExpiringVoucherBloc(this._voucherRepository);

  final VoucherRepository _voucherRepository;

  @override
  Future<VoucherResponseModel> loadData(String identifier) =>
      _voucherRepository.getExpiringVoucher();
}

ExpiringVoucherBloc useExpiringVoucherBloc() =>
    ModuleProvider.of<HomePageModule>(useContext()).expiringVoucherBloc;
