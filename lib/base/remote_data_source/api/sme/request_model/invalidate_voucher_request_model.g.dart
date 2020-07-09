// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invalidate_voucher_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvalidateVoucherRequestModel _$InvalidateVoucherRequestModelFromJson(
    Map<String, dynamic> json) {
  return InvalidateVoucherRequestModel(
    voucherShortCode: json['VoucherShortCode'] as String,
    voucherValidationCode: json['VoucherValidationCode'] as String,
  );
}

Map<String, dynamic> _$InvalidateVoucherRequestModelToJson(
        InvalidateVoucherRequestModel instance) =>
    <String, dynamic>{
      'VoucherShortCode': instance.voucherShortCode,
      'VoucherValidationCode': instance.voucherValidationCode,
    };
