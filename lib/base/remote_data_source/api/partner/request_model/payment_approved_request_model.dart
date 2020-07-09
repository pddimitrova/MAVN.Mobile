import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_approved_request_model.g.dart';

@JsonSerializable()
class PaymentApprovedRequestModel {
  const PaymentApprovedRequestModel({
    @required this.paymentRequestId,
    @required this.sendingAmount,
  });

  final String paymentRequestId;
  final String sendingAmount;

  Map<String, dynamic> toJson() => _$PaymentApprovedRequestModelToJson(this);
}
