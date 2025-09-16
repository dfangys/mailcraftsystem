import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';
import 'package:mailcraftsystem/features/auth/presentation/providers/auth_providers.dart';
import 'package:mailcraftsystem/features/account/data/datasources/mail_client_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

class AuthState {
  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.token,
    this.error,
    this.requiresOtp = false,
    this.otpDelivery,
    this.resetEmailSent = false,
    this.userEmail,
    this.userPassword,
    this.user,
  });

  final bool isLoading;
  final bool isAuthenticated;
  final AuthToken? token;
  final String? error;
  final bool requiresOtp;
  final String? otpDelivery;
  final bool resetEmailSent;
  final String? userEmail;
  final String? userPassword;
  final UserProfile? user;

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    AuthToken? token,
    String? error,
    bool? requiresOtp,
    String? otpDelivery,
    bool? resetEmailSent,
    String? userEmail,
    String? userPassword,
    UserProfile? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      error: error,
      requiresOtp: requiresOtp ?? this.requiresOtp,
      otpDelivery: otpDelivery ?? this.otpDelivery,
      resetEmailSent: resetEmailSent ?? this.resetEmailSent,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
      user: user ?? this.user,
    );
  }
}

// Provider for mail client service
final mailClientServiceProvider = Provider<MailClientService>((ref) {
  return MailClientService();
});

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState();
  }

  Future<void> _checkAuthStatus() async {
    final authRepository = ref.read(authRepositoryProvider);
    final isAuthenticated = await authRepository.isAuthenticated();
    if (isAuthenticated) {
      final token = await authRepository.getStoredToken();
      state = state.copyWith(
        isAuthenticated: true,
        token: token,
        user: token?.user,
      );
      // Try to restore MailClient using stored credentials on app start
      await _restoreMailClientFromStorage();
    }
  }

  Future<void> _initializeMailClient(String email, String password) async {
    try {
      final mailClientService = ref.read(mailClientServiceProvider);
      final success = await mailClientService.initializeAndConnect(
        email,
        password,
      );
      if (!success) {
        throw Exception('Failed to connect to mail server');
      }
    } catch (e) {
      // Log error but don't fail authentication
      // ignore: avoid_print
      print('Warning: Mail client initialization failed: $e');
    }
  }

  Future<void> _restoreMailClientFromStorage() async {
    final storage = ref.read(secureStorageServiceProvider);
    final creds = await storage.getMailCredentials();
    if (creds != null) {
      await _initializeMailClient(creds.email, creds.password);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      userEmail: email,
      userPassword: password,
    );
    final loginUseCase = ref.read(loginUseCaseProvider);
    final result =
        await loginUseCase(LoginRequest(email: email, password: password));

    AuthToken? token;
    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.message),
      (t) => token = t,
    );

    if (token != null) {
      if (token!.requiresOtp ?? false) {
        state = state.copyWith(
          isLoading: false,
          requiresOtp: true,
          otpDelivery: token!.delivery,
          token: token, // Store temporary token
          user: token!.user,
        );
      } else {
        // Initialize mail client after successful authentication
        await _initializeMailClient(email, password);
        // Persist credentials for future automatic initialization after restart
        await ref
            .read(secureStorageServiceProvider)
            .storeMailCredentials(email, password);
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          token: token,
          user: token!.user,
        );
      }
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    state = state.copyWith(isLoading: true, error: null);
    final verifyOtpUseCase = ref.read(verifyOtpUseCaseProvider);
    final result =
        await verifyOtpUseCase(OtpChallenge(email: email, code: otp));

    AuthToken? token;
    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.message),
      (t) => token = t,
    );

    if (token != null) {
      // Initialize mail client after successful OTP verification
      if (state.userEmail != null && state.userPassword != null) {
        await _initializeMailClient(state.userEmail!, state.userPassword!);
        await ref
            .read(secureStorageServiceProvider)
            .storeMailCredentials(state.userEmail!, state.userPassword!);
      }
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        token: token,
        requiresOtp: false,
        user: token!.user,
      );
    }
  }

  Future<void> requestPasswordReset(String email) async {
    state = state.copyWith(isLoading: true, error: null);
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.requestPasswordReset(email);

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.message),
      (_) => state = state.copyWith(isLoading: false, resetEmailSent: true),
    );
  }

  Future<void> confirmPasswordReset(
      String email, String otp, String newPassword) async {
    state = state.copyWith(isLoading: true, error: null);
    final authRepository = ref.read(authRepositoryProvider);
    final result =
        await authRepository.confirmPasswordReset(email, otp, newPassword);

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.message),
      (_) => state = state.copyWith(
          isLoading: false, resetEmailSent: false), // Reset state
    );
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    // Disconnect mail client
    final mailClientService = ref.read(mailClientServiceProvider);
    await mailClientService.disconnect();
    mailClientService.reset();

    final logoutUseCase = ref.read(logoutUseCaseProvider);
    await logoutUseCase();

    // Clear stored mail credentials as well
    await ref.read(secureStorageServiceProvider).clearMailCredentials();

    state = const AuthState();
  }

  Future<void> resendOtp() async {
    state = state.copyWith(isLoading: true, error: null);
    // Simulate resending OTP
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoading: false);
  }

  Future<void> checkAuthStatus() async {
    await _checkAuthStatus();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

