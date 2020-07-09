import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_reset_password_link_request_model.g.dart';

@JsonSerializable()
class GenerateResetPasswordLinkRequestModel {
  GenerateResetPasswordLinkRequestModel({@required this.email});

  final String email;

  Map<String, String> toJson() =>
      _$GenerateResetPasswordLinkRequestModelToJson(this);
}
