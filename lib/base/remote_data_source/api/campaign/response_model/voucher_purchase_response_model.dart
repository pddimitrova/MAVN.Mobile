import 'package:flutter/foundation.dart';
import 'package:lykke_mobile_mavn/library_utils/enum_mapper.dart';

class VoucherPurchaseResponseModel {
  VoucherPurchaseResponseModel({
    @required this.paymentUrl,
    @required this.errorCode,
    this.reservedVoucherShortCode,
  });

  VoucherPurchaseResponseModel.fromJson(Map<String, dynamic> json)
      : paymentUrl = json['PaymentUrl'],
        errorCode = EnumMapper.mapFromString(
          json['ErrorCode'],
          enumValues: VoucherPurchaseErrorCode.values,
          defaultValue: null,
        ),
        reservedVoucherShortCode = json['AlreadyReservedVoucherShortCode'];

  final String paymentUrl;
  final VoucherPurchaseErrorCode errorCode;
  final String reservedVoucherShortCode;
}

enum VoucherPurchaseErrorCode { none, customerHaveAnotherReservedVoucher }
