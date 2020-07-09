import 'package:json_annotation/json_annotation.dart';

part 'p2p_transaction_model.g.dart';

@JsonSerializable()
class P2pTransactionRequestModel {
  P2pTransactionRequestModel(this.receiverEmail, this.amount);

  final String receiverEmail;
  final String amount;

  Map<String, dynamic> toJson() => _$P2pTransactionRequestModelToJson(this);
}
