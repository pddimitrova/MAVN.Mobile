import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/library_models/base_currency.dart';

class TokenCurrency extends BaseCurrency {
  const TokenCurrency({
    @required String value,
    String assetSymbol,
  }) : super(
          value: value,
          assetSymbol: assetSymbol,
        );
}

class TokenCurrencyConverter implements JsonConverter<TokenCurrency, String> {
  const TokenCurrencyConverter();

  @override
  TokenCurrency fromJson(String json) => TokenCurrency(value: json);

  @override
  String toJson(TokenCurrency json) => json.toString();
}
