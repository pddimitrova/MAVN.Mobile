// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneVerificationRequestModel _$PhoneVerificationRequestModelFromJson(
    Map<String, dynamic> json) {
  return PhoneVerificationRequestModel(
    verificationCode: json['VerificationCode'] as String,
  );
}

Map<String, dynamic> _$PhoneVerificationRequestModelToJson(
        PhoneVerificationRequestModel instance) =>
    <String, dynamic>{
      'VerificationCode': instance.verificationCode,
    };
