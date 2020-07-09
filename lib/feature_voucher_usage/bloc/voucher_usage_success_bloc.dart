import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/dependency_injection/app_module.dart';
import 'package:lykke_mobile_mavn/feature_voucher_usage/bloc/voucher_usage_success_bloc_output.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';

class VoucherUsageSuccessBloc extends Bloc<VoucherUsageSuccessState> {
  @override
  VoucherUsageSuccessState initialState() => VoucherUsageSuccessInitialState();

  Future<void> markVoucherAsUsed() async {
    sendEvent(VoucherUsageSuccessEvent());
  }
}

VoucherUsageSuccessBloc useVoucherUsageSuccessBloc() =>
    ModuleProvider.of<AppModule>(useContext()).voucherUsageSuccessBloc;
