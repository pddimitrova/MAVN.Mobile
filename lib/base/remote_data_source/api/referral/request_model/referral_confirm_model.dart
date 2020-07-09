import 'package:json_annotation/json_annotation.dart';

part 'referral_confirm_model.g.dart';

@JsonSerializable()
class ReferralConfirmRequestModel {
  ReferralConfirmRequestModel({this.code});

  @JsonKey(name: 'ConfirmationCode')
  final String code;

  Map<String, dynamic> toJson() => _$ReferralConfirmRequestModelToJson(this);
}
