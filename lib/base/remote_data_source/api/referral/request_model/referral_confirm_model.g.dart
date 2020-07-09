// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_confirm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralConfirmRequestModel _$ReferralConfirmRequestModelFromJson(
    Map<String, dynamic> json) {
  return ReferralConfirmRequestModel(
    code: json['ConfirmationCode'] as String,
  );
}

Map<String, dynamic> _$ReferralConfirmRequestModelToJson(
        ReferralConfirmRequestModel instance) =>
    <String, dynamic>{
      'ConfirmationCode': instance.code,
    };
