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
  Future<Either<Failure, AuthToken>> verifyOtp(OtpVerificationRequest request);
  
  /// Get current user profile
  Future<Either<Failure, UserProfile>> getUserProfile();
  
  /// Request password reset
  Future<Either<Failure, void>> requestPasswordReset(PasswordResetRequest request);
  
  /// Confirm password reset
  Future<Either<Failure, void>> confirmPasswordReset(PasswordResetConfirmation request);
  
  /// Toggle two-factor authentication
  Future<Either<Failure, UserProfile>> toggleTwoFactor(TwoFactorToggleRequest request);
  
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

/// Either type for error handling
typedef Either<L, R> = ({L? left, R? right});

/// Extension for Either type
extension EitherExtension<L, R> on Either<L, R> {
  /// Check if this is a left (error) value
  bool get isLeft => left != null;
  
  /// Check if this is a right (success) value
  bool get isRight => right != null;
  
  /// Fold the either into a single value
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) {
    if (isLeft) return onLeft(left as L);
    return onRight(right as R);
  }
}
