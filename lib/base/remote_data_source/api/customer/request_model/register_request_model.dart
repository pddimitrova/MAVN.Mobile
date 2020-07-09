import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  RegisterRequestModel({
    @required this.email,
    @required this.password,
    @required this.firstName,
    @required this.lastName,
    this.countryOfNationalityId,
    this.referralCode = '',
  });

  final String email;
  final String password;
  final String referralCode;
  final String firstName;
  final String lastName;
  final int countryOfNationalityId;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
