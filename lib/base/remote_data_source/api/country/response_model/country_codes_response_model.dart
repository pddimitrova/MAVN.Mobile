import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'country_codes_response_model.g.dart';

@JsonSerializable()
class CountryCode {
  const CountryCode({
    @required this.id,
    @required this.code,
    @required this.name,
    @required this.countryIso2Code,
    @required this.countryIso3Code,
  });

  factory CountryCode.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeFromJson(json);

  final int id;
  final String code;
  @JsonKey(name: 'CountryName')
  final String name;
  final String countryIso2Code;
  final String countryIso3Code;
}

class CountryCodeListResponseModel {
  CountryCodeListResponseModel({@required this.countryCodeList});

  CountryCodeListResponseModel.fromJson(List<dynamic> json)
      : countryCodeList = json
            .map((jsonCountryCode) => CountryCode.fromJson(jsonCountryCode))
            .toList();

  final List<CountryCode> countryCodeList;
}
