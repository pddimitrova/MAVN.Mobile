import 'package:json_annotation/json_annotation.dart';

part 'wellet_status_response_model.g.dart';

@JsonSerializable()
class WalletStatusResponseModel {
  WalletStatusResponseModel({this.isBlocked});

  factory WalletStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WalletStatusResponseModelFromJson(json);

  final bool isBlocked;
}
