import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_request_model.g.dart';

@JsonSerializable()
class PinRequestModel {
  PinRequestModel({
    @required this.pin,
  });

  final String pin;

  Map<String, dynamic> toJson() => _$PinRequestModelToJson(this);
}
