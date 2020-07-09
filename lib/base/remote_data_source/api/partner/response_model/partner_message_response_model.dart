import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_message_response_model.g.dart';

@JsonSerializable()
class PartnerMessageResponseModel with EquatableMixin {
  PartnerMessageResponseModel({
    this.partnerMessageId,
    this.partnerId,
    this.partnerName,
    this.locationId,
    this.locationName,
    this.customerId,
    this.timestamp,
    this.subject,
    this.message,
  });

  factory PartnerMessageResponseModel.fromJson(json) =>
      _$PartnerMessageResponseModelFromJson(json);

  final String partnerMessageId;
  final String partnerId;
  final String partnerName;
  final String locationId;
  final String locationName;
  final String customerId;
  final String timestamp;
  final String subject;
  final String message;

  @override
  List get props => [
        partnerMessageId,
        partnerId,
        partnerName,
        locationId,
        locationName,
        customerId,
        timestamp,
        subject,
        message,
      ];
}
