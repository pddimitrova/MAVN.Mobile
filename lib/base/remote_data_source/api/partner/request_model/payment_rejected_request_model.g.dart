// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_rejected_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRejectedRequestModel _$PaymentRejectedRequestModelFromJson(
    Map<String, dynamic> json) {
  return PaymentRejectedRequestModel(
    paymentRequestId: json['PaymentRequestId'] as String,
  );
}

Map<String, dynamic> _$PaymentRejectedRequestModelToJson(
        PaymentRejectedRequestModel instance) =>
    <String, dynamic>{
      'PaymentRequestId': instance.paymentRequestId,
    };
