import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/auth/domain/usecases/login_usecase.dart';
import 'package:mailcraftsystem/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mailcraftsystem/features/auth/domain/usecases/verify_otp_usecase.dart';

/// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // This would be replaced with actual implementation
  return MockAuthRepository();
});

/// Login use case provider
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

/// Verify OTP use case provider
final verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>((ref) {
  return VerifyOtpUseCase(ref.read(authRepositoryProvider));
});

/// Logout use case provider
final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(authRepositoryProvider));
});

/// Mock auth repository implementation
class MockAuthRepository implements AuthRepository {
  @override
  Future<Either<Failure, AuthToken>> login(LoginRequest request) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate login logic
    if (request.email.isEmpty || request.password.isEmpty) {
      return const Left(Failure.auth(message: 'Email and password are required'));
    }

    // Simulate successful login with OTP required
    return Right(
      AuthToken(
        accessToken: 'mock_access_token',
        tokenType: 'Bearer',
        expiresIn: 3600,
        refreshToken: 'mock_refresh_token',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        requiresOtp: true,
      ),
    );
  }

  @override
  Future<Either<Failure, AuthToken>> verifyOtp(OtpChallenge challenge) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate OTP verification
    if (challenge.code.length != 6) {
      return const Left(Failure.auth(message: 'Invalid OTP code'));
    }

    return Right(
      AuthToken(
        accessToken: 'verified_access_token',
        tokenType: 'Bearer',
        expiresIn: 86400,
        refreshToken: 'verified_refresh_token',
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
        requiresOtp: false,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Simulate logout
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right(null);
  }

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    return const Right(
      UserProfile(
        id: 'mock_user_id',
        email: 'user@example.com',
        name: 'Mock User',
      ),
    );
  }

  @override
  Future<Either<Failure, AuthToken>> refreshToken() async {
    return const Right(AuthToken(accessToken: 'refreshed_token', tokenType: 'Bearer', expiresIn: 3600));
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> confirmPasswordReset(String email, String otp, String newPassword) async {
    return const Right(null);
  }

  @override
  Future<bool> isAuthenticated() async {
    return false;
  }

  @override
  Future<AuthToken?> getStoredToken() async {
    return null;
  }

  @override
  Future<void> storeToken(AuthToken token) async {
    // Mock implementation
  }

  @override
  Future<void> clearToken() async {
    // Mock implementation
  }

  @override
  Future<Either<Failure, void>> requestPasswordReset(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }
}

