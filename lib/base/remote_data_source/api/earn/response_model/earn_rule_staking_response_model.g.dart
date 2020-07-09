// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earn_rule_staking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarnRuleStakingResponseModel _$EarnRuleStakingResponseModelFromJson(
    Map<String, dynamic> json) {
  return EarnRuleStakingResponseModel(
    referralId: json['ReferralId'] as String,
    referralName: json['ReferralName'] as String,
    stakeAmount:
        const TokenCurrencyConverter().fromJson(json['StakeAmount'] as String),
    totalReward:
        const TokenCurrencyConverter().fromJson(json['TotalReward'] as String),
    stakingPeriod: json['StakingPeriod'] as int,
    stakeWarningPeriod: json['StakeWarningPeriod'] as int,
    stakingRule: (json['StakingRule'] as num)?.toDouble(),
    date: json['Timestamp'] as String,
  );
}

Map<String, dynamic> _$EarnRuleStakingResponseModelToJson(
        EarnRuleStakingResponseModel instance) =>
    <String, dynamic>{
      'ReferralId': instance.referralId,
      'ReferralName': instance.referralName,
      'StakeAmount':
          const TokenCurrencyConverter().toJson(instance.stakeAmount),
      'TotalReward':
          const TokenCurrencyConverter().toJson(instance.totalReward),
      'StakingPeriod': instance.stakingPeriod,
      'StakeWarningPeriod': instance.stakeWarningPeriod,
      'StakingRule': instance.stakingRule,
      'Timestamp': instance.date,
    };

EarnRuleStakingListResponseModel _$EarnRuleStakingListResponseModelFromJson(
    Map<String, dynamic> json) {
  return EarnRuleStakingListResponseModel(
    totalCount: json['TotalCount'] as int,
    earnRuleStakings: (json['EarnRuleStakings'] as List)
            ?.map((e) => e == null
                ? null
                : EarnRuleStakingResponseModel.fromJson(
                    e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$EarnRuleStakingListResponseModelToJson(
        EarnRuleStakingListResponseModel instance) =>
    <String, dynamic>{
      'TotalCount': instance.totalCount,
      'EarnRuleStakings':
          instance.earnRuleStakings?.map((e) => e?.toJson())?.toList(),
    };
