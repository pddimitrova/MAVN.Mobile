import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_referral_model.g.dart';

@JsonSerializable()
class FriendReferralRequestModel {
  FriendReferralRequestModel({
    @required this.fullName,
    @required this.email,
    @required this.earnRuleId,
  });

  final String fullName;
  final String email;
  @JsonKey(name: 'CampaignId')
  final String earnRuleId;

  Map<String, dynamic> toJson() => _$FriendReferralRequestModelToJson(this);
}
