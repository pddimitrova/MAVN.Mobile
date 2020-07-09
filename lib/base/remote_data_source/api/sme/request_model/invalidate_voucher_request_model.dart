import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invalidate_voucher_request_model.g.dart';

@JsonSerializable()
class InvalidateVoucherRequestModel {
  InvalidateVoucherRequestModel({
    @required this.voucherShortCode,
    @required this.voucherValidationCode,
  });

  final String voucherShortCode;
  final String voucherValidationCode;

  Map<String, dynamic> toJson() => _$InvalidateVoucherRequestModelToJson(this);
}
