import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// OTP verification use case
class VerifyOtpUseCase {
  const VerifyOtpUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Execute OTP verification
  Future<Either<Failure, AuthToken>> call(OtpVerificationRequest request) async {
    // Validate OTP code
    if (request.code.isEmpty) {
      return (
        left: const Failure.validation(
          message: 'OTP code cannot be empty',
        ),
        right: null,
      );
    }
    
    if (request.code.length < 4 || request.code.length > 8) {
      return (
        left: const Failure.validation(
          message: 'OTP code must be between 4 and 8 digits',
        ),
        right: null,
      );
    }
    
    // Check if code contains only digits
    if (!RegExp(r'^\d+$').hasMatch(request.code)) {
      return (
        left: const Failure.validation(
          message: 'OTP code must contain only numbers',
        ),
        right: null,
      );
    }
    
    // Perform OTP verification
    final result = await _repository.verifyOtp(request);
    
    // Store token if verification successful
    if (result.isRight && result.right != null) {
      await _repository.storeToken(result.right!);
    }
    
    return result;
  }
}
