import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/library_fcm/notification_tapped.dart';

part 'notification_list_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationMessage {
  NotificationMessage({
    this.messageGroupId,
    this.creationDate,
    this.message,
    this.payload,
    this.isRead,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageFromJson(json);

  final String messageGroupId;
  @JsonKey(name: 'CreationTimestamp')
  final DateTime creationDate;
  final String message;
  final NotificationTapped payload;
  final bool isRead;

  Map<String, dynamic> toJson() => _$NotificationMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationListResponseModel {
  NotificationListResponseModel({
    this.notifications,
    this.totalCount,
    this.currentPage,
    this.pageSize,
  });

  factory NotificationListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseModelFromJson(json);

  final int totalCount;
  final int currentPage;
  final int pageSize;
  @JsonKey(name: 'NotificationMessages')
  final List<NotificationMessage> notifications;
}
