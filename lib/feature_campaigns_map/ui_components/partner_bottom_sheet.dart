import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/ui_components/bottom_sheet_blip.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/ui_components/partner_map_details_widget.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/ui_components/partner_offers_carousel.dart';

class PartnerBottomSheet extends HookWidget {
  const PartnerBottomSheet({
    @required this.partnerName,
    @required this.partnerLocationAddress,
    @required this.campaigns,
  });

  final String partnerName;
  final String partnerLocationAddress;
  final List<CampaignResponseModel> campaigns;

  @override
  Widget build(BuildContext context) {
    final router = useRouter();

    void onCampaignClick(CampaignResponseModel campaign) {
      router.pushCampaignDetailsPage(campaign: campaign);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 12),
          BottomSheetBlip(),
          const SizedBox(height: 18),
          PartnerMapDetailsWidget(
            partnerName: partnerName,
            partnerLocationAddress: partnerLocationAddress,
          ),
          const SizedBox(height: 36),
          Flexible(
            child: PartnerOffersCarousel(
              campaigns: campaigns,
              onCampaignClick: onCampaignClick,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
