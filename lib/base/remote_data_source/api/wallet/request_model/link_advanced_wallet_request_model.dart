import 'package:json_annotation/json_annotation.dart';

part 'link_advanced_wallet_request_model.g.dart';

@JsonSerializable()
class LinkAdvancedWalletRequestModel {
  LinkAdvancedWalletRequestModel({
    this.privateAddress,
    this.publicAddress,
    this.signature,
  });

  final String privateAddress;
  final String publicAddress;
  final String signature;

  Map<String, dynamic> toJson() => _$LinkAdvancedWalletRequestModelToJson(this);
}
