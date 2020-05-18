import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/svg_assets.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_utility/result_feedback/view/result_feedback_page.dart';

class SetPasswordSuccessPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    return ResultFeedbackPage(
      widgetKey: const Key('setPasswordSuccessWidget'),
      title: LocalizedStrings.setPasswordSuccessTitle,
      details: LocalizedStrings.setPasswordSuccessDetails,
      buttonText: LocalizedStrings.setPasswordSuccessBackToAccountButton,
      onButtonTap: router.navigateToLoginPage,
      endIcon: SvgAssets.success,
      hasLogo: true,
      hasBackButton: false,
    );
  }
}
