import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_phone_number_request_model.g.dart';

@JsonSerializable()
class SetPhoneNumberRequestModel {
  SetPhoneNumberRequestModel({
    @required this.phoneNumber,
    @required this.countryPhoneCodeId,
  });

  final String phoneNumber;
  final int countryPhoneCodeId;

  Map<String, dynamic> toJson() => _$SetPhoneNumberRequestModelToJson(this);
}
