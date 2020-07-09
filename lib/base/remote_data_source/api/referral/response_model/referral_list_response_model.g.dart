// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralsListResponseModel _$ReferralsListResponseModelFromJson(
    Map<String, dynamic> json) {
  return ReferralsListResponseModel(
    referrals: (json['Referrals'] as List)
        ?.map((e) => e == null
            ? null
            : CustomerCommonReferralResponseModel.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
    currentPage: json['CurrentPage'] as int,
    pageSize: json['PageSize'] as int,
  );
}

Map<String, dynamic> _$ReferralsListResponseModelToJson(
        ReferralsListResponseModel instance) =>
    <String, dynamic>{
      'TotalCount': instance.totalCount,
      'CurrentPage': instance.currentPage,
      'PageSize': instance.pageSize,
      'Referrals': instance.referrals?.map((e) => e?.toJson())?.toList(),
    };
