import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/generic_details_bloc_state.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/feature_campaign_list/ui_components/campaign_widget.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/campaign_of_day_bloc.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/material_hero.dart';

class CampaignOfDayWidget extends HookWidget {
  static const campaignOfDayHeight = 140.0;
  static const campaignOfDayHeroTag = 'campaign_of_day_';

  @override
  Widget build(BuildContext context) {
    final localizedStrings = useLocalizedStrings();
    final router = useRouter();

    final campaignOfDayBloc = useCampaignOfDayBloc();
    final campaignOfDayState = useBlocState(campaignOfDayBloc);

    if (campaignOfDayState is GenericDetailsLoadedState) {
      final campaign = campaignOfDayState.details as CampaignResponseModel;
      return Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: ColorStyles.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: campaignOfDayHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  localizedStrings.campaignOfDay,
                  style: TextStyles.darkHeadersH3,
                  textAlign: TextAlign.start,
                ),
              ),
              InkWell(
                onTap: () => router.pushCampaignDetailsPage(
                  campaign: campaign,
                  heroTag: campaignOfDayHeroTag,
                ),
                child: MaterialHero(
                  tag: '$campaignOfDayHeroTag${campaign.id}',
                  child: CampaignWidget(
                    title: campaign.name,
                    imageUrl: campaign.imageUrl,
                    price: campaign.price,
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
