import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_response_model.dart';

part 'earn_rule_list_response_model.g.dart';

@JsonSerializable()
class EarnRuleListResponseModel extends Equatable {
  const EarnRuleListResponseModel({
    @required this.earnRuleList,
    @required this.totalCount,
    @required this.currentPage,
  });

  factory EarnRuleListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EarnRuleListResponseModelFromJson(json);

  @JsonKey(name: 'EarnRules', defaultValue: [])
  final List<EarnRule> earnRuleList;
  final int totalCount;
  final int currentPage;

  @override
  List<Object> get props => [earnRuleList, totalCount, currentPage];
}
