import 'package:dio/dio.dart';

import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/auth/data/datasources/auth_api_client.dart';
import 'package:mailcraftsystem/features/auth/data/datasources/secure_storage_service.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthApiClient apiClient,
    required SecureStorageService storageService,
  })  : _apiClient = apiClient,
        _storageService = storageService;
  
  final AuthApiClient _apiClient;
  final SecureStorageService _storageService;
  
  @override
  Future<Either<Failure, AuthToken>> login(LoginRequest request) async {
    try {
      final response = await _apiClient.login(request);
      final token = AuthToken.fromJson(response);
      
      AppLogger.info('Login successful for ${request.email}');
      return (left: null, right: token);
    } on DioException catch (e) {
      AppLogger.error('Login failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected login error', e);
      return (
        left: Failure.unknown(message: 'Login failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, AuthToken>> verifyOtp(
    OtpVerificationRequest request,
  ) async {
    try {
      // Get temporary token from storage
      final tempToken = await _storageService.getToken();
      if (tempToken == null) {
        return (
          left: const Failure.auth(message: 'No temporary token found'),
          right: null,
        );
      }
      
      final response = await _apiClient.verifyOtp(request, tempToken.accessToken);
      final token = AuthToken.fromJson(response);
      
      AppLogger.info('OTP verification successful');
      return (left: null, right: token);
    } on DioException catch (e) {
      AppLogger.error('OTP verification failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected OTP verification error', e);
      return (
        left: Failure.unknown(message: 'OTP verification failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    try {
      final token = await _storageService.getToken();
      if (token == null) {
        return (
          left: const Failure.auth(message: 'No auth token found'),
          right: null,
        );
      }
      
      final response = await _apiClient.getUserProfile(token.accessToken);
      final profile = UserProfile.fromJson(response);
      
      return (left: null, right: profile);
    } on DioException catch (e) {
      AppLogger.error('Get user profile failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected get user profile error', e);
      return (
        left: Failure.unknown(message: 'Get user profile failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> requestPasswordReset(
    PasswordResetRequest request,
  ) async {
    try {
      await _apiClient.requestPasswordReset(request);
      AppLogger.info('Password reset requested for ${request.email}');
      return (left: null, right: null);
    } on DioException catch (e) {
      AppLogger.error('Password reset request failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected password reset request error', e);
      return (
        left: Failure.unknown(message: 'Password reset request failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> confirmPasswordReset(
    PasswordResetConfirmation request,
  ) async {
    try {
      // Use the token from the request
      await _apiClient.confirmPasswordReset(request, request.token);
      AppLogger.info('Password reset confirmed');
      return (left: null, right: null);
    } on DioException catch (e) {
      AppLogger.error('Password reset confirmation failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected password reset confirmation error', e);
      return (
        left: Failure.unknown(message: 'Password reset confirmation failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, UserProfile>> toggleTwoFactor(
    TwoFactorToggleRequest request,
  ) async {
    try {
      final token = await _storageService.getToken();
      if (token == null) {
        return (
          left: const Failure.auth(message: 'No auth token found'),
          right: null,
        );
      }
      
      final response = await _apiClient.toggleTwoFactor(request, token.accessToken);
      final profile = UserProfile.fromJson(response);
      
      AppLogger.info('Two-factor authentication toggled: ${request.enabled}');
      return (left: null, right: profile);
    } on DioException catch (e) {
      AppLogger.error('Toggle two-factor failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected toggle two-factor error', e);
      return (
        left: Failure.unknown(message: 'Toggle two-factor failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await _storageService.getToken();
      if (token != null) {
        await _apiClient.logout(token.accessToken);
      }
      
      AppLogger.info('Logout successful');
      return (left: null, right: null);
    } on DioException catch (e) {
      AppLogger.error('Logout failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected logout error', e);
      return (
        left: Failure.unknown(message: 'Logout failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, AuthToken>> refreshToken() async {
    try {
      final refreshToken = await _storageService.getRefreshToken();
      if (refreshToken == null) {
        return (
          left: const Failure.auth(message: 'No refresh token found'),
          right: null,
        );
      }
      
      final response = await _apiClient.refreshToken(refreshToken);
      final token = AuthToken.fromJson(response);
      
      AppLogger.info('Token refresh successful');
      return (left: null, right: token);
    } on DioException catch (e) {
      AppLogger.error('Token refresh failed', e);
      return (left: _handleDioException(e), right: null);
    } catch (e) {
      AppLogger.error('Unexpected token refresh error', e);
      return (
        left: Failure.unknown(message: 'Token refresh failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<bool> isAuthenticated() async {
    final token = await _storageService.getToken();
    return token != null && !token.isTemporary;
  }
  
  @override
  Future<AuthToken?> getStoredToken() async {
    return await _storageService.getToken();
  }
  
  @override
  Future<void> storeToken(AuthToken token) async {
    await _storageService.storeToken(token);
  }
  
  @override
  Future<void> clearToken() async {
    await _storageService.clearToken();
  }
  
  /// Handle Dio exceptions and convert to Failure
  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network(message: 'Connection timeout');
      
      case DioExceptionType.connectionError:
        return const Failure.network(message: 'Connection error');
      
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] as String? ?? 
                       e.response?.statusMessage ?? 
                       'Server error';
        
        if (statusCode == 401) {
          return Failure.auth(message: message);
        } else if (statusCode == 422) {
          final fieldErrors = e.response?.data?['errors'] as Map<String, dynamic>?;
          return Failure.validation(
            message: message,
            fieldErrors: fieldErrors?.map((k, v) => MapEntry(k, v.toString())),
          );
        } else {
          return Failure.server(message: message, statusCode: statusCode);
        }
      
      case DioExceptionType.cancel:
        return const Failure.unknown(message: 'Request cancelled');
      
      case DioExceptionType.badCertificate:
        return const Failure.network(message: 'Certificate verification failed');
      
      case DioExceptionType.unknown:
        return Failure.unknown(message: e.message ?? 'Unknown error');
    }
  }
}
