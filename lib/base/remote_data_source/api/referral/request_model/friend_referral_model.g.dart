// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_referral_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendReferralRequestModel _$FriendReferralRequestModelFromJson(
    Map<String, dynamic> json) {
  return FriendReferralRequestModel(
    fullName: json['FullName'] as String,
    email: json['Email'] as String,
    earnRuleId: json['CampaignId'] as String,
  );
}

Map<String, dynamic> _$FriendReferralRequestModelToJson(
        FriendReferralRequestModel instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'Email': instance.email,
      'CampaignId': instance.earnRuleId,
    };
