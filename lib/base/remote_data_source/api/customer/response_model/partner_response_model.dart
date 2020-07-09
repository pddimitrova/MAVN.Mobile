import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Partner {
  const Partner({
    @required this.id,
    @required this.name,
    @required this.locations,
  });

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerToJson(this);

  final String id;
  final String name;
  @JsonKey(defaultValue: [])
  final List<PartnerLocation> locations;
}

@JsonSerializable()
class PartnerLocation {
  const PartnerLocation({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.createdAt,
  });

  factory PartnerLocation.fromJson(Map<String, dynamic> json) =>
      _$PartnerLocationFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerLocationToJson(this);

  final String id;
  final String name;
  final String address;
  final String createdAt;
}
