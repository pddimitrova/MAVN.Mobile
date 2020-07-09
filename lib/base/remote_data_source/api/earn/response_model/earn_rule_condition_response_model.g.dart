// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earn_rule_condition_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarnRuleCondition _$EarnRuleConditionFromJson(Map<String, dynamic> json) {
  return EarnRuleCondition(
    id: json['Id'] as String,
    type:
        EarnRuleCondition.earnRuleConditionTypeFromJson(json['Type'] as String),
    vertical: _$enumDecodeNullable(_$OfferVerticalEnumMap, json['Vertical']),
    displayName: json['DisplayName'] as String,
    immediateReward: const TokenCurrencyConverter()
        .fromJson(json['ImmediateReward'] as String),
    completionCount: json['CompletionCount'] as int,
    hasStaking: json['HasStaking'] as bool,
    stakeAmount:
        const TokenCurrencyConverter().fromJson(json['StakeAmount'] as String),
    stakingPeriod: json['StakingPeriod'] as int,
    stakeWarningPeriod: json['StakeWarningPeriod'] as int,
    stakingRule: (json['StakingRule'] as num)?.toDouble(),
    burningRule: (json['BurningRule'] as num)?.toDouble(),
    rewardType: _$enumDecodeNullable(_$RewardTypeEnumMap, json['RewardType']),
    amountInTokens: const TokenCurrencyConverter()
        .fromJson(json['AmountInTokens'] as String),
    amountInCurrency: (json['AmountInCurrency'] as num)?.toDouble(),
    usePartnerCurrencyRate: json['UsePartnerCurrencyRate'] as bool,
  );
}

Map<String, dynamic> _$EarnRuleConditionToJson(EarnRuleCondition instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Type': EarnRuleCondition.earnRuleConditionTypeToJson(instance.type),
      'Vertical': _$OfferVerticalEnumMap[instance.vertical],
      'DisplayName': instance.displayName,
      'ImmediateReward':
          const TokenCurrencyConverter().toJson(instance.immediateReward),
      'CompletionCount': instance.completionCount,
      'HasStaking': instance.hasStaking,
      'StakeAmount':
          const TokenCurrencyConverter().toJson(instance.stakeAmount),
      'StakingPeriod': instance.stakingPeriod,
      'StakeWarningPeriod': instance.stakeWarningPeriod,
      'StakingRule': instance.stakingRule,
      'BurningRule': instance.burningRule,
      'RewardType': _$RewardTypeEnumMap[instance.rewardType],
      'AmountInTokens':
          const TokenCurrencyConverter().toJson(instance.amountInTokens),
      'AmountInCurrency': instance.amountInCurrency,
      'UsePartnerCurrencyRate': instance.usePartnerCurrencyRate,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OfferVerticalEnumMap = {
  OfferVertical.hospitality: 'Hospitality',
  OfferVertical.realEstate: 'RealEstate',
  OfferVertical.retail: 'Retail',
};

const _$RewardTypeEnumMap = {
  RewardType.fixed: 'Fixed',
  RewardType.percentage: 'Percentage',
  RewardType.conversionRate: 'ConversionRate',
};
