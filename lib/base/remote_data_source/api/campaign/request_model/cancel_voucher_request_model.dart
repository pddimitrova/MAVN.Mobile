import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cancel_voucher_request_model.g.dart';

@JsonSerializable()
class CancelVoucherRequestModel {
  CancelVoucherRequestModel({@required this.shortCode});

  final String shortCode;

  Map<String, dynamic> toJson() => _$CancelVoucherRequestModelToJson(this);
}
