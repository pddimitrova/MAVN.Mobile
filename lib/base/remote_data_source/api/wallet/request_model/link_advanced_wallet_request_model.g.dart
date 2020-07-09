// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_advanced_wallet_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAdvancedWalletRequestModel _$LinkAdvancedWalletRequestModelFromJson(
    Map<String, dynamic> json) {
  return LinkAdvancedWalletRequestModel(
    privateAddress: json['PrivateAddress'] as String,
    publicAddress: json['PublicAddress'] as String,
    signature: json['Signature'] as String,
  );
}

Map<String, dynamic> _$LinkAdvancedWalletRequestModelToJson(
        LinkAdvancedWalletRequestModel instance) =>
    <String, dynamic>{
      'PrivateAddress': instance.privateAddress,
      'PublicAddress': instance.publicAddress,
      'Signature': instance.signature,
    };
