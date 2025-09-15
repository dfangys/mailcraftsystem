import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/models/auth_token.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/models/login_request.dart';
import '../../domain/models/otp_challenge.dart';
import '../../../../core/error/failures.dart';

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
  Future<({Failure? left, AuthToken? right})> login(LoginRequest request) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate login logic
    if (request.email.isEmpty || request.password.isEmpty) {
      return (left: Failure.auth(message: 'Email and password are required'), right: null);
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
  Future<({Failure? left, AuthToken? right})> verifyOtp(OtpChallenge challenge) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate OTP verification
    if (challenge.code.length != 6) {
      return (left: Failure.auth(message: 'Invalid OTP code'), right: null);
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
  Future<({Failure? left, void right})> logout() async {
    // Simulate logout
    await Future.delayed(const Duration(milliseconds: 500));
    return (left: null, right: null);
  }

  @override
  Future<({Failure? left, UserProfile? right})> getUserProfile() async {
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
  Future<({Failure? left, AuthToken? right})> refreshToken() async {
    return (left: null, right: null);
  }

  @override
  Future<({Failure? left, void right})> resetPassword(String email) async {
    return (left: null, right: null);
  }

  @override
  Future<({Failure? left, void right})> confirmPasswordReset(String token, String newPassword) async {
    return (left: null, right: null);
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
}
