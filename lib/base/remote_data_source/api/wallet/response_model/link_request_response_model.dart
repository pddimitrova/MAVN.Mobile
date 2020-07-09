import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'link_request_response_model.g.dart';

@JsonSerializable()
class LinkCodeRequestResponseModel {
  LinkCodeRequestResponseModel({@required this.linkCode});

  factory LinkCodeRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LinkCodeRequestResponseModelFromJson(json);

  final String linkCode;
}
