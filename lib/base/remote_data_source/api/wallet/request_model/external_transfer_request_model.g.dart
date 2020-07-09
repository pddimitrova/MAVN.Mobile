// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalTransferRequestModel _$ExternalTransferRequestModelFromJson(
    Map<String, dynamic> json) {
  return ExternalTransferRequestModel(
    amount:
        ExternalTransferRequestModel._decimalFromJson(json['Amount'] as String),
  );
}

Map<String, dynamic> _$ExternalTransferRequestModelToJson(
        ExternalTransferRequestModel instance) =>
    <String, dynamic>{
      'Amount': ExternalTransferRequestModel._decimalToJson(instance.amount),
    };
