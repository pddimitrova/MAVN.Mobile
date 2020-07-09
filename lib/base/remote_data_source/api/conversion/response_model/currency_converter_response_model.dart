import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'currency_converter_response_model.g.dart';

@JsonSerializable()
class CurrencyConverterResponseModel {
  CurrencyConverterResponseModel({@required this.amount});

  factory CurrencyConverterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyConverterResponseModelFromJson(json);

  final String amount;
}
