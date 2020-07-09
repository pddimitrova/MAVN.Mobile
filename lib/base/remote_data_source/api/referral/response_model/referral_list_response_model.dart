import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/referral/response_model/referral_response_model.dart';

part 'referral_list_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReferralsListResponseModel {
  ReferralsListResponseModel({
    this.referrals,
    this.totalCount,
    this.currentPage,
    this.pageSize,
  });

  factory ReferralsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralsListResponseModelFromJson(json);

  final int totalCount;
  final int currentPage;
  final int pageSize;
  final List<CustomerCommonReferralResponseModel> referrals;
}
