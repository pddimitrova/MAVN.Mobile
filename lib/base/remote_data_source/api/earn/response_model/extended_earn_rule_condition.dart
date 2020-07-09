import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/common/offer_type.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/customer/response_model/partner_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_condition_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_response_model.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';

part 'extended_earn_rule_condition.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class ExtendedEarnRuleCondition extends EarnRuleCondition {
  ExtendedEarnRuleCondition({
    @required this.partners,
    @required this.customerCompletionCount,
    @required String id,
    @required EarnRuleConditionType type,
    @required OfferVertical vertical,
    @required String displayName,
    @required TokenCurrency immediateReward,
    @required int completionCount,
    @required bool hasStaking,
    @required TokenCurrency stakeAmount,
    @required int stakingPeriod,
    @required int stakeWarningPeriod,
    @required double stakingRule,
    @required double burningRule,
    @required RewardType rewardType,
    @required TokenCurrency amountInTokens,
    @required double amountInCurrency,
    @required bool usePartnerCurrencyRate,
  }) : super(
          id: id,
          type: type,
          vertical: vertical,
          displayName: displayName,
          immediateReward: immediateReward,
          completionCount: completionCount,
          hasStaking: hasStaking,
          stakeAmount: stakeAmount,
          stakingPeriod: stakingPeriod,
          stakeWarningPeriod: stakeWarningPeriod,
          stakingRule: stakingRule,
          burningRule: burningRule,
          rewardType: rewardType,
          amountInTokens: amountInTokens,
          amountInCurrency: amountInCurrency,
          usePartnerCurrencyRate: usePartnerCurrencyRate,
        );

  factory ExtendedEarnRuleCondition.fromJson(Map<String, dynamic> json) =>
      _$ExtendedEarnRuleConditionFromJson(json);

  @JsonKey(defaultValue: [])
  final List<Partner> partners;
  final int customerCompletionCount;
}
