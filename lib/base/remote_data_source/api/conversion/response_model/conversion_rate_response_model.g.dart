// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_rate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionRateResponseModel _$ConversionRateResponseModelFromJson(
    Map<String, dynamic> json) {
  return ConversionRateResponseModel(
    amount: json['Amount'] as String,
    rate: json['Rate'] as String,
    currencyCode: json['CurrencyCode'] as String,
    error: json['Error'] as String,
  );
}

Map<String, dynamic> _$ConversionRateResponseModelToJson(
        ConversionRateResponseModel instance) =>
    <String, dynamic>{
      'Amount': instance.amount,
      'Rate': instance.rate,
      'CurrencyCode': instance.currencyCode,
      'Error': instance.error,
    };
