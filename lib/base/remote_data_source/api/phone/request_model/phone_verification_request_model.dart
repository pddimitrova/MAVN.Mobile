import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_verification_request_model.g.dart';

@JsonSerializable()
class PhoneVerificationRequestModel {
  PhoneVerificationRequestModel({@required this.verificationCode});

  final String verificationCode;

  Map<String, dynamic> toJson() => _$PhoneVerificationRequestModelToJson(this);
}
