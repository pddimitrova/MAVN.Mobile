// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerMessageResponseModel _$PartnerMessageResponseModelFromJson(
    Map<String, dynamic> json) {
  return PartnerMessageResponseModel(
    partnerMessageId: json['PartnerMessageId'] as String,
    partnerId: json['PartnerId'] as String,
    partnerName: json['PartnerName'] as String,
    locationId: json['LocationId'] as String,
    locationName: json['LocationName'] as String,
    customerId: json['CustomerId'] as String,
    timestamp: json['Timestamp'] as String,
    subject: json['Subject'] as String,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$PartnerMessageResponseModelToJson(
        PartnerMessageResponseModel instance) =>
    <String, dynamic>{
      'PartnerMessageId': instance.partnerMessageId,
      'PartnerId': instance.partnerId,
      'PartnerName': instance.partnerName,
      'LocationId': instance.locationId,
      'LocationName': instance.locationName,
      'CustomerId': instance.customerId,
      'Timestamp': instance.timestamp,
      'Subject': instance.subject,
      'Message': instance.message,
    };
