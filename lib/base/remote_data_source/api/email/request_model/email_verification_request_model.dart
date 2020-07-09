import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request_model.g.dart';

@JsonSerializable()
class EmailVerificationRequestModel {
  EmailVerificationRequestModel({this.verificationCode});

  final String verificationCode;

  Map<String, dynamic> toJson() => _$EmailVerificationRequestModelToJson(this);
}
