// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_settings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileSettings _$MobileSettingsFromJson(Map<String, dynamic> json) {
  return MobileSettings(
    supportPhoneNumber: json['CustomerSupportPhoneNumber'] as String,
    supportEmail: json['CustomerSupportEmail'] as String,
    termsOfUseUrl: json['PrivacyAndTermsUrl'] as String,
    privacyUrl: json['PrivacyUrl'] as String,
    tokenPrecision: json['TokenPrecision'] as int,
    baseCurrency: json['BaseCurrencyCode'] as String,
    tokenSymbol: json['TokenSymbol'] as String,
    registrationMobileSettings: json['Registration'] == null
        ? null
        : RegistrationMobileSettings.fromJson(
            json['Registration'] as Map<String, dynamic>),
    passwordStrength: json['PasswordStrength'] == null
        ? null
        : PasswordStrength.fromJson(
            json['PasswordStrength'] as Map<String, dynamic>),
    appVersion: json['AppVersion'] == null
        ? null
        : AppVersion.fromJson(json['AppVersion'] as Map<String, dynamic>),
    dAppMobileSettings: json['DApp'] == null
        ? null
        : DAppMobileSettings.fromJson(json['DApp'] as Map<String, dynamic>),
    pinCode: json['PinCode'] == null
        ? null
        : PinCode.fromJson(json['PinCode'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MobileSettingsToJson(MobileSettings instance) =>
    <String, dynamic>{
      'CustomerSupportPhoneNumber': instance.supportPhoneNumber,
      'CustomerSupportEmail': instance.supportEmail,
      'PrivacyAndTermsUrl': instance.termsOfUseUrl,
      'PrivacyUrl': instance.privacyUrl,
      'TokenPrecision': instance.tokenPrecision,
      'BaseCurrencyCode': instance.baseCurrency,
      'TokenSymbol': instance.tokenSymbol,
      'Registration': instance.registrationMobileSettings?.toJson(),
      'PasswordStrength': instance.passwordStrength?.toJson(),
      'AppVersion': instance.appVersion?.toJson(),
      'DApp': instance.dAppMobileSettings?.toJson(),
      'PinCode': instance.pinCode?.toJson(),
    };

DAppMobileSettings _$DAppMobileSettingsFromJson(Map<String, dynamic> json) {
  return DAppMobileSettings(
    linkWalletAppUrlTemplate: json['LinkWalletAppUrlTemplate'] as String,
  );
}

Map<String, dynamic> _$DAppMobileSettingsToJson(DAppMobileSettings instance) =>
    <String, dynamic>{
      'LinkWalletAppUrlTemplate': instance.linkWalletAppUrlTemplate,
    };

RegistrationMobileSettings _$RegistrationMobileSettingsFromJson(
    Map<String, dynamic> json) {
  return RegistrationMobileSettings(
    verificationCodeExpirationPeriod:
        RegistrationMobileSettings._durationFromJson(
            json['VerificationCodeExpirationPeriod'] as String),
  );
}

Map<String, dynamic> _$RegistrationMobileSettingsToJson(
        RegistrationMobileSettings instance) =>
    <String, dynamic>{
      'VerificationCodeExpirationPeriod':
          RegistrationMobileSettings._durationToJson(
              instance.verificationCodeExpirationPeriod),
    };

PasswordStrength _$PasswordStrengthFromJson(Map<String, dynamic> json) {
  return PasswordStrength(
    minLength: json['MinimumLength'] as int,
    maxLength: json['MaximumLength'] as int,
    minUpperCase: json['MinUpperCase'] as int,
    minLowerCase: json['MinLowerCase'] as int,
    minNumbers: json['MinNumbers'] as int,
    minSpecialSymbols: json['MinSpecialSymbols'] as int,
    specialCharacters: json['SpecialCharacters'] as String,
    canUseSpaces: json['Spaces'] as bool,
  );
}

Map<String, dynamic> _$PasswordStrengthToJson(PasswordStrength instance) =>
    <String, dynamic>{
      'MinimumLength': instance.minLength,
      'MaximumLength': instance.maxLength,
      'MinUpperCase': instance.minUpperCase,
      'MinLowerCase': instance.minLowerCase,
      'MinNumbers': instance.minNumbers,
      'MinSpecialSymbols': instance.minSpecialSymbols,
      'SpecialCharacters': instance.specialCharacters,
      'Spaces': instance.canUseSpaces,
    };

PinCode _$PinCodeFromJson(Map<String, dynamic> json) {
  return PinCode(
    pinCodeLength: json['PinCodeLength'] as int,
    pinCodeWarningAttemptCount: json['PinCodeWarningAttemptCount'] as int,
    pinCodeMaximumAttemptCount: json['PinCodeMaximumAttemptCount'] as int,
  );
}

Map<String, dynamic> _$PinCodeToJson(PinCode instance) => <String, dynamic>{
      'PinCodeLength': instance.pinCodeLength,
      'PinCodeWarningAttemptCount': instance.pinCodeWarningAttemptCount,
      'PinCodeMaximumAttemptCount': instance.pinCodeMaximumAttemptCount,
    };

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) {
  return AppVersion(
    latestAppVersion: json['LatestAppVersion'] as String,
    latestMandatoryUpgradeAppVersion:
        json['LatestMandatoryUpgradeAppVersion'] as String,
  );
}

Map<String, dynamic> _$AppVersionToJson(AppVersion instance) =>
    <String, dynamic>{
      'LatestAppVersion': instance.latestAppVersion,
      'LatestMandatoryUpgradeAppVersion':
          instance.latestMandatoryUpgradeAppVersion,
    };
