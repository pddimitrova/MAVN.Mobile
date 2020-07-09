import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'partner_country_list_response_model.g.dart';

@JsonSerializable()
class PartnerCountry {
  const PartnerCountry({
    @required this.name,
    @required this.countryIso3Code,
  });

  factory PartnerCountry.fromJson(Map<String, dynamic> json) =>
      _$PartnerCountryFromJson(json);

  final String name;
  @JsonKey(name: 'Iso3Code')
  final String countryIso3Code;
}

class PartnerCountryListResponseModel {
  PartnerCountryListResponseModel({@required this.countryList});

  PartnerCountryListResponseModel.fromJson(List<dynamic> json)
      : countryList = json
            .map((jsonCountry) => PartnerCountry.fromJson(jsonCountry))
            .toList();

  final List<PartnerCountry> countryList;
}
