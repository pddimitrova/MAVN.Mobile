// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationRegistrationRequestModel
    _$PushNotificationRegistrationRequestModelFromJson(
        Map<String, dynamic> json) {
  return PushNotificationRegistrationRequestModel(
    pushRegistrationToken: json['PushRegistrationToken'] as String,
  );
}

Map<String, dynamic> _$PushNotificationRegistrationRequestModelToJson(
        PushNotificationRegistrationRequestModel instance) =>
    <String, dynamic>{
      'PushRegistrationToken': instance.pushRegistrationToken,
    };
