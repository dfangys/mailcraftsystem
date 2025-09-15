import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/auth_token.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'auth_controller.freezed.dart';

/// Auth state model
@freezed
class AuthState with _$AuthState {
  /// Creates an auth state
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    @Default(false) bool requiresOtp,
    @Default(false) bool resetEmailSent,
    AuthToken? token,
    UserProfile? user,
    String? error,
  }) = _AuthState;
}

/// Auth controller provider
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(
    loginUseCase: ref.read(loginUseCaseProvider),
    verifyOtpUseCase: ref.read(verifyOtpUseCaseProvider),
    logoutUseCase: ref.read(logoutUseCaseProvider),
  ),
);

/// Auth controller
class AuthController extends StateNotifier<AuthState> {
  /// Creates an auth controller
  AuthController({
    required LoginUseCase loginUseCase,
    required VerifyOtpUseCase verifyOtpUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _verifyOtpUseCase = verifyOtpUseCase,
        _logoutUseCase = logoutUseCase,
        super(const AuthState());

  final LoginUseCase _loginUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final LogoutUseCase _logoutUseCase;

  /// Login with email and password
  Future<void> login(
    String email,
    String password, {
    bool rememberMe = false,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _loginUseCase.execute(
        LoginParams(
          email: email,
          password: password,
          rememberMe: rememberMe,
        ),
      );

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (loginResult) {
          if (loginResult.requiresOtp) {
            state = state.copyWith(
              isLoading: false,
              requiresOtp: true,
              token: loginResult.tempToken,
            );
          } else {
            state = state.copyWith(
              isLoading: false,
              isAuthenticated: true,
              token: loginResult.token,
              user: loginResult.user,
            );
          }
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  /// Verify OTP code
  Future<void> verifyOtp(String otpCode) async {
    if (state.token == null) {
      state = state.copyWith(error: 'No temporary token available');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _verifyOtpUseCase.execute(
        VerifyOtpParams(
          tempToken: state.token!,
          otpCode: otpCode,
        ),
      );

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (verifyResult) {
          state = state.copyWith(
            isLoading: false,
            isAuthenticated: true,
            requiresOtp: false,
            token: verifyResult.token,
            user: verifyResult.user,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  /// Resend OTP code
  Future<void> resendOtp() async {
    // Implementation would call the resend OTP endpoint
    // For now, just show a success message
    state = state.copyWith(error: null);
    // TODO: Implement actual resend OTP logic
  }

  /// Request password reset
  Future<void> requestPasswordReset(String email) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: Implement actual password reset request
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      state = state.copyWith(
        isLoading: false,
        resetEmailSent: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to send reset email: ${e.toString()}',
      );
    }
  }

  /// Logout user
  Future<void> logout() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _logoutUseCase.execute(NoParams());

      result.fold(
        (failure) {
          // Even if logout fails on server, clear local state
          _clearAuthState();
        },
        (_) {
          _clearAuthState();
        },
      );
    } catch (e) {
      // Clear local state even if there's an error
      _clearAuthState();
    }
  }

  void _clearAuthState() {
    state = const AuthState();
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Check if user is authenticated (for app initialization)
  Future<void> checkAuthStatus() async {
    // TODO: Check if there's a valid stored token
    // For now, assume not authenticated
    state = const AuthState();
  }
}
