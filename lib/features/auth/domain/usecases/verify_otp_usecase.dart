import '../models/auth_token.dart';
import '../models/otp_challenge.dart';
import '../repositories/auth_repository.dart';
import 'login_usecase.dart';

/// Verify OTP use case
class VerifyOtpUseCase {
  /// Creates a verify OTP use case
  const VerifyOtpUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Execute OTP verification
  Future<({AuthFailure? left, AuthToken? right})> call(OtpChallenge challenge) async {
    // Validate OTP code
    if (challenge.code.isEmpty) {
      return (
        left: AuthFailure('OTP code cannot be empty'),
        right: null,
      );
    }
    
    if (challenge.code.length != 6) {
      return (
        left: AuthFailure('OTP code must be 6 digits'),
        right: null,
      );
    }
    
    // Check if code contains only digits
    if (!RegExp(r'^\d+$').hasMatch(challenge.code)) {
      return (
        left: AuthFailure('OTP code must contain only numbers'),
        right: null,
      );
    }
    
    // Verify OTP
    return await _repository.verifyOtp(challenge);
  }
}
