// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    id: json['Id'] as int,
    name: json['Name'] as String,
    countryIso2Code: json['CountryIso2Code'] as String,
    countryIso3Code: json['CountryIso3Code'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'CountryIso2Code': instance.countryIso2Code,
      'CountryIso3Code': instance.countryIso3Code,
    };
