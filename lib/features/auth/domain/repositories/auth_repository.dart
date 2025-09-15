import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email and password
  Future<Either<Failure, AuthToken>> login(LoginRequest request);
  
  /// Verify OTP code
  Future<Either<Failure, AuthToken>> verifyOtp(OtpChallenge challenge);
  
  /// Get current user profile
  Future<Either<Failure, UserProfile>> getUserProfile();
  
  /// Request password reset
  Future<Either<Failure, void>> resetPassword(String email);
  
  /// Request password reset (alias)
  Future<Either<Failure, void>> requestPasswordReset(String email);
  
  /// Confirm password reset
  Future<Either<Failure, void>> confirmPasswordReset(String email, String otp, String newPassword);
  
  /// Logout
  Future<Either<Failure, void>> logout();
  
  /// Refresh access token
  Future<Either<Failure, AuthToken>> refreshToken();
  
  /// Check if user is authenticated
  Future<bool> isAuthenticated();
  
  /// Get stored auth token
  Future<AuthToken?> getStoredToken();
  
  /// Store auth token securely
  Future<void> storeToken(AuthToken token);
  
  /// Clear stored token
  Future<void> clearToken();
}

