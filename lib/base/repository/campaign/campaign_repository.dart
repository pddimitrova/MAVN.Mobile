import 'package:flutter/foundation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/campaign_api.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/request_model/voucher_purchase_request_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/voucher_purchase_response_model.dart';

class CampaignRepository {
  CampaignRepository(this._campaignApi);

  final CampaignApi _campaignApi;

  static const itemsPerPage = 30;

  Future<CampaignListResponseModel> getCampaigns({
    int pageSize = itemsPerPage,
    int currentPage,
    double long,
    double lat,
    double radius,
    String countryCode,
  }) =>
      _campaignApi.getCampaigns(
        pageSize: pageSize,
        currentPage: currentPage,
        long: long,
        lat: lat,
        radius: radius,
        countryCode: countryCode,
      );

  Future<CampaignListResponseModel> getPopularCampaigns({
    double long,
    double lat,
    String countryCode,
  }) =>
      //TODO switch to actual popular campaigns endpoint
      _campaignApi.getCampaigns(
        pageSize: 10,
        currentPage: 1,
        radius: 128,
        long: long,
        lat: lat,
        countryCode: countryCode,
      );

  Future<CampaignResponseModel> getCampaignDetails({
    @required String id,
  }) =>
      _campaignApi.getCampaignDetailsById(id);

  Future<CampaignResponseModel> getCampaignOfDay() =>
      _campaignApi.getCampaignOfDay();

  Future<VoucherPurchaseResponseModel> purchaseVoucher({
    @required String id,
  }) =>
      _campaignApi.purchaseVoucher(VoucherPurchaseRequestModel(campaignId: id));
}
