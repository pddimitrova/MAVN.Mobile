// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pTransactionRequestModel _$P2pTransactionRequestModelFromJson(
    Map<String, dynamic> json) {
  return P2pTransactionRequestModel(
    json['ReceiverEmail'] as String,
    json['Amount'] as String,
  );
}

Map<String, dynamic> _$P2pTransactionRequestModelToJson(
        P2pTransactionRequestModel instance) =>
    <String, dynamic>{
      'ReceiverEmail': instance.receiverEmail,
      'Amount': instance.amount,
    };
