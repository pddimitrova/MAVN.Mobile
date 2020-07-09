// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sme_linking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmeLinkingRequestModel _$SmeLinkingRequestModelFromJson(
    Map<String, dynamic> json) {
  return SmeLinkingRequestModel(
    partnerCode: json['PartnerCode'] as String,
    linkingCode: json['PartnerLinkingCode'] as String,
  );
}

Map<String, dynamic> _$SmeLinkingRequestModelToJson(
        SmeLinkingRequestModel instance) =>
    <String, dynamic>{
      'PartnerCode': instance.partnerCode,
      'PartnerLinkingCode': instance.linkingCode,
    };
