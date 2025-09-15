import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_challenge.freezed.dart';
part 'otp_challenge.g.dart';

/// OTP challenge model
@freezed
class OtpChallenge with _$OtpChallenge {
  /// Creates an OTP challenge
  const factory OtpChallenge({
    required String email,
    required String code,
  }) = _OtpChallenge;

  /// Creates from JSON
  factory OtpChallenge.fromJson(Map<String, dynamic> json) =>
      _$OtpChallengeFromJson(json);
}
