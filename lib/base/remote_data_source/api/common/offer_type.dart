import 'package:json_annotation/json_annotation.dart';

enum OfferVertical {
  @JsonValue('Hospitality')
  hospitality,
  @JsonValue('RealEstate')
  realEstate,
  @JsonValue('Retail')
  retail,
}
