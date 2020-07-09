// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earn_rule_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarnRule _$EarnRuleFromJson(Map<String, dynamic> json) {
  return EarnRule(
    id: json['Id'] as String,
    title: json['Title'] as String,
    status: _$enumDecodeNullable(_$EarnRuleStatusEnumMap, json['Status']) ??
        EarnRuleStatus.inactive,
    description: json['Description'] as String,
    imageUrl: json['ImageUrl'] as String,
    reward: const TokenCurrencyConverter().fromJson(json['Reward'] as String),
    rewardType: _$enumDecodeNullable(_$RewardTypeEnumMap, json['RewardType']) ??
        RewardType.fixed,
    fromDate: json['FromDate'] as String,
    toDate: json['ToDate'] as String,
    createdBy: json['CreatedBy'] as String,
    creationDate: json['CreationDate'] as String,
    completionCount: json['CompletionCount'] as int,
    conditions: (json['Conditions'] as List)
            ?.map((e) => e == null
                ? null
                : EarnRuleCondition.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    optionalConditions: (json['OptionalConditions'] as List)
            ?.map((e) => e == null
                ? null
                : EarnRuleCondition.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    isApproximate: json['IsApproximate'] as bool ?? false,
    approximateAward: const TokenCurrencyConverter()
        .fromJson(json['ApproximateAward'] as String),
  );
}

Map<String, dynamic> _$EarnRuleToJson(EarnRule instance) => <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Status': _$EarnRuleStatusEnumMap[instance.status],
      'Description': instance.description,
      'ImageUrl': instance.imageUrl,
      'Reward': const TokenCurrencyConverter().toJson(instance.reward),
      'ApproximateAward':
          const TokenCurrencyConverter().toJson(instance.approximateAward),
      'IsApproximate': instance.isApproximate,
      'RewardType': _$RewardTypeEnumMap[instance.rewardType],
      'FromDate': instance.fromDate,
      'ToDate': instance.toDate,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'CompletionCount': instance.completionCount,
      'Conditions': instance.conditions?.map((e) => e?.toJson())?.toList(),
      'OptionalConditions':
          instance.optionalConditions?.map((e) => e?.toJson())?.toList(),
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

const _$EarnRuleStatusEnumMap = {
  EarnRuleStatus.pending: 'Pending',
  EarnRuleStatus.active: 'Active',
  EarnRuleStatus.completed: 'Completed',
  EarnRuleStatus.inactive: 'Inactive',
};

const _$RewardTypeEnumMap = {
  RewardType.fixed: 'Fixed',
  RewardType.percentage: 'Percentage',
  RewardType.conversionRate: 'ConversionRate',
};
