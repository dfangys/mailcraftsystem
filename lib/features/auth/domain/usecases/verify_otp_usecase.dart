import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Verify OTP use case
class VerifyOtpUseCase {
  /// Creates a verify OTP use case
  const VerifyOtpUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Repository getter
  AuthRepository get repository => _repository;
  
  /// Execute OTP verification
  Future<Either<Failure, AuthToken>> call(OtpChallenge challenge) async {
    // Validate OTP code format
    if (challenge.code.isEmpty) {
      return const Left(
        Failure.validation(message: 'OTP code cannot be empty'),
      );
    }
    
    if (challenge.code.length != 6) {
      return const Left(
        Failure.validation(message: 'OTP code must be 6 digits'),
      );
    }
    
    if (!RegExp(r'^\d{6}$').hasMatch(challenge.code)) {
      return const Left(
        Failure.validation(message: 'OTP code must contain only digits'),
      );
    }
    
    // Perform OTP verification
    return _repository.verifyOtp(challenge);
  }
}

