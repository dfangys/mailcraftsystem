import 'package:dio/dio.dart';

import 'package:mailcraftsystem/core/network/dio_client.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_verification_request.dart';

/// Auth API client
class AuthApiClient {
  AuthApiClient({Dio? dio}) : _dio = dio ?? DioClient.instance;

  final Dio _dio;

  /// Login endpoint
  /// If requires_otp=true and no token present in the JSON body, try to
  /// read an Authorization header and inject it into data.token.
  Future<Map<String, dynamic>> login(LoginRequest request) async {
    final Response<Map<String, dynamic>> response =
        await _dio.post<Map<String, dynamic>>(
      '/api/login',
      data: request.toJson(),
    );
    final map = response.data ?? <String, dynamic>{};
    try {
      final data = (map['data'] as Map).cast<String, dynamic>();
      final requiresOtp = (data['requires_otp'] as bool?) ?? false;
      final hasToken = data.containsKey('token') && (data['token'] as String?)?.isNotEmpty == true;
      if (requiresOtp && !hasToken) {
        final header = response.headers.value('Authorization') ?? response.headers.value('authorization');
        if (header != null && header.isNotEmpty) {
          final token = header.startsWith('Bearer ') ? header.substring(7) : header;
          data['token'] = token;
          map['data'] = data;
        }
      }
    } catch (_) {
      // keep original shape if anything unexpected happens
    }
    return map;
  }

  /// Verify OTP endpoint (optionally with Authorization: Bearer <tempToken>)
  Future<Map<String, dynamic>> verifyOtp(
    OtpVerificationRequest request, {
    String? tempToken,
  }) async {
    final Response<Map<String, dynamic>> response =
        await _dio.post<Map<String, dynamic>>(
      '/api/verify-otp',
      data: request.toJson(),
      options: tempToken != null && tempToken.isNotEmpty
          ? Options(headers: {'Authorization': 'Bearer $tempToken'})
          : null,
    );
    return response.data ?? <String, dynamic>{};
  }

  /// Get user profile endpoint
  Future<Map<String, dynamic>> getUserProfile(String token) async {
    final Response<Map<String, dynamic>> response =
        await _dio.get<Map<String, dynamic>>(
      '/api/user',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response.data ?? <String, dynamic>{};
  }

  /// Request password reset endpoint
  Future<void> requestPasswordReset(String email) async {
    await _dio.post<void>(
      '/api/reset-password/request',
      data: {'email': email},
    );
  }

  /// Confirm password reset endpoint
  Future<void> confirmPasswordReset(
    String email,
    String otp,
    String newPassword,
  ) async {
    await _dio.post<void>(
      '/api/reset-password/confirm',
      data: {
        'email': email,
        'otp': otp,
        'new_password': newPassword,
      },
    );
  }

  /// Toggle two-factor authentication endpoint
  Future<Map<String, dynamic>> toggleTwoFactor(
    bool enabled,
    String token,
  ) async {
    final Response<Map<String, dynamic>> response =
        await _dio.patch<Map<String, dynamic>>(
      '/api/user/two-factor',
      data: {'enabled': enabled},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response.data ?? <String, dynamic>{};
  }

  /// Logout endpoint
  Future<void> logout(String token) async {
    await _dio.post<void>(
      '/api/logout',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  /// Refresh token endpoint
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final Response<Map<String, dynamic>> response =
        await _dio.post<Map<String, dynamic>>(
      '/api/refresh',
      data: {'refresh_token': refreshToken},
    );
    return response.data ?? <String, dynamic>{};
  }
}
