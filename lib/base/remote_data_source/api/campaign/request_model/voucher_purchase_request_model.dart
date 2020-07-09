import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_purchase_request_model.g.dart';

@JsonSerializable()
class VoucherPurchaseRequestModel {
  VoucherPurchaseRequestModel({@required this.campaignId});

  @JsonKey(name: 'SmartVoucherCampaignId')
  final String campaignId;

  Map<String, dynamic> toJson() => _$VoucherPurchaseRequestModelToJson(this);
}
