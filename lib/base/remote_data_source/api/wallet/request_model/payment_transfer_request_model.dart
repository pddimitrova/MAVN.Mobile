import 'package:json_annotation/json_annotation.dart';

part 'payment_transfer_request_model.g.dart';

@JsonSerializable()
class PaymentTransferRequestModel {
  PaymentTransferRequestModel({this.campaignId, this.invoiceId, this.amount});

  final String campaignId;
  final String invoiceId;
  final String amount;

  Map<String, dynamic> toJson() => _$PaymentTransferRequestModelToJson(this);
}
