// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequestResponseModel _$PaymentRequestResponseModelFromJson(
    Map<String, dynamic> json) {
  return PaymentRequestResponseModel(
    paymentRequestId: json['PaymentRequestId'] as String,
    status: PaymentRequestResponseModel._paymentRequestStatusFromJson(
        json['Status'] as String),
    totalInToken:
        const TokenCurrencyConverter().fromJson(json['TotalInToken'] as String),
    requestedAmountInTokens: const TokenCurrencyConverter()
        .fromJson(json['RequestedAmountInTokens'] as String),
    totalInCurrency: (json['TotalInCurrency'] as num)?.toDouble(),
    sendingAmountInToken: const TokenCurrencyConverter()
        .fromJson(json['SendingAmountInToken'] as String),
    currencyCode: json['CurrencyCode'] as String,
    partnerId: json['PartnerId'] as String,
    partnerName: json['PartnerName'] as String,
    locationId: json['LocationId'] as String,
    locationName: json['LocationName'] as String,
    paymentInfo: json['PaymentInfo'] as String,
    walletBalance: const TokenCurrencyConverter()
        .fromJson(json['WalletBalance'] as String),
    date: json['Date'] as String,
    lastUpdatedDate: json['LastUpdatedDate'] as String,
    tokensToFiatConversionRate:
        (json['TokensToFiatConversionRate'] as num)?.toDouble(),
    expirationTimeLeftInSeconds:
        json['CustomerActionExpirationTimeLeftInSeconds'] as int,
    expirationTimeStamp: json['CustomerActionExpirationTimestamp'] as String,
  );
}

Map<String, dynamic> _$PaymentRequestResponseModelToJson(
        PaymentRequestResponseModel instance) =>
    <String, dynamic>{
      'PaymentRequestId': instance.paymentRequestId,
      'Status': PaymentRequestResponseModel._paymentRequestStatusToJson(
          instance.status),
      'TotalInToken':
          const TokenCurrencyConverter().toJson(instance.totalInToken),
      'RequestedAmountInTokens': const TokenCurrencyConverter()
          .toJson(instance.requestedAmountInTokens),
      'TotalInCurrency': instance.totalInCurrency,
      'SendingAmountInToken':
          const TokenCurrencyConverter().toJson(instance.sendingAmountInToken),
      'CurrencyCode': instance.currencyCode,
      'PartnerId': instance.partnerId,
      'PartnerName': instance.partnerName,
      'LocationId': instance.locationId,
      'LocationName': instance.locationName,
      'PaymentInfo': instance.paymentInfo,
      'WalletBalance':
          const TokenCurrencyConverter().toJson(instance.walletBalance),
      'Date': instance.date,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'TokensToFiatConversionRate': instance.tokensToFiatConversionRate,
      'CustomerActionExpirationTimeLeftInSeconds':
          instance.expirationTimeLeftInSeconds,
      'CustomerActionExpirationTimestamp': instance.expirationTimeStamp,
    };
