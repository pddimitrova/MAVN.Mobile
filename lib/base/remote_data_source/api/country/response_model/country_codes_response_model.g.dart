// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_codes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCode _$CountryCodeFromJson(Map<String, dynamic> json) {
  return CountryCode(
    id: json['Id'] as int,
    code: json['Code'] as String,
    name: json['CountryName'] as String,
    countryIso2Code: json['CountryIso2Code'] as String,
    countryIso3Code: json['CountryIso3Code'] as String,
  );
}

Map<String, dynamic> _$CountryCodeToJson(CountryCode instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Code': instance.code,
      'CountryName': instance.name,
      'CountryIso2Code': instance.countryIso2Code,
      'CountryIso3Code': instance.countryIso3Code,
    };
