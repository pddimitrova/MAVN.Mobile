import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/library_models/fiat_currency.dart';
import 'package:lykke_mobile_mavn/library_ui_components/carousel/carousel.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/network_image_with_placeholder.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/null_safe_text.dart';

typedef PartnerCampaignClickCallback = void Function(CampaignResponseModel);

class PartnerOffersCarousel extends StatelessWidget {
  const PartnerOffersCarousel({
    @required this.campaigns,
    @required this.onCampaignClick,
  });

  final List<CampaignResponseModel> campaigns;
  final PartnerCampaignClickCallback onCampaignClick;

  @override
  Widget build(BuildContext context) => Carousel(
        children: campaigns.map(
          (e) => InkWell(
            child: PartnerCarouselItem(campaign: e),
            onTap: () => onCampaignClick(e),
          ),
        ),
      );
}

class PartnerCarouselItem extends StatelessWidget {
  const PartnerCarouselItem({@required this.campaign});

  final CampaignResponseModel campaign;
  static const _borderRadiusSize = 25.0;
  static const _cardHeight = 170.0;
  static const _cardWidth = 220.0;
  static const _imageHeightPercentage = 0.8;
  static const _detailsStartPercentage = 0.6;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(_borderRadiusSize),
            topRight: Radius.circular(_borderRadiusSize),
          ),
          child: Container(
            width: _cardWidth,
            height: _cardHeight,
            child: Stack(
              children: <Widget>[
                NetworkImageWithPlaceholder(
                  height: _cardHeight * _imageHeightPercentage,
                  width: _cardWidth,
                  borderRadiusSize: _borderRadiusSize,
                  imageUrl: campaign.imageUrl,
                ),
                Positioned(
                  width: _cardWidth,
                  left: 0,
                  top: _cardHeight * _detailsStartPercentage,
                  child: _buildDetails(),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildDetails() => Card(
        shadowColor: ColorStyles.cloudyBlue.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 5,
        margin: const EdgeInsets.only(right: 16),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  campaign.name,
                  style: TextStyles.darkHeadersH3
                      .copyWith(color: ColorStyles.black),
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 4),
              _PriceTag(price: campaign.price),
            ],
          ),
        ),
      );
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({@required this.price});

  final FiatCurrency price;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: ColorStyles.resolutionBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
        ),
        padding: const EdgeInsets.all(4),
        width: 70,
        child: NullSafeText(
          price?.displayValueWithSymbol,
          style: TextStyles.lightBodyBody3Regular,
        ),
      );
}
