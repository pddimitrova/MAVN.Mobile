import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_referral_model.g.dart';

@JsonSerializable()
class HotelReferralRequestModel {
  HotelReferralRequestModel({
    @required this.fullName,
    @required this.email,
    @required this.countryPhoneCodeId,
    @required this.phoneNumber,
    @required this.earnRuleId,
  });

  final String fullName;
  final String email;
  final int countryPhoneCodeId;
  final String phoneNumber;
  @JsonKey(name: 'CampaignId')
  final String earnRuleId;

  Map<String, dynamic> toJson() => _$HotelReferralRequestModelToJson(this);
}
