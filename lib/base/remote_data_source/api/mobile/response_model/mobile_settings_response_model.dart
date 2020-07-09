import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mobile_settings_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MobileSettings extends Equatable {
  const MobileSettings({
    @required this.supportPhoneNumber,
    @required this.supportEmail,
    @required this.termsOfUseUrl,
    @required this.privacyUrl,
    @required this.tokenPrecision,
    @required this.baseCurrency,
    @required this.tokenSymbol,
    @required this.registrationMobileSettings,
    @required this.passwordStrength,
    @required this.appVersion,
    @required this.dAppMobileSettings,
    @required this.pinCode,
  });

  factory MobileSettings.fromJson(Map<String, dynamic> json) =>
      _$MobileSettingsFromJson(json);

  @JsonKey(name: 'CustomerSupportPhoneNumber')
  final String supportPhoneNumber;
  @JsonKey(name: 'CustomerSupportEmail')
  final String supportEmail;
  @JsonKey(name: 'PrivacyAndTermsUrl')
  final String termsOfUseUrl;
  final String privacyUrl;
  final int tokenPrecision;
  @JsonKey(name: 'BaseCurrencyCode')
  final String baseCurrency;
  final String tokenSymbol;
  @JsonKey(name: 'Registration')
  final RegistrationMobileSettings registrationMobileSettings;
  final PasswordStrength passwordStrength;
  final AppVersion appVersion;
  @JsonKey(name: 'DApp')
  final DAppMobileSettings dAppMobileSettings;
  final PinCode pinCode;

  Map<String, dynamic> toJson() => _$MobileSettingsToJson(this);

  @override
  List get props => [
        supportPhoneNumber,
        supportEmail,
        termsOfUseUrl,
        privacyUrl,
        tokenPrecision,
        baseCurrency,
        tokenSymbol,
        registrationMobileSettings,
        passwordStrength,
        appVersion,
        dAppMobileSettings,
        pinCode,
      ];
}

@JsonSerializable()
class DAppMobileSettings extends Equatable {
  const DAppMobileSettings({this.linkWalletAppUrlTemplate});

  factory DAppMobileSettings.fromJson(Map<String, dynamic> json) =>
      _$DAppMobileSettingsFromJson(json);

  final String linkWalletAppUrlTemplate;

  Map<String, dynamic> toJson() => _$DAppMobileSettingsToJson(this);

  @override
  List get props => [linkWalletAppUrlTemplate];
}

@JsonSerializable(explicitToJson: true)
class RegistrationMobileSettings extends Equatable {
  const RegistrationMobileSettings(
      {@required this.verificationCodeExpirationPeriod});

  factory RegistrationMobileSettings.fromJson(Map<String, dynamic> json) =>
      _$RegistrationMobileSettingsFromJson(json);

  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration verificationCodeExpirationPeriod;

  Map<String, dynamic> toJson() => _$RegistrationMobileSettingsToJson(this);

  @override
  List get props => [verificationCodeExpirationPeriod];

  static Duration _durationFromJson(String s) {
    var hours = 0;
    var minutes = 0;
    final parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    final seconds = int.parse(parts[parts.length - 1]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  static String _durationToJson(Duration duration) =>
      duration.toString().split('.').first.padLeft(8, '0');
}

@JsonSerializable()
class PasswordStrength extends Equatable {
  const PasswordStrength({
    @required this.minLength,
    @required this.maxLength,
    @required this.minUpperCase,
    @required this.minLowerCase,
    @required this.minNumbers,
    @required this.minSpecialSymbols,
    @required this.specialCharacters,
    @required this.canUseSpaces,
  });

  factory PasswordStrength.fromJson(Map<String, dynamic> json) =>
      _$PasswordStrengthFromJson(json);

  @JsonKey(name: 'MinimumLength')
  final int minLength;
  @JsonKey(name: 'MaximumLength')
  final int maxLength;
  final int minUpperCase;
  final int minLowerCase;
  final int minNumbers;
  final int minSpecialSymbols;
  final String specialCharacters;
  @JsonKey(name: 'Spaces')
  final bool canUseSpaces;

  Map<String, dynamic> toJson() => _$PasswordStrengthToJson(this);

  @override
  List get props => [
        minLength,
        maxLength,
        minUpperCase,
        minLowerCase,
        minNumbers,
        minSpecialSymbols,
        specialCharacters,
        canUseSpaces,
      ];
}

@JsonSerializable()
class PinCode extends Equatable {
  const PinCode({
    @required this.pinCodeLength,
    @required this.pinCodeWarningAttemptCount,
    @required this.pinCodeMaximumAttemptCount,
  });

  factory PinCode.fromJson(Map<String, dynamic> json) =>
      _$PinCodeFromJson(json);

  final int pinCodeLength;
  final int pinCodeWarningAttemptCount;
  final int pinCodeMaximumAttemptCount;

  Map<String, dynamic> toJson() => _$PinCodeToJson(this);

  @override
  List get props => [
        pinCodeLength,
        pinCodeWarningAttemptCount,
        pinCodeMaximumAttemptCount,
      ];
}

@JsonSerializable()
class AppVersion extends Equatable {
  const AppVersion({
    @required this.latestAppVersion,
    @required this.latestMandatoryUpgradeAppVersion,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);

  final String latestAppVersion;
  final String latestMandatoryUpgradeAppVersion;

  Map<String, dynamic> toJson() => _$AppVersionToJson(this);

  @override
  List get props => [
        latestAppVersion,
        latestMandatoryUpgradeAppVersion,
      ];
}
