import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'countries_response_model.g.dart';

@JsonSerializable()
class Country {
  const Country({
    @required this.id,
    @required this.name,
    @required this.countryIso2Code,
    @required this.countryIso3Code,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  final int id;
  final String name;
  final String countryIso2Code;
  final String countryIso3Code;
}

class CountryListResponseModel {
  CountryListResponseModel({@required this.countryList});

  CountryListResponseModel.fromJson(List<dynamic> json)
      : countryList =
            json.map((jsonCountry) => Country.fromJson(jsonCountry)).toList();

  final List<Country> countryList;
}
