// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequestModel _$EmailVerificationRequestModelFromJson(
    Map<String, dynamic> json) {
  return EmailVerificationRequestModel(
    verificationCode: json['VerificationCode'] as String,
  );
}

Map<String, dynamic> _$EmailVerificationRequestModelToJson(
        EmailVerificationRequestModel instance) =>
    <String, dynamic>{
      'VerificationCode': instance.verificationCode,
    };
