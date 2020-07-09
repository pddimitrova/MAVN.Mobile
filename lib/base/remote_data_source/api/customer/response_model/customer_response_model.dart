import 'package:json_annotation/json_annotation.dart';
import 'package:lykke_mobile_mavn/library_utils/string_utils.dart';
import 'package:meta/meta.dart';

part 'customer_response_model.g.dart';

@JsonSerializable()
class CustomerResponseModel {
  CustomerResponseModel({
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
    @required this.phoneCountryCode,
    @required this.phoneCountryCodeId,
    @required this.email,
    @required this.isEmailVerified,
    @required this.isPhoneNumberVerified,
    @required this.isAccountBlocked,
    @required this.countryOfNationalityId,
    @required this.countryOfNationalityName,
    @required this.hasPin,
    @required this.linkedPartnerId,
  });

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseModelFromJson(json);

  String get phoneNumberWithCode =>
      StringUtils.concatenate([phoneCountryCode, phoneNumber]);

  final String firstName;
  final String lastName;
  @JsonKey(nullable: true)
  final String phoneNumber;
  @JsonKey(name: 'CountryPhoneCode', nullable: true)
  final String phoneCountryCode;
  @JsonKey(name: 'CountryPhoneCodeId', nullable: true)
  final int phoneCountryCodeId;
  final String email;
  final bool isEmailVerified;
  final bool isAccountBlocked;
  final bool isPhoneNumberVerified;
  final int countryOfNationalityId;
  final String countryOfNationalityName;
  final bool hasPin;
  @JsonKey(nullable: true)
  final String linkedPartnerId;
}
