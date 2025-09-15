import '../models/auth_token.dart';
import '../models/otp_challenge.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';

/// Verify OTP use case
class VerifyOtpUseCase {
  /// Creates a verify OTP use case
  const VerifyOtpUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Repository getter
  AuthRepository get repository => _repository;
  
  /// Execute OTP verification
  Future<({Failure? left, AuthToken? right})> call(OtpChallenge challenge) async {
    // Validate OTP code format
    if (challenge.code.isEmpty) {
      return (
        left: Failure.validation(message: 'OTP code cannot be empty'),
        right: null,
      );
    }
    
    if (challenge.code.length != 6) {
      return (
        left: Failure.validation(message: 'OTP code must be 6 digits'),
        right: null,
      );
    }
    
    if (!RegExp(r'^\d{6}$').hasMatch(challenge.code)) {
      return (
        left: Failure.validation(message: 'OTP code must contain only digits'),
        right: null,
      );
    }
    
    // Perform OTP verification
    return await _repository.verifyOtp(challenge);
  }
}
