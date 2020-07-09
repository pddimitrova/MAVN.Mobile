import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';

part 'earn_rule_staking_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class EarnRuleStakingResponseModel {
  EarnRuleStakingResponseModel({
    @required this.referralId,
    @required this.referralName,
    @required this.stakeAmount,
    @required this.totalReward,
    @required this.stakingPeriod,
    @required this.stakeWarningPeriod,
    @required this.stakingRule,
    @required this.date,
  });

  factory EarnRuleStakingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EarnRuleStakingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EarnRuleStakingResponseModelToJson(this);

  final String referralId;
  final String referralName;
  final TokenCurrency stakeAmount;
  final TokenCurrency totalReward;
  final int stakingPeriod;
  final int stakeWarningPeriod;
  final double stakingRule;
  @JsonKey(name: 'Timestamp')
  final String date;
}

@JsonSerializable(explicitToJson: true)
class EarnRuleStakingListResponseModel {
  EarnRuleStakingListResponseModel({this.totalCount, this.earnRuleStakings});

  factory EarnRuleStakingListResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$EarnRuleStakingListResponseModelFromJson(json);

  final int totalCount;
  @JsonKey(defaultValue: [])
  final List<EarnRuleStakingResponseModel> earnRuleStakings;
}
