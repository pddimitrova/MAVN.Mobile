import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/common/offer_type.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/earn/response_model/earn_rule_response_model.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';
import 'package:lykke_mobile_mavn/library_utils/enum_mapper.dart';

part 'earn_rule_condition_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class EarnRuleCondition {
  EarnRuleCondition({
    @required this.id,
    @required this.type,
    @required this.vertical,
    @required this.displayName,
    @required this.immediateReward,
    @required this.completionCount,
    @required this.hasStaking,
    @required this.stakeAmount,
    @required this.stakingPeriod,
    @required this.stakeWarningPeriod,
    @required this.stakingRule,
    @required this.burningRule,
    @required this.rewardType,
    @required this.amountInTokens,
    @required this.amountInCurrency,
    @required this.usePartnerCurrencyRate,
  });

  factory EarnRuleCondition.fromJson(Map<String, dynamic> json) =>
      _$EarnRuleConditionFromJson(json);

  Map<String, dynamic> toJson() => _$EarnRuleConditionToJson(this);

  final String id;
  @JsonKey(
      fromJson: earnRuleConditionTypeFromJson,
      toJson: earnRuleConditionTypeToJson)
  final EarnRuleConditionType type;
  @JsonKey(defaultValue: null)
  final OfferVertical vertical;
  final String displayName;
  final TokenCurrency immediateReward;
  final int completionCount;
  final bool hasStaking;
  final TokenCurrency stakeAmount;
  final int stakingPeriod;
  final int stakeWarningPeriod;
  final double stakingRule;
  final double burningRule;
  @JsonKey(defaultValue: null)
  final RewardType rewardType;
  final TokenCurrency amountInTokens;
  final double amountInCurrency;
  final bool usePartnerCurrencyRate;

  static EarnRuleConditionType earnRuleConditionTypeFromJson(String json) {
    return EnumMapper.mapFromString(json.replaceAll('-', ''),
        enumValues: EarnRuleConditionType.values, defaultValue: null);
  }

  static String earnRuleConditionTypeToJson(EarnRuleConditionType json) {
    return json.toString();
  }
}

enum EarnRuleConditionType {
  @JsonValue('SignUp')
  signUp,
  @JsonValue('PropertyPurchaseCommissionOne')
  propertyPurchaseCommissionOne,
  @JsonValue('PropertyPurchaseCommissionTwo')
  propertyPurchaseCommissionTwo,
  @JsonValue('HotelStayReferral')
  hotelStayReferral,
  @JsonValue('HotelStay')
  hotelStay,
  @JsonValue('FriendReferral')
  friendReferral,
}
