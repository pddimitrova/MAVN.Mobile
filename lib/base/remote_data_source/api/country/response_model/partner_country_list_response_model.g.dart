// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_country_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerCountry _$PartnerCountryFromJson(Map<String, dynamic> json) {
  return PartnerCountry(
    name: json['Name'] as String,
    countryIso3Code: json['Iso3Code'] as String,
  );
}

Map<String, dynamic> _$PartnerCountryToJson(PartnerCountry instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Iso3Code': instance.countryIso3Code,
    };
