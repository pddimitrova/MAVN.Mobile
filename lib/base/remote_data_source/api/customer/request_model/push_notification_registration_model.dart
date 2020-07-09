import 'package:json_annotation/json_annotation.dart';

part 'push_notification_registration_model.g.dart';

@JsonSerializable()
class PushNotificationRegistrationRequestModel {
  PushNotificationRegistrationRequestModel({this.pushRegistrationToken});

  final String pushRegistrationToken;

  Map<String, dynamic> toJson() =>
      _$PushNotificationRegistrationRequestModelToJson(this);
}
