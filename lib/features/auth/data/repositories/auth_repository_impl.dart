import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/auth/data/datasources/auth_api_client.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_challenge.dart';
import 'package:mailcraftsystem/features/auth/domain/models/otp_verification_request.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.apiClient,
    required this.secureStorage,
  });

  final AuthApiClient apiClient;
  final FlutterSecureStorage secureStorage;

  static const String _tokenKey = 'auth_token';

  @override
  Future<Either<Failure, AuthToken>> login(LoginRequest request) async {
    try {
      final response = await apiClient.login(request);
      final data = response['data'] as Map<String, dynamic>;

      final token = AuthToken.fromJson(data);
      // Store token even if requiresOtp=true to allow Authorization header usage in verify-otp
      await storeToken(token);
      return Right(token);
    } on DioException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Login failed'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthToken>> verifyOtp(OtpChallenge challenge) async {
    try {
      final request =
          OtpVerificationRequest(email: challenge.email, otp: challenge.code);
      final temp = await getStoredToken();
      final response = await apiClient.verifyOtp(
        request,
        tempToken: temp?.accessToken,
      );
      final token =
          AuthToken.fromJson(response['data'] as Map<String, dynamic>);
      await storeToken(token);
      return Right(token);
    } on DioException catch (e) {
      return Left(
          Failure.server(message: e.message ?? 'OTP verification failed'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    try {
      final token = await getStoredToken();
      if (token == null) {
        return const Left(Failure.auth(message: 'Not authenticated'));
      }
      final response = await apiClient.getUserProfile(token.accessToken);
      final profile =
          UserProfile.fromJson(response['data'] as Map<String, dynamic>);
      return Right(profile);
    } on DioException catch (e) {
      return Left(
          Failure.server(message: e.message ?? 'Failed to get user profile'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> requestPasswordReset(String email) async {
    try {
      await apiClient.requestPasswordReset(email);
      return const Right(null);
    } on DioException catch (e) {
      return Left(Failure.server(
          message: e.message ?? 'Password reset request failed'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> confirmPasswordReset(
    String email,
    String otp,
    String newPassword,
  ) async {
    try {
      await apiClient.confirmPasswordReset(email, otp, newPassword);
      return const Right(null);
    } on DioException catch (e) {
      return Left(Failure.server(
          message: e.message ?? 'Password reset confirmation failed'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await getStoredToken();
      if (token != null) {
        await apiClient.logout(token.accessToken);
      }
      await clearToken();
      return const Right(null);
    } on DioException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Logout failed'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthToken>> refreshToken() async {
    try {
      final currentToken = await getStoredToken();
      if (currentToken?.refreshToken == null) {
        return const Left(Failure.auth(message: 'No refresh token available'));
      }
      final response =
          await apiClient.refreshToken(currentToken!.refreshToken!);
      final newToken =
          AuthToken.fromJson(response['data'] as Map<String, dynamic>);
      await storeToken(newToken);
      return Right(newToken);
    } on DioException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Token refresh failed'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getStoredToken();
    return token != null && !token.isExpired;
  }

  @override
  Future<AuthToken?> getStoredToken() async {
    final tokenJson = await secureStorage.read(key: _tokenKey);
    if (tokenJson == null) return null;
    return AuthToken.fromJson(jsonDecode(tokenJson) as Map<String, dynamic>);
  }

  @override
  Future<void> storeToken(AuthToken token) async {
    final tokenJson = jsonEncode(token.toJson());
    await secureStorage.write(key: _tokenKey, value: tokenJson);
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    return requestPasswordReset(email);
  }
}
