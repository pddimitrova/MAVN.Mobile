import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'external_transfer_request_model.g.dart';

@JsonSerializable()
class ExternalTransferRequestModel {
  ExternalTransferRequestModel({@required this.amount});

  @JsonKey(toJson: _decimalToJson, fromJson: _decimalFromJson)
  final Decimal amount;

  Map<String, dynamic> toJson() => _$ExternalTransferRequestModelToJson(this);

  static String _decimalToJson(Decimal amount) => amount.toString();

  static Decimal _decimalFromJson(String amount) => Decimal.tryParse(amount);
}
