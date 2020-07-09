import 'package:json_annotation/json_annotation.dart';

part 'unread_notification_count_response_model.g.dart';

@JsonSerializable()
class UnreadNotificationCountResponseModel {
  UnreadNotificationCountResponseModel({this.unreadMessagesCount});

  factory UnreadNotificationCountResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$UnreadNotificationCountResponseModelFromJson(json);

  final int unreadMessagesCount;
}
