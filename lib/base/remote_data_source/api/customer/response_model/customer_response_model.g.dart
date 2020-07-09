// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponseModel _$CustomerResponseModelFromJson(
    Map<String, dynamic> json) {
  return CustomerResponseModel(
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    phoneCountryCode: json['CountryPhoneCode'] as String,
    phoneCountryCodeId: json['CountryPhoneCodeId'] as int,
    email: json['Email'] as String,
    isEmailVerified: json['IsEmailVerified'] as bool,
    isPhoneNumberVerified: json['IsPhoneNumberVerified'] as bool,
    isAccountBlocked: json['IsAccountBlocked'] as bool,
    countryOfNationalityId: json['CountryOfNationalityId'] as int,
    countryOfNationalityName: json['CountryOfNationalityName'] as String,
    hasPin: json['HasPin'] as bool,
    linkedPartnerId: json['LinkedPartnerId'] as String,
  );
}

Map<String, dynamic> _$CustomerResponseModelToJson(
        CustomerResponseModel instance) =>
    <String, dynamic>{
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'PhoneNumber': instance.phoneNumber,
      'CountryPhoneCode': instance.phoneCountryCode,
      'CountryPhoneCodeId': instance.phoneCountryCodeId,
      'Email': instance.email,
      'IsEmailVerified': instance.isEmailVerified,
      'IsAccountBlocked': instance.isAccountBlocked,
      'IsPhoneNumberVerified': instance.isPhoneNumberVerified,
      'CountryOfNationalityId': instance.countryOfNationalityId,
      'CountryOfNationalityName': instance.countryOfNationalityName,
      'HasPin': instance.hasPin,
      'LinkedPartnerId': instance.linkedPartnerId,
    };
