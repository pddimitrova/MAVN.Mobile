import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'change_password_response_model.g.dart';

@JsonSerializable()
class ChangePasswordResponseModel {
  ChangePasswordResponseModel({@required this.token});

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);

  final String token;
}
