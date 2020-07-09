import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/gradient_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/generic_details_bloc_state.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/voucher/response_model/voucher_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/expiring_voucher_bloc.dart';
import 'package:lykke_mobile_mavn/feature_voucher_wallet/ui_components/voucher_card_widget.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_extensions/date_extensions.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/material_hero.dart';

class ExpiringVoucherWidget extends HookWidget {
  static const expiringVoucherHeight = 240.0;
  static const expiringVoucherHeroTag = 'expiring_voucher_';

  @override
  Widget build(BuildContext context) {
    final localizedStrings = useLocalizedStrings();
    final router = useRouter();
    final expiringVoucherBloc = useExpiringVoucherBloc();
    final expiringVoucherState = useBlocState(expiringVoucherBloc);

    if (expiringVoucherState is GenericDetailsLoadedState) {
      final voucher = expiringVoucherState.details as VoucherResponseModel;
      return Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ColorStyles.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: expiringVoucherHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: ColorStyles.gray),
                          gradient: GradientStyles.shadowGradient),
                      child: Text(
                        DateTime.now()
                            .daysUntil(voucher.expirationDate)
                            .abs()
                            .toString(),
                        style: TextStyles.darkHeadersH3,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      localizedStrings.untilExpiryDate,
                      style: TextStyles.darkHeadersH3,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => router.pushVoucherDetailsPage(
                  voucherShortCode: voucher.shortCode,
                  voucher: voucher,
                  heroTag: expiringVoucherHeroTag,
                ),
                child: MaterialHero(
                  tag: '$expiringVoucherHeroTag${voucher.id}',
                  child: VoucherCardWidget(
                    imageUrl: voucher.imageUrl,
                    partnerName: voucher.partnerName,
                    voucherName: voucher.campaignName,
                    expirationDate: voucher.expirationDate,
                    purchaseDate: voucher.purchaseDate,
                    voucherStatus: voucher.status,
                    price: voucher.price,
                    color: ColorStyles.blueStone,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Container();
  }
}
