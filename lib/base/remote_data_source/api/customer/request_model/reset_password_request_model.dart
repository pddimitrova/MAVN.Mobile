import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable()
class ResetPasswordRequestModel {
  ResetPasswordRequestModel({
    @required this.email,
    @required this.resetIdentifier,
    @required this.password,
  });

  @JsonKey(name: 'CustomerEmail')
  final String email;
  final String resetIdentifier;
  final String password;

  Map<String, String> toJson() => _$ResetPasswordRequestModelToJson(this);
}
