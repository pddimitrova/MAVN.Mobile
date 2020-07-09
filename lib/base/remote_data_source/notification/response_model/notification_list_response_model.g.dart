// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationMessage _$NotificationMessageFromJson(Map<String, dynamic> json) {
  return NotificationMessage(
    messageGroupId: json['MessageGroupId'] as String,
    creationDate: json['CreationTimestamp'] == null
        ? null
        : DateTime.parse(json['CreationTimestamp'] as String),
    message: json['Message'] as String,
    payload: json['Payload'] == null
        ? null
        : NotificationTapped.fromJson(json['Payload'] as Map<String, dynamic>),
    isRead: json['IsRead'] as bool,
  );
}

Map<String, dynamic> _$NotificationMessageToJson(
        NotificationMessage instance) =>
    <String, dynamic>{
      'MessageGroupId': instance.messageGroupId,
      'CreationTimestamp': instance.creationDate?.toIso8601String(),
      'Message': instance.message,
      'Payload': instance.payload?.toJson(),
      'IsRead': instance.isRead,
    };

NotificationListResponseModel _$NotificationListResponseModelFromJson(
    Map<String, dynamic> json) {
  return NotificationListResponseModel(
    notifications: (json['NotificationMessages'] as List)
        ?.map((e) => e == null
            ? null
            : NotificationMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
    currentPage: json['CurrentPage'] as int,
    pageSize: json['PageSize'] as int,
  );
}

Map<String, dynamic> _$NotificationListResponseModelToJson(
        NotificationListResponseModel instance) =>
    <String, dynamic>{
      'TotalCount': instance.totalCount,
      'CurrentPage': instance.currentPage,
      'PageSize': instance.pageSize,
      'NotificationMessages':
          instance.notifications?.map((e) => e?.toJson())?.toList(),
    };
