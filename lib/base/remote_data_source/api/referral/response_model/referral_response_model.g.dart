// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCommonReferralResponseModel
    _$CustomerCommonReferralResponseModelFromJson(Map<String, dynamic> json) {
  return CustomerCommonReferralResponseModel(
    status: _$enumDecodeNullable(_$ReferralStatusEnumMap, json['Status']),
    referralType:
        _$enumDecodeNullable(_$ReferralTypeEnumMap, json['ReferralType']),
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    email: json['Email'] as String,
    partnerName: json['PartnerName'] as String,
    timeStamp: json['TimeStamp'] == null
        ? null
        : DateTime.parse(json['TimeStamp'] as String),
    totalReward:
        const TokenCurrencyConverter().fromJson(json['TotalReward'] as String),
    currentRewardedAmount: const TokenCurrencyConverter()
        .fromJson(json['CurrentRewardedAmount'] as String),
    rewardHasRatio: json['RewardHasRatio'] as bool,
    rewardRatio: json['RewardRatio'] == null
        ? null
        : RewardRatio.fromJson(json['RewardRatio'] as Map<String, dynamic>),
    hasStaking: json['HasStaking'] as bool,
    staking: json['Staking'] == null
        ? null
        : ReferralStaking.fromJson(json['Staking'] as Map<String, dynamic>),
    isApproximate: json['IsApproximate'] as bool,
  );
}

Map<String, dynamic> _$CustomerCommonReferralResponseModelToJson(
        CustomerCommonReferralResponseModel instance) =>
    <String, dynamic>{
      'Status': _$ReferralStatusEnumMap[instance.status],
      'ReferralType': _$ReferralTypeEnumMap[instance.referralType],
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'PartnerName': instance.partnerName,
      'TimeStamp': instance.timeStamp?.toIso8601String(),
      'TotalReward':
          const TokenCurrencyConverter().toJson(instance.totalReward),
      'CurrentRewardedAmount':
          const TokenCurrencyConverter().toJson(instance.currentRewardedAmount),
      'RewardHasRatio': instance.rewardHasRatio,
      'RewardRatio': instance.rewardRatio?.toJson(),
      'HasStaking': instance.hasStaking,
      'Staking': instance.staking?.toJson(),
      'IsApproximate': instance.isApproximate,
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

const _$ReferralStatusEnumMap = {
  ReferralStatus.ongoing: 'Ongoing',
  ReferralStatus.accepted: 'Accepted',
  ReferralStatus.expired: 'Expired',
};

const _$ReferralTypeEnumMap = {
  ReferralType.hospitality: 'Hospitality',
  ReferralType.realEstate: 'RealEstate',
  ReferralType.retail: 'Retail',
  ReferralType.friend: 'Friend',
};

ReferralStaking _$ReferralStakingFromJson(Map<String, dynamic> json) {
  return ReferralStaking(
    stakeAmount:
        const TokenCurrencyConverter().fromJson(json['StakeAmount'] as String),
    stakingExpirationDate: json['StakingExpirationDate'] == null
        ? null
        : DateTime.parse(json['StakingExpirationDate'] as String),
  );
}

Map<String, dynamic> _$ReferralStakingToJson(ReferralStaking instance) =>
    <String, dynamic>{
      'StakeAmount':
          const TokenCurrencyConverter().toJson(instance.stakeAmount),
      'StakingExpirationDate':
          instance.stakingExpirationDate?.toIso8601String(),
    };

RewardRatio _$RewardRatioFromJson(Map<String, dynamic> json) {
  return RewardRatio(
    ratios: (json['Ratios'] as List)
        ?.map(
            (e) => e == null ? null : Ratio.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ratioCompletions: (json['RatioCompletion'] as List)
        ?.map((e) => e == null
            ? null
            : RatioCompletion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RewardRatioToJson(RewardRatio instance) =>
    <String, dynamic>{
      'Ratios': instance.ratios?.map((e) => e?.toJson())?.toList(),
      'RatioCompletion':
          instance.ratioCompletions?.map((e) => e?.toJson())?.toList(),
    };

Ratio _$RatioFromJson(Map<String, dynamic> json) {
  return Ratio(
    order: json['Order'] as int,
    rewardRatio: (json['RewardRatio'] as num)?.toDouble(),
    paymentRatio: (json['PaymentRatio'] as num)?.toDouble(),
    threshold: (json['Threshold'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RatioToJson(Ratio instance) => <String, dynamic>{
      'Order': instance.order,
      'RewardRatio': instance.rewardRatio,
      'PaymentRatio': instance.paymentRatio,
      'Threshold': instance.threshold,
    };

RatioCompletion _$RatioCompletionFromJson(Map<String, dynamic> json) {
  return RatioCompletion(
    json['PaymentId'] as String,
    json['Name'] as String,
    (json['GivenThreshold'] as num)?.toDouble(),
    json['Checkpoint'] as int,
  );
}

Map<String, dynamic> _$RatioCompletionToJson(RatioCompletion instance) =>
    <String, dynamic>{
      'PaymentId': instance.id,
      'Name': instance.name,
      'GivenThreshold': instance.givenThreshold,
      'Checkpoint': instance.checkpoint,
    };
