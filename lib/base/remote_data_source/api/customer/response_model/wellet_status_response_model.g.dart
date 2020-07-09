// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellet_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletStatusResponseModel _$WalletStatusResponseModelFromJson(
    Map<String, dynamic> json) {
  return WalletStatusResponseModel(
    isBlocked: json['IsBlocked'] as bool,
  );
}

Map<String, dynamic> _$WalletStatusResponseModelToJson(
        WalletStatusResponseModel instance) =>
    <String, dynamic>{
      'IsBlocked': instance.isBlocked,
    };
