// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_approved_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentApprovedRequestModel _$PaymentApprovedRequestModelFromJson(
    Map<String, dynamic> json) {
  return PaymentApprovedRequestModel(
    paymentRequestId: json['PaymentRequestId'] as String,
    sendingAmount: json['SendingAmount'] as String,
  );
}

Map<String, dynamic> _$PaymentApprovedRequestModelToJson(
        PaymentApprovedRequestModel instance) =>
    <String, dynamic>{
      'PaymentRequestId': instance.paymentRequestId,
      'SendingAmount': instance.sendingAmount,
    };
