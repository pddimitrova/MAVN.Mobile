import 'package:meta/meta.dart';

class PartnerCountry {
  const PartnerCountry({
    @required this.name,
    @required this.countryIso3Code,
  });

  PartnerCountry.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        countryIso3Code = json['Iso3Code'];

  final String name;
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
