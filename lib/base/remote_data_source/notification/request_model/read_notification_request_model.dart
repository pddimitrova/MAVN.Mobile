import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'read_notification_request_model.g.dart';

@JsonSerializable()
class ReadNotificationRequestModel {
  ReadNotificationRequestModel({@required this.messageGroupId});

  Map<String, dynamic> toJson() => _$ReadNotificationRequestModelToJson(this);

  final String messageGroupId;
}
