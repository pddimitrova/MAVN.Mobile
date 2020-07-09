// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(Map<String, dynamic> json) {
  return RegisterRequestModel(
    email: json['Email'] as String,
    password: json['Password'] as String,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    countryOfNationalityId: json['CountryOfNationalityId'] as int,
    referralCode: json['ReferralCode'] as String,
  );
}

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'ReferralCode': instance.referralCode,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'CountryOfNationalityId': instance.countryOfNationalityId,
    };
