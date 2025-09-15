import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

/// Authentication state
class AuthState {
  /// Creates auth state
  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.token,
    this.error,
    this.requiresOtp = false,
    this.otpToken,
    this.resetEmailSent = false,
  });

  /// Loading state
  final bool isLoading;
  
  /// Authentication status
  final bool isAuthenticated;
  
  /// Current auth token
  final AuthToken? token;
  
  /// Error message
  final String? error;
  
  /// Whether OTP is required
  final bool requiresOtp;
  
  /// OTP token for verification
  final String? otpToken;
  
  /// Whether reset email was sent
  final bool resetEmailSent;

  /// Copy with new values
  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    AuthToken? token,
    String? error,
    bool? requiresOtp,
    String? otpToken,
    bool? resetEmailSent,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      error: error ?? this.error,
      requiresOtp: requiresOtp ?? this.requiresOtp,
      otpToken: otpToken ?? this.otpToken,
      resetEmailSent: resetEmailSent ?? this.resetEmailSent,
    );
  }
}

/// Authentication controller
@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    _checkAuthStatus();
    return const AuthState();
  }

  /// Check authentication status on startup
  Future<void> _checkAuthStatus() async {
    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      final isAuth = await loginUseCase.repository.isAuthenticated();
      
      if (isAuth) {
        final token = await loginUseCase.repository.getStoredToken();
        state = state.copyWith(
          isAuthenticated: true,
          token: token,
        );
      }
    } catch (e) {
      AppLogger.error('Failed to check auth status', e);
    }
  }

  /// Check authentication status (public method)
  Future<void> checkAuthStatus() async {
    await _checkAuthStatus();
  }

  /// Login with email and password
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);

    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      final request = LoginRequest(
        email: email,
        password: password,
      );

      final result = await loginUseCase(request);

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (token) {
          if (token.isTemporary) {
            // Requires OTP verification
            state = state.copyWith(
              isLoading: false,
              requiresOtp: true,
              otpToken: token.accessToken,
            );
          } else {
            // Login successful
            state = state.copyWith(
              isLoading: false,
              isAuthenticated: true,
              token: token,
              requiresOtp: false,
            );
          }
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Login failed', e, stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: 'Login failed: $e',
      );
    }
  }

  /// Verify OTP code
  Future<void> verifyOtp(String code) async {
    if (state.otpToken == null) {
      state = state.copyWith(error: 'No OTP token available');
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      final verifyOtpUseCase = ref.read(verifyOtpUseCaseProvider);
      final challenge = OtpChallenge(
        token: state.otpToken!,
        code: code,
      );

      final result = await verifyOtpUseCase(challenge);

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (token) {
          state = state.copyWith(
            isLoading: false,
            isAuthenticated: true,
            token: token,
            requiresOtp: false,
          );
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('OTP verification failed', e, stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: 'OTP verification failed: $e',
      );
    }
  }

  /// Request password reset
  Future<void> requestPasswordReset(String email) async {
    state = state.copyWith(isLoading: true);

    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      final result = await loginUseCase.repository.requestPasswordReset(email);

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (_) {
          state = state.copyWith(
            isLoading: false,
            resetEmailSent: true,
          );
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Password reset request failed', e, stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: 'Password reset request failed: $e',
      );
    }
  }

  /// Logout user
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      final logoutUseCase = ref.read(logoutUseCaseProvider);
      await logoutUseCase();

      state = const AuthState();
    } catch (e, stackTrace) {
      AppLogger.error('Logout failed', e, stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: 'Logout failed: $e',
      );
    }
  }

  /// Resend OTP code
  Future<void> resendOtp() async {
    if (state.otpToken == null) return;
    
    state = state.copyWith(isLoading: true);

    try {
      // Simulate resending OTP
      await Future.delayed(const Duration(seconds: 1));
      
      state = state.copyWith(
        isLoading: false,
        resetEmailSent: true,
      );
      
      AppLogger.info('OTP resent successfully');
    } catch (e, stackTrace) {
      AppLogger.error('Resend OTP failed', e, stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to resend OTP: $e',
      );
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith();
  }
}

