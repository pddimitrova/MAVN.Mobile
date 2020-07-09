// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestModel _$ResetPasswordRequestModelFromJson(
    Map<String, dynamic> json) {
  return ResetPasswordRequestModel(
    email: json['CustomerEmail'] as String,
    resetIdentifier: json['ResetIdentifier'] as String,
    password: json['Password'] as String,
  );
}

Map<String, dynamic> _$ResetPasswordRequestModelToJson(
        ResetPasswordRequestModel instance) =>
    <String, dynamic>{
      'CustomerEmail': instance.email,
      'ResetIdentifier': instance.resetIdentifier,
      'Password': instance.password,
    };
