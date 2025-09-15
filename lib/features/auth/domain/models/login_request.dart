import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

/// Login request model
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    @JsonKey(name: 'remember_me') bool? rememberMe,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

/// Password reset request model
@freezed
class PasswordResetRequest with _$PasswordResetRequest {
  const factory PasswordResetRequest({
    required String email,
  }) = _PasswordResetRequest;

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetRequestFromJson(json);
}

/// Password reset confirmation model
@freezed
class PasswordResetConfirmation with _$PasswordResetConfirmation {
  const factory PasswordResetConfirmation({
    required String token,
    required String newPassword,
    @JsonKey(name: 'confirm_password') required String confirmPassword,
  }) = _PasswordResetConfirmation;

  factory PasswordResetConfirmation.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetConfirmationFromJson(json);
}

/// Two-factor authentication toggle request
@freezed
class TwoFactorToggleRequest with _$TwoFactorToggleRequest {
  const factory TwoFactorToggleRequest({
    required bool enabled,
  }) = _TwoFactorToggleRequest;

  factory TwoFactorToggleRequest.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorToggleRequestFromJson(json);
}
