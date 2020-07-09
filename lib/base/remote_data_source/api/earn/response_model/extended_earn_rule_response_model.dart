import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_condition_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/extended_earn_rule_condition.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';
part 'extended_earn_rule_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class ExtendedEarnRule {
  ExtendedEarnRule({
    @required this.amountInTokens,
    @required this.amountInCurrency,
    @required this.customerCompletionCount,
    @required this.currentRewardedAmount,
    @required this.id,
    @required this.title,
    @required this.status,
    @required this.description,
    @required this.imageUrl,
    @required this.reward,
    @required this.rewardType,
    @required this.fromDate,
    @required this.toDate,
    @required this.createdBy,
    @required this.creationDate,
    @required this.completionCount,
    @required this.conditions,
    @required this.optionalConditions,
    @required this.isApproximate,
    this.approximateAward,
  });

  factory ExtendedEarnRule.fromJson(Map<String, dynamic> json) =>
      _$ExtendedEarnRuleFromJson(json);

  final String id;
  final String title;
  @JsonKey(defaultValue: EarnRuleStatus.inactive)
  final EarnRuleStatus status;
  final String description;
  final String imageUrl;
  final TokenCurrency reward;
  final TokenCurrency approximateAward;
  final bool isApproximate;
  @JsonKey(defaultValue: RewardType.fixed)
  final RewardType rewardType;
  final String fromDate;
  final String toDate;
  final String createdBy;
  final String creationDate;
  final int completionCount;
  @JsonKey(defaultValue: [])
  final List<ExtendedEarnRuleCondition> conditions;
  @JsonKey(defaultValue: [])
  final List<ExtendedEarnRuleCondition> optionalConditions;
  final TokenCurrency amountInTokens;
  final double amountInCurrency;
  final int customerCompletionCount;
  final TokenCurrency currentRewardedAmount;

  bool isHospitalityOffer() {
    final type = conditions?.first?.type;

    if (conditions?.first?.type == null) {
      return false;
    }

    return type == EarnRuleConditionType.hotelStayReferral ||
        type == EarnRuleConditionType.hotelStay;
  }
}
