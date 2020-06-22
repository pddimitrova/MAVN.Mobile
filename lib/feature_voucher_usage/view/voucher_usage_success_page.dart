import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/svg_assets.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_utility/result_feedback/view/result_feedback_page.dart';
import 'package:lykke_mobile_mavn/feature_voucher_usage/bloc/voucher_usage_success_bloc.dart';

class VoucherUsageSuccessPage extends HookWidget {
  const VoucherUsageSuccessPage({
    @required this.voucherShortCode,
    @required this.partnerName,
  });

  final String voucherShortCode;
  final String partnerName;

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final localizedStrings = useLocalizedStrings();
    final voucherUsageSuccessBloc = useVoucherUsageSuccessBloc();

    useEffect(() {
      voucherUsageSuccessBloc.markVoucherAsUsed();
    }, [voucherUsageSuccessBloc]);

    return ResultFeedbackPage(
      widgetKey: const Key('voucherUsageSuccessWidget'),
      details: localizedStrings.voucherUsageSuccessDetails(
        voucherShortCode,
        partnerName,
      ),
      title: localizedStrings.voucherUsageSuccessPageTitle,
      buttonText: localizedStrings.goBack,
      onButtonTap: router.popToRoot,
      endIcon: SvgAssets.success,
    );
  }
}
