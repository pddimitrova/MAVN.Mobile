// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_referral_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelReferralRequestModel _$HotelReferralRequestModelFromJson(
    Map<String, dynamic> json) {
  return HotelReferralRequestModel(
    fullName: json['FullName'] as String,
    email: json['Email'] as String,
    countryPhoneCodeId: json['CountryPhoneCodeId'] as int,
    phoneNumber: json['PhoneNumber'] as String,
    earnRuleId: json['CampaignId'] as String,
  );
}

Map<String, dynamic> _$HotelReferralRequestModelToJson(
        HotelReferralRequestModel instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'Email': instance.email,
      'CountryPhoneCodeId': instance.countryPhoneCodeId,
      'PhoneNumber': instance.phoneNumber,
      'CampaignId': instance.earnRuleId,
    };
