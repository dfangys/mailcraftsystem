import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verification_request.freezed.dart';
part 'otp_verification_request.g.dart';

/// OTP verification request model
@freezed
class OtpVerificationRequest with _$OtpVerificationRequest {
  /// Creates OTP verification request
  const factory OtpVerificationRequest({
    required String email,
    required String otp,
  }) = _OtpVerificationRequest;

  /// Creates from JSON
  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationRequestFromJson(json);
}
