import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';

part 'payment_request_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class PaymentRequestResponseModel {
  const PaymentRequestResponseModel({
    @required this.paymentRequestId,
    @required this.status,
    @required this.totalInToken,
    @required this.requestedAmountInTokens,
    @required this.totalInCurrency,
    @required this.sendingAmountInToken,
    @required this.currencyCode,
    @required this.partnerId,
    @required this.partnerName,
    @required this.locationId,
    @required this.locationName,
    @required this.paymentInfo,
    @required this.walletBalance,
    @required this.date,
    @required this.lastUpdatedDate,
    @required this.tokensToFiatConversionRate,
    @required this.expirationTimeLeftInSeconds,
    @required this.expirationTimeStamp,
  });

  factory PaymentRequestResponseModel.fromJson(json) =>
      _$PaymentRequestResponseModelFromJson(json);

  final String paymentRequestId;
  @JsonKey(
      fromJson: _paymentRequestStatusFromJson,
      toJson: _paymentRequestStatusToJson)
  final PaymentRequestStatus status;
  final TokenCurrency totalInToken;
  final TokenCurrency requestedAmountInTokens;
  final double totalInCurrency;
  final TokenCurrency sendingAmountInToken;
  final String currencyCode;
  final String partnerId;
  final String partnerName;
  final String locationId;
  final String locationName;
  final String paymentInfo;
  final TokenCurrency walletBalance;
  final String date;
  final String lastUpdatedDate;
  final double tokensToFiatConversionRate;
  @JsonKey(name: 'CustomerActionExpirationTimeLeftInSeconds')
  final int expirationTimeLeftInSeconds;
  @JsonKey(name: 'CustomerActionExpirationTimestamp')
  final String expirationTimeStamp;

  Map<String, dynamic> toJson() => _$PaymentRequestResponseModelToJson(this);

  static PaymentRequestStatus _paymentRequestStatusFromJson(
      String requestStatus) {
    for (final status in PaymentRequestStatus.values) {
      if (status.toString().split('.')[1].toLowerCase() ==
          requestStatus.toLowerCase()) {
        return status;
      }
    }
    return null;
  }

  static String _paymentRequestStatusToJson(PaymentRequestStatus status) {
    return status.toString();
  }
}

enum PaymentRequestStatus {
  @JsonValue('Pending')
  pending,
  @JsonValue('Confirmed')
  confirmed,
  @JsonValue('Completed')
  completed,
  @JsonValue('Cancelled')
  cancelled,
  @JsonValue('Failed')
  failed,
  @JsonValue('RequestExpired')
  requestExpired,
  @JsonValue('PaymentExpired')
  paymentExpired,
}
