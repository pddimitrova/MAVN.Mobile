// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return Partner(
    id: json['Id'] as String,
    name: json['Name'] as String,
    locations: (json['Locations'] as List)
            ?.map((e) => e == null
                ? null
                : PartnerLocation.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Locations': instance.locations?.map((e) => e?.toJson())?.toList(),
    };

PartnerLocation _$PartnerLocationFromJson(Map<String, dynamic> json) {
  return PartnerLocation(
    id: json['Id'] as String,
    name: json['Name'] as String,
    address: json['Address'] as String,
    createdAt: json['CreatedAt'] as String,
  );
}

Map<String, dynamic> _$PartnerLocationToJson(PartnerLocation instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Address': instance.address,
      'CreatedAt': instance.createdAt,
    };
