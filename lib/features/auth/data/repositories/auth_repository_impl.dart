import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/auth/data/datasources/auth_api_client.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Implementation of authentication repository
class AuthRepositoryImpl implements AuthRepository {
  /// Creates auth repository implementation
  const AuthRepositoryImpl({
    required this.apiClient,
    required this.secureStorage,
  });

  /// API client for authentication
  final AuthApiClient apiClient;
  
  /// Secure storage for tokens
  final FlutterSecureStorage secureStorage;

  static const String _tokenKey = 'auth_token';

  @override
  Future<({Failure? left, AuthToken? right})> login(LoginRequest request) async {
    try {
      AppLogger.info('Attempting login for ${request.email}');
      
      // Mock login response
      await Future.delayed(const Duration(seconds: 1));
      
      final token = AuthToken(
        accessToken: 'mock_access_token_${DateTime.now().millisecondsSinceEpoch}',
        tokenType: 'Bearer',
        expiresIn: 3600,
        refreshToken: 'mock_refresh_token',
        requiresOtp: request.email.contains('otp'),
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      
      if (!token.isTemporary) {
        await storeToken(token);
      }
      
      AppLogger.info('Login successful for ${request.email}');
      return (left: null, right: token);
    } catch (e, stackTrace) {
      AppLogger.error('Login failed', e, stackTrace);
      return (
        left: Failure.network(message: 'Login failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, AuthToken? right})> verifyOtp(OtpChallenge challenge) async {
    try {
      AppLogger.info('Verifying OTP');
      
      // Mock OTP verification
      await Future.delayed(const Duration(seconds: 1));
      
      if (challenge.code != '123456') {
        return (
          left: const Failure.validation(message: 'Invalid OTP code'),
          right: null,
        );
      }
      
      final token = AuthToken(
        accessToken: 'verified_access_token_${DateTime.now().millisecondsSinceEpoch}',
        tokenType: 'Bearer',
        expiresIn: 3600,
        refreshToken: 'verified_refresh_token',
        requiresOtp: false,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      
      await storeToken(token);
      
      AppLogger.info('OTP verification successful');
      return (left: null, right: token);
    } catch (e, stackTrace) {
      AppLogger.error('OTP verification failed', e, stackTrace);
      return (
        left: Failure.validation(message: 'OTP verification failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, UserProfile? right})> getUserProfile() async {
    try {
      AppLogger.info('Getting user profile');
      
      // Mock user profile
      await Future.delayed(const Duration(milliseconds: 500));
      
      const profile = UserProfile(
        id: 'mock_user_id',
        email: 'user@example.com',
        name: 'Mock User',
        avatarUrl: null,
        isEmailVerified: true,
      );
      
      return (left: null, right: profile);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get user profile', e, stackTrace);
      return (
        left: Failure.network(message: 'Failed to get user profile: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, void right})> resetPassword(String email) async {
    try {
      AppLogger.info('Requesting password reset for $email');
      
      // Mock password reset request
      await Future.delayed(const Duration(seconds: 1));
      
      AppLogger.info('Password reset email sent to $email');
      return (left: null, right: null);
    } catch (e, stackTrace) {
      AppLogger.error('Password reset request failed', e, stackTrace);
      return (
        left: Failure.network(message: 'Password reset request failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, void right})> requestPasswordReset(String email) async {
    return resetPassword(email);
  }

  @override
  Future<({Failure? left, void right})> confirmPasswordReset(
    String token,
    String newPassword,
  ) async {
    try {
      AppLogger.info('Confirming password reset');
      
      // Mock password reset confirmation
      await Future.delayed(const Duration(seconds: 1));
      
      AppLogger.info('Password reset confirmed successfully');
      return (left: null, right: null);
    } catch (e, stackTrace) {
      AppLogger.error('Password reset confirmation failed', e, stackTrace);
      return (
        left: Failure.network(message: 'Password reset confirmation failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, void right})> logout() async {
    try {
      AppLogger.info('Logging out user');
      
      await clearToken();
      
      AppLogger.info('User logged out successfully');
      return (left: null, right: null);
    } catch (e, stackTrace) {
      AppLogger.error('Logout failed', e, stackTrace);
      return (
        left: Failure.unknown(message: 'Logout failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, AuthToken? right})> refreshToken() async {
    try {
      AppLogger.info('Refreshing auth token');
      
      final currentToken = await getStoredToken();
      if (currentToken?.refreshToken == null) {
        return (
          left: const Failure.validation(message: 'No refresh token available'),
          right: null,
        );
      }
      
      // Mock token refresh
      await Future.delayed(const Duration(milliseconds: 500));
      
      final newToken = AuthToken(
        accessToken: 'refreshed_access_token_${DateTime.now().millisecondsSinceEpoch}',
        tokenType: 'Bearer',
        expiresIn: 3600,
        refreshToken: currentToken!.refreshToken,
        requiresOtp: false,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      
      await storeToken(newToken);
      
      AppLogger.info('Token refreshed successfully');
      return (left: null, right: newToken);
    } catch (e, stackTrace) {
      AppLogger.error('Token refresh failed', e, stackTrace);
      return (
        left: Failure.network(message: 'Token refresh failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final token = await getStoredToken();
      return token != null && !token.isTemporary;
    } catch (e) {
      AppLogger.error('Failed to check authentication status', e);
      return false;
    }
  }

  @override
  Future<AuthToken?> getStoredToken() async {
    try {
      final tokenJson = await secureStorage.read(key: _tokenKey);
      if (tokenJson == null) return null;
      
      final tokenMap = jsonDecode(tokenJson) as Map<String, dynamic>;
      return AuthToken.fromJson(tokenMap);
    } catch (e) {
      AppLogger.error('Failed to get stored token', e);
      return null;
    }
  }

  @override
  Future<void> storeToken(AuthToken token) async {
    try {
      final tokenJson = jsonEncode(token.toJson());
      await secureStorage.write(key: _tokenKey, value: tokenJson);
      AppLogger.info('Token stored successfully');
    } catch (e) {
      AppLogger.error('Failed to store token', e);
      rethrow;
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await secureStorage.delete(key: _tokenKey);
      AppLogger.info('Token cleared successfully');
    } catch (e) {
      AppLogger.error('Failed to clear token', e);
      rethrow;
    }
  }
}
