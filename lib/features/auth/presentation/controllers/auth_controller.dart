import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/auth_token.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/models/login_request.dart';
import '../../domain/models/otp_challenge.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../providers/auth_providers.dart';

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
      final request = LoginRequest(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      
      final result = await _loginUseCase.call(request);

      if (result.left != null) {
        state = state.copyWith(
          isLoading: false,
          error: result.left!.message,
        );
      } else if (result.right != null) {
        final token = result.right!;
        if (token.requiresOtp) {
          state = state.copyWith(
            isLoading: false,
            requiresOtp: true,
            token: token,
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            isAuthenticated: true,
            token: token,
          );
        }
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  /// Verify OTP code
  Future<void> verifyOtp(String code) async {
    if (state.token == null) {
      state = state.copyWith(error: 'No active session');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final challenge = OtpChallenge(
        token: state.token!.accessToken,
        code: code,
      );
      
      final result = await _verifyOtpUseCase.call(challenge);

      if (result.left != null) {
        state = state.copyWith(
          isLoading: false,
          error: result.left!.message,
        );
      } else if (result.right != null) {
        final token = result.right!;
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          requiresOtp: false,
          token: token,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  /// Resend OTP code
  Future<void> resendOtp() async {
    // Simulate resending OTP
    await Future.delayed(const Duration(seconds: 1));
    // In real implementation, this would call the auth repository
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Simulate password reset
      await Future.delayed(const Duration(seconds: 2));
      
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

  /// Logout
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      await _logoutUseCase.call();
      
      state = const AuthState();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Logout failed: ${e.toString()}',
      );
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Clear reset email sent flag
  void clearResetEmailSent() {
    state = state.copyWith(resetEmailSent: false);
  }
}
