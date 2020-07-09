import 'package:json_annotation/json_annotation.dart';

part 'conversion_rate_response_model.g.dart';

@JsonSerializable()
class ConversionRateResponseModel {
  ConversionRateResponseModel({
    this.amount,
    this.rate,
    this.currencyCode,
    this.error,
  });

  factory ConversionRateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConversionRateResponseModelFromJson(json);

  final String amount;
  final String rate;
  final String currencyCode;
  final String error;
}
