// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedPartnerPaymentsResponseModel
    _$PaginatedPartnerPaymentsResponseModelFromJson(Map<String, dynamic> json) {
  return PaginatedPartnerPaymentsResponseModel(
    currentPage: json['CurrentPage'] as int,
    pageSize: json['PageSize'] as int,
    totalCount: json['TotalCount'] as int,
    paymentRequests: (json['PaymentRequests'] as List)
        ?.map((e) => e == null ? null : PaymentRequestResponseModel.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$PaginatedPartnerPaymentsResponseModelToJson(
        PaginatedPartnerPaymentsResponseModel instance) =>
    <String, dynamic>{
      'CurrentPage': instance.currentPage,
      'PageSize': instance.pageSize,
      'TotalCount': instance.totalCount,
      'PaymentRequests':
          instance.paymentRequests?.map((e) => e?.toJson())?.toList(),
    };

PartnerPaymentsResponseModel _$PartnerPaymentsResponseModelFromJson(
    Map<String, dynamic> json) {
  return PartnerPaymentsResponseModel(
    paymentRequests: (json['PaymentRequests'] as List)
        ?.map((e) => e == null ? null : PaymentRequestResponseModel.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$PartnerPaymentsResponseModelToJson(
        PartnerPaymentsResponseModel instance) =>
    <String, dynamic>{
      'PaymentRequests':
          instance.paymentRequests?.map((e) => e?.toJson())?.toList(),
    };
