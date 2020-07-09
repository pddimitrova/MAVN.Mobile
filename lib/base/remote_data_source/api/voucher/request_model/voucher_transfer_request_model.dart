import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_transfer_request_model.g.dart';

@JsonSerializable()
class VoucherTransferRequestModel {
  VoucherTransferRequestModel({
    @required this.receiverEmail,
    @required this.voucherShortCode,
  });

  final String receiverEmail;
  final String voucherShortCode;

  Map<String, dynamic> toJson() => _$VoucherTransferRequestModelToJson(this);
}
