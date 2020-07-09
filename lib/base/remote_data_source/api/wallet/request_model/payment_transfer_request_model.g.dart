// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTransferRequestModel _$PaymentTransferRequestModelFromJson(
    Map<String, dynamic> json) {
  return PaymentTransferRequestModel(
    campaignId: json['CampaignId'] as String,
    invoiceId: json['InvoiceId'] as String,
    amount: json['Amount'] as String,
  );
}

Map<String, dynamic> _$PaymentTransferRequestModelToJson(
        PaymentTransferRequestModel instance) =>
    <String, dynamic>{
      'CampaignId': instance.campaignId,
      'InvoiceId': instance.invoiceId,
      'Amount': instance.amount,
    };
