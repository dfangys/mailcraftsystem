import 'package:dio/dio.dart';

import 'package:mailcraftsystem/core/network/dio_client.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_verification_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';

/// Auth API client
class AuthApiClient {
  AuthApiClient({Dio? dio}) : _dio = dio ?? DioClient.instance;

  final Dio _dio;

  /// Login endpoint
  Future<Map<String, dynamic>> login(LoginRequest request) async {
    final response = await _dio.post(
      '/api/login',
      data: request.toJson(),
    );
    return response.data as Map<String, dynamic>;
  }

  /// Verify OTP endpoint
  Future<Map<String, dynamic>> verifyOtp(
    OtpVerificationRequest request,
    String tempToken,
  ) async {
    final response = await _dio.post(
      '/api/verify-otp',
      data: request.toJson(),
      options: Options(
        headers: {'Authorization': 'Bearer $tempToken'},
      ),
    );
    return response.data as Map<String, dynamic>;
  }

  /// Get user profile endpoint
  Future<Map<String, dynamic>> getUserProfile(String token) async {
    final response = await _dio.get(
      '/api/user',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response.data as Map<String, dynamic>;
  }

  /// Request password reset endpoint
  Future<Map<String, dynamic>> requestPasswordReset(String email) async {
    final response = await _dio.post(
      '/api/reset-password/request',
      data: {'email': email},
    );
    return response.data as Map<String, dynamic>;
  }

  /// Confirm password reset endpoint
  Future<void> confirmPasswordReset(
    String email,
    String otp,
    String newPassword,
  ) async {
    await _dio.post(
      '/api/reset-password/confirm',
      data: {
        'email': email,
        'otp': otp,
        'new_password': newPassword,
      },
    );
  }

  /// Toggle two-factor authentication endpoint
  Future<void> toggleTwoFactor(bool enabled, String token) async {
    await _dio.patch(
      '/api/user/two-factor',
      data: {'enabled': enabled},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  /// Logout endpoint
  Future<void> logout(String token) async {
    await _dio.post(
      '/api/logout',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  /// Refresh token endpoint
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final response = await _dio.post(
      '/api/refresh',
      data: {'refresh_token': refreshToken},
    );
    return response.data as Map<String, dynamic>;
  }
}

