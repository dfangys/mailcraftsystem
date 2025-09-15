import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/repositories/auth_repository.dart';

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
  Future<({AuthFailure? left, AuthToken? right})> login(LoginRequest request) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate login logic
    if (request.email.isEmpty || request.password.isEmpty) {
      return (left: AuthFailure('Email and password are required'), right: null);
    }
    
    // Simulate successful login with OTP required
    return (
      left: null,
      right: AuthToken(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        requiresOtp: true,
      ),
    );
  }

  @override
  Future<({AuthFailure? left, AuthToken? right})> verifyOtp(OtpChallenge challenge) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate OTP verification
    if (challenge.code.length != 6) {
      return (left: AuthFailure('Invalid OTP code'), right: null);
    }
    
    return (
      left: null,
      right: AuthToken(
        accessToken: 'verified_access_token',
        refreshToken: 'verified_refresh_token',
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
        requiresOtp: false,
      ),
    );
  }

  @override
  Future<({AuthFailure? left, void right})> logout() async {
    // Simulate logout
    await Future.delayed(const Duration(milliseconds: 500));
    return (left: null, right: null);
  }

  @override
  Future<({AuthFailure? left, UserProfile? right})> getCurrentUser() async {
    return (
      left: null,
      right: UserProfile(
        id: 'mock_user_id',
        email: 'user@example.com',
        name: 'Mock User',
      ),
    );
  }

  @override
  Future<({AuthFailure? left, void right})> refreshToken(String refreshToken) async {
    return (left: null, right: null);
  }

  @override
  Future<({AuthFailure? left, void right})> resetPassword(String email) async {
    return (left: null, right: null);
  }
}

/// Auth failure class
class AuthFailure {
  /// Creates an auth failure
  const AuthFailure(this.message);

  /// Error message
  final String message;
}
