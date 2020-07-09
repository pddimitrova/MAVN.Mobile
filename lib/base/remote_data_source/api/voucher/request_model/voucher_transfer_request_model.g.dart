// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherTransferRequestModel _$VoucherTransferRequestModelFromJson(
    Map<String, dynamic> json) {
  return VoucherTransferRequestModel(
    receiverEmail: json['ReceiverEmail'] as String,
    voucherShortCode: json['VoucherShortCode'] as String,
  );
}

Map<String, dynamic> _$VoucherTransferRequestModelToJson(
        VoucherTransferRequestModel instance) =>
    <String, dynamic>{
      'ReceiverEmail': instance.receiverEmail,
      'VoucherShortCode': instance.voucherShortCode,
    };
