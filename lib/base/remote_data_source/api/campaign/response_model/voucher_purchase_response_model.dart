import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_purchase_response_model.g.dart';

@JsonSerializable()
class VoucherPurchaseResponseModel {
  VoucherPurchaseResponseModel({
    @required this.paymentUrl,
    @required this.errorCode,
    this.reservedVoucherShortCode,
  });

  factory VoucherPurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherPurchaseResponseModelFromJson(json);

  final String paymentUrl;
  @JsonKey(nullable: true)
  @JsonKey(defaultValue: null)
  final VoucherPurchaseErrorCode errorCode;
  @JsonKey(name: 'AlreadyReservedVoucherShortCode')
  final String reservedVoucherShortCode;
}

enum VoucherPurchaseErrorCode {
  @JsonValue('None')
  none,
  @JsonValue('CustomerHaveAnotherReservedVoucher ')
  customerHaveAnotherReservedVoucher,
}
