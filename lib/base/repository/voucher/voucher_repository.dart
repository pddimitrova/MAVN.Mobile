import 'package:flutter/foundation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/voucher/response_model/voucher_details_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/voucher/voucher_api.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/voucher/response_model/voucher_response_model.dart';

class VoucherRepository {
  VoucherRepository(this._voucherApi);

  final VoucherApi _voucherApi;

  static const itemsPerPage = 5;

  Future<VoucherListResponseModel> getVouchers({int currentPage}) =>
      _voucherApi.getVouchers(itemsPerPage, currentPage);

  Future<VoucherDetailsResponseModel> getVoucherDetails({
    @required String shortCode,
  }) =>
      _voucherApi.getVoucherDetailsByShortCode(shortCode);
}
