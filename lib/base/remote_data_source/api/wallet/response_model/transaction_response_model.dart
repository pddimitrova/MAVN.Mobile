import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'transaction_response_model.g.dart';

@JsonSerializable()
class TransactionResponseModel {
  TransactionResponseModel({@required this.transactionId});

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseModelFromJson(json);

  final String transactionId;
}
