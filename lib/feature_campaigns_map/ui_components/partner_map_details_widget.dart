import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/feature_transaction_history/ui_components/initials_widget.dart';

class PartnerMapDetailsWidget extends StatelessWidget {
  const PartnerMapDetailsWidget({
    @required this.partnerName,
    @required this.partnerLocationAddress,
  });

  final String partnerName;
  final String partnerLocationAddress;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 76,
              width: 76,
              child: InitialsWidget(
                initialsText: partnerName,
                color: ColorStyles.resolutionBlue,
                textColor: ColorStyles.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  partnerName,
                  style: TextStyles.partnerNameTopSection,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                AutoSizeText(
                  partnerLocationAddress ?? '',
                  style: TextStyles.body3Light
                      .copyWith(color: ColorStyles.silverChalice),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      );
}
