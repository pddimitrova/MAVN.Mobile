// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_phone_number_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPhoneNumberRequestModel _$SetPhoneNumberRequestModelFromJson(
    Map<String, dynamic> json) {
  return SetPhoneNumberRequestModel(
    phoneNumber: json['PhoneNumber'] as String,
    countryPhoneCodeId: json['CountryPhoneCodeId'] as int,
  );
}

Map<String, dynamic> _$SetPhoneNumberRequestModelToJson(
        SetPhoneNumberRequestModel instance) =>
    <String, dynamic>{
      'PhoneNumber': instance.phoneNumber,
      'CountryPhoneCodeId': instance.countryPhoneCodeId,
    };
