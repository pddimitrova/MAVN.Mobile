import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_condition_response_model.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';

part 'earn_rule_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class EarnRule {
  const EarnRule({
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

  factory EarnRule.fromJson(Map<String, dynamic> json) =>
      _$EarnRuleFromJson(json);

  final String id;
  final String title;
  @JsonKey(defaultValue: EarnRuleStatus.inactive)
  final EarnRuleStatus status;
  final String description;
  final String imageUrl;
  final TokenCurrency reward;
  final TokenCurrency approximateAward;
  @JsonKey(nullable: true, defaultValue: false)
  final bool isApproximate;
  @JsonKey(defaultValue: RewardType.fixed)
  final RewardType rewardType;
  final String fromDate;
  final String toDate;
  final String createdBy;
  final String creationDate;
  final int completionCount;
  @JsonKey(defaultValue: [])
  final List<EarnRuleCondition> conditions;
  @JsonKey(defaultValue: [])
  final List<EarnRuleCondition> optionalConditions;
}

enum EarnRuleStatus {
  @JsonValue('Pending')
  pending,
  @JsonValue('Active')
  active,
  @JsonValue('Completed')
  completed,
  @JsonValue('Inactive')
  inactive
}

enum RewardType {
  @JsonValue('Fixed')
  fixed,
  @JsonValue('Percentage')
  percentage,
  @JsonValue('ConversionRate')
  conversionRate
}
