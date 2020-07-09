import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/partner/response_model/payment_request_response_model.dart';

part 'payments_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginatedPartnerPaymentsResponseModel {
  PaginatedPartnerPaymentsResponseModel({
    this.currentPage,
    this.pageSize,
    this.totalCount,
    this.paymentRequests,
  });

  factory PaginatedPartnerPaymentsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedPartnerPaymentsResponseModelFromJson(json);

  final int currentPage;
  final int pageSize;
  final int totalCount;
  final List<PaymentRequestResponseModel> paymentRequests;
}

@JsonSerializable(explicitToJson: true)
class PartnerPaymentsResponseModel {
  const PartnerPaymentsResponseModel({
    this.paymentRequests,
  });

  factory PartnerPaymentsResponseModel.fromJson(json) =>
      _$PartnerPaymentsResponseModelFromJson(json);

  final List<PaymentRequestResponseModel> paymentRequests;
}
