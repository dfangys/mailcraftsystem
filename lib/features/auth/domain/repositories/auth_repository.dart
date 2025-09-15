import '../models/auth_token.dart';
import '../models/user_profile.dart';
import '../models/login_request.dart';
import '../models/otp_challenge.dart';
import '../../../../core/error/failures.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email and password
  Future<({Failure? left, AuthToken? right})> login(LoginRequest request);
  
  /// Verify OTP code
  Future<({Failure? left, AuthToken? right})> verifyOtp(OtpChallenge challenge);
  
  /// Get current user profile
  Future<({Failure? left, UserProfile? right})> getUserProfile();
  
  /// Request password reset
  Future<({Failure? left, void right})> resetPassword(String email);
  
  /// Request password reset (alias)
  Future<({Failure? left, void right})> requestPasswordReset(String email);
  
  /// Confirm password reset
  Future<({Failure? left, void right})> confirmPasswordReset(String token, String newPassword);
  
  /// Logout
  Future<({Failure? left, void right})> logout();
  
  /// Refresh access token
  Future<({Failure? left, AuthToken? right})> refreshToken();
  
  /// Check if user is authenticated
  Future<bool> isAuthenticated();
  
  /// Get stored auth token
  Future<AuthToken?> getStoredToken();
  
  /// Store auth token securely
  Future<void> storeToken(AuthToken token);
  
  /// Clear stored token
  Future<void> clearToken();
}
