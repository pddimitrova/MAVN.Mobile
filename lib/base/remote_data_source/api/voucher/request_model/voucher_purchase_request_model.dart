import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_purchase_request_model.g.dart';

@JsonSerializable()
class VoucherPurchaseRequestModel {
  VoucherPurchaseRequestModel({@required this.voucherId});

  @JsonKey(name: 'SmartVoucherCampaignId')
  final String voucherId;

  Map<String, dynamic> toJson() => _$VoucherPurchaseRequestModelToJson(this);
}
