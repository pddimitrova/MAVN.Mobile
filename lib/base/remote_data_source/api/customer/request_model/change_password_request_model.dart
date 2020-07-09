import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordRequestModel {
  ChangePasswordRequestModel({this.password});

  final String password;

  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);
}
