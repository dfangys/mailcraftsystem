import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Authentication failure model
@freezed
class AuthFailure with _$AuthFailure {
  /// Invalid credentials failure
  const factory AuthFailure.invalidCredentials({
    @Default('Invalid email or password') String message,
  }) = _InvalidCredentials;

  /// Network failure
  const factory AuthFailure.network({
    @Default('Network error occurred') String message,
  }) = _Network;

  /// Server failure
  const factory AuthFailure.server({
    @Default('Server error occurred') String message,
  }) = _Server;

  /// OTP failure
  const factory AuthFailure.invalidOtp({
    @Default('Invalid OTP code') String message,
  }) = _InvalidOtp;

  /// OTP expired failure
  const factory AuthFailure.otpExpired({
    @Default('OTP code has expired') String message,
  }) = _OtpExpired;

  /// Account locked failure
  const factory AuthFailure.accountLocked({
    @Default('Account is locked') String message,
  }) = _AccountLocked;

  /// Unknown failure
  const factory AuthFailure.unknown({
    @Default('An unknown error occurred') String message,
  }) = _Unknown;
}
