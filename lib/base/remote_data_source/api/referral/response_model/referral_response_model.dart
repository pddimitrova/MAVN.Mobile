import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/library_models/token_currency.dart';

part 'referral_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@TokenCurrencyConverter()
class CustomerCommonReferralResponseModel {
  CustomerCommonReferralResponseModel({
    this.status,
    this.referralType,
    this.firstName,
    this.lastName,
    this.email,
    this.partnerName,
    this.timeStamp,
    this.totalReward,
    this.currentRewardedAmount,
    this.rewardHasRatio,
    this.rewardRatio,
    this.hasStaking,
    this.staking,
    this.isApproximate,
  });

  factory CustomerCommonReferralResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerCommonReferralResponseModelFromJson(json);

  @JsonKey(defaultValue: null)
  final ReferralStatus status;
  @JsonKey(defaultValue: null)
  final ReferralType referralType;
  final String firstName;
  final String lastName;
  final String email;
  final String partnerName;
  final DateTime timeStamp;
  final TokenCurrency totalReward;
  final TokenCurrency currentRewardedAmount;
  final bool rewardHasRatio;
  //TODO: Add check json['RewardHasRatio'] && json['RewardRatio'] != null
  @JsonKey(nullable: true)
  final RewardRatio rewardRatio;
  final bool hasStaking;
  //TODO: Add check json['HasStaking'] && json['Staking'] != null
  @JsonKey(nullable: true)
  final ReferralStaking staking;
  final bool isApproximate;

  Map<String, dynamic> toJson() =>
      _$CustomerCommonReferralResponseModelToJson(this);
}

enum ReferralType {
  @JsonValue('Hospitality')
  hospitality,
  @JsonValue('RealEstate')
  realEstate,
  @JsonValue('Retail')
  retail,
  @JsonValue('Friend')
  friend
}
enum ReferralStatus {
  @JsonValue('Ongoing')
  ongoing,
  @JsonValue('Accepted')
  accepted,
  @JsonValue('Expired')
  expired
}

@JsonSerializable()
@TokenCurrencyConverter()
class ReferralStaking {
  ReferralStaking({
    this.stakeAmount,
    this.stakingExpirationDate,
  });

  factory ReferralStaking.fromJson(Map<String, dynamic> json) =>
      _$ReferralStakingFromJson(json);

  final TokenCurrency stakeAmount;
  final DateTime stakingExpirationDate;

  Map<String, dynamic> toJson() => _$ReferralStakingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RewardRatio {
  RewardRatio({
    this.ratios,
    this.ratioCompletions,
  });

  factory RewardRatio.fromJson(Map<String, dynamic> json) =>
      _$RewardRatioFromJson(json);

  final List<Ratio> ratios;
  @JsonKey(name: 'RatioCompletion')
  final List<RatioCompletion> ratioCompletions;

  Map<String, dynamic> toJson() => _$RewardRatioToJson(this);
}

@JsonSerializable()
class Ratio {
  Ratio({
    this.order,
    this.rewardRatio,
    this.paymentRatio,
    this.threshold,
  });

  factory Ratio.fromJson(Map<String, dynamic> json) => _$RatioFromJson(json);

  final int order;
  final double rewardRatio;
  final double paymentRatio;
  final double threshold;

  Map<String, dynamic> toJson() => _$RatioToJson(this);
}

@JsonSerializable()
class RatioCompletion {
  RatioCompletion(
    this.id,
    this.name,
    this.givenThreshold,
    this.checkpoint,
  );

  factory RatioCompletion.fromJson(Map<String, dynamic> json) =>
      _$RatioCompletionFromJson(json);

  @JsonKey(name: 'PaymentId')
  final String id;
  final String name;
  final double givenThreshold;
  final int checkpoint;

  Map<String, dynamic> toJson() => _$RatioCompletionToJson(this);
}
