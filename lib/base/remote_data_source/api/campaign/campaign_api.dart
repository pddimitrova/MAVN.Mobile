import 'package:flutter/foundation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/request_model/voucher_purchase_request_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/voucher_purchase_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/http_client.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/base_api.dart';

class CampaignApi extends BaseApi {
  CampaignApi(HttpClient httpClient) : super(httpClient);

  static const String _vouchersBasePath = '/smartVouchers';
  static const String _campaignsPath = '$_vouchersBasePath/campaigns';
  static const String _campaignDetailsPath = '$_campaignsPath/search';
  static const String _campaignOfDayPath =
      '$_vouchersBasePath/campaignOfTheDay';
  //TODO change to correct endpoint when it's done on BE
  static const String _popularCampaignsPath = '$_vouchersBasePath/campaigns';
  static const String _purchaseVoucherPath = '$_vouchersBasePath/reserve';

  //query params
  static const String queryParamCurrentPage = 'CurrentPage';
  static const String queryParamPageSize = 'PageSize';
  static const String queryParamId = 'id';
  static const String queryParamLong = 'Longitude';
  static const String queryParamLat = 'Latitude';
  static const String queryParamRadius = 'RadiusInKm';
  static const String queryParamCountryCode = 'CountryIso3Code';

  Future<CampaignListResponseModel> getCampaigns({
    @required int pageSize,
    @required int currentPage,
    double long,
    double lat,
    double radius,
    String countryCode,
  }) =>
      exceptionHandledHttpClientRequest(() async {
        final response = await httpClient
            .get<Map<String, dynamic>>(_campaignsPath, queryParameters: {
          queryParamCurrentPage: currentPage,
          queryParamPageSize: pageSize,
          if (long != null) queryParamLong: long,
          if (lat != null) queryParamLat: lat,
          if (radius != null) queryParamRadius: radius,
          if (countryCode != null) queryParamCountryCode: countryCode,
        });
        return CampaignListResponseModel.fromJson(response.data);
      });

  Future<CampaignResponseModel> getCampaignDetailsById(String id) async =>
      exceptionHandledHttpClientRequest(() async {
        final response = await httpClient
            .get<Map<String, dynamic>>(_campaignDetailsPath, queryParameters: {
          queryParamId: id,
        });
        return CampaignResponseModel.fromJson(response.data);
      });

  Future<CampaignResponseModel> getCampaignOfDay() async =>
      exceptionHandledHttpClientRequest(() async {
        final response =
            await httpClient.get<Map<String, dynamic>>(_campaignOfDayPath);
        return CampaignResponseModel.fromJson(response.data);
      });

  Future<CampaignListResponseModel> getPopularCampaigns({
    double long,
    double lat,
    String countryCode,
  }) =>
      exceptionHandledHttpClientRequest(() async {
        final response = await httpClient
            .get<Map<String, dynamic>>(_popularCampaignsPath, queryParameters: {
          if (long != null) queryParamLong: long,
          if (lat != null) queryParamLat: lat,
          if (countryCode != null) queryParamCountryCode: countryCode,
        });
        return CampaignListResponseModel.fromJson(response.data);
      });

  Future<VoucherPurchaseResponseModel> purchaseVoucher(
    VoucherPurchaseRequestModel model,
  ) =>
      exceptionHandledHttpClientRequest(() async {
        final response = await httpClient.post<Map<String, dynamic>>(
          _purchaseVoucherPath,
          data: model.toJson(),
        );
        return VoucherPurchaseResponseModel.fromJson(response.data);
      });
}
