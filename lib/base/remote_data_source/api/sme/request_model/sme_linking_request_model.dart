import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sme_linking_request_model.g.dart';

@JsonSerializable()
class SmeLinkingRequestModel {
  SmeLinkingRequestModel({
    @required this.partnerCode,
    @required this.linkingCode,
  });

  final String partnerCode;
  @JsonKey(name: 'PartnerLinkingCode')
  final String linkingCode;

  Map<String, dynamic> toJson() => _$SmeLinkingRequestModelToJson(this);
}
