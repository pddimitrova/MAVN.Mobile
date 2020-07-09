import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_rejected_request_model.g.dart';

@JsonSerializable()
class PaymentRejectedRequestModel {
  const PaymentRejectedRequestModel({@required this.paymentRequestId});

  final String paymentRequestId;

  Map<String, dynamic> toJson() => _$PaymentRejectedRequestModelToJson(this);
}
