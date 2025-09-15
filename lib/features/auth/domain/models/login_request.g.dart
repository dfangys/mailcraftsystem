// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      rememberMe: json['remember_me'] as bool?,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'remember_me': instance.rememberMe,
    };

_$PasswordResetRequestImpl _$$PasswordResetRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordResetRequestImpl(
      email: json['email'] as String,
    );

Map<String, dynamic> _$$PasswordResetRequestImplToJson(
        _$PasswordResetRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_$PasswordResetConfirmationImpl _$$PasswordResetConfirmationImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordResetConfirmationImpl(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
      confirmPassword: json['confirm_password'] as String,
    );

Map<String, dynamic> _$$PasswordResetConfirmationImplToJson(
        _$PasswordResetConfirmationImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
      'confirm_password': instance.confirmPassword,
    };

_$TwoFactorToggleRequestImpl _$$TwoFactorToggleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TwoFactorToggleRequestImpl(
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$TwoFactorToggleRequestImplToJson(
        _$TwoFactorToggleRequestImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };
