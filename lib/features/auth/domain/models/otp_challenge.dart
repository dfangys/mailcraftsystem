import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_challenge.freezed.dart';
part 'otp_challenge.g.dart';

/// OTP challenge model
@freezed
class OtpChallenge with _$OtpChallenge {
  const factory OtpChallenge({
    required String challengeId,
    required String method,
    required int expiresIn,
    String? maskedDestination,
  }) = _OtpChallenge;

  factory OtpChallenge.fromJson(Map<String, dynamic> json) =>
      _$OtpChallengeFromJson(json);
}

/// OTP verification request
@freezed
class OtpVerificationRequest with _$OtpVerificationRequest {
  const factory OtpVerificationRequest({
    required String challengeId,
    required String code,
  }) = _OtpVerificationRequest;

  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationRequestFromJson(json);
}
