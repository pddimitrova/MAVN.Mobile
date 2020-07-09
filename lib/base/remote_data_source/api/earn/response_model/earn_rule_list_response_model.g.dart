// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earn_rule_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarnRuleListResponseModel _$EarnRuleListResponseModelFromJson(
    Map<String, dynamic> json) {
  return EarnRuleListResponseModel(
    earnRuleList: (json['EarnRules'] as List)
            ?.map((e) =>
                e == null ? null : EarnRule.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    totalCount: json['TotalCount'] as int,
    currentPage: json['CurrentPage'] as int,
  );
}

Map<String, dynamic> _$EarnRuleListResponseModelToJson(
        EarnRuleListResponseModel instance) =>
    <String, dynamic>{
      'EarnRules': instance.earnRuleList,
      'TotalCount': instance.totalCount,
      'CurrentPage': instance.currentPage,
    };
