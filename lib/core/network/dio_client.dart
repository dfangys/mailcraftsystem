import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mailcraftsystem/core/logging/logger.dart';

/// HTTP client configuration using Dio
class DioClient {
  static Dio? _instance;
  
  /// Get configured Dio instance
  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }
  
  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE'] ?? 'https://chase.com.ly',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    
    // Add interceptors
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (object) => AppLogger.debug(object.toString()),
        ),
      );
    }
    
    // Add auth interceptor
    dio.interceptors.add(_AuthInterceptor());
    
    // Add error interceptor
    dio.interceptors.add(_ErrorInterceptor());
    
    return dio;
  }
}

/// Interceptor to add authentication headers
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Add auth token from secure storage
    // final token = await _getAuthToken();
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    handler.next(options);
  }
}

/// Interceptor to handle errors consistently
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error(
      'HTTP Error: ${err.type} - ${err.message}',
      err,
      err.stackTrace,
    );
    
    // Handle specific error types
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        err = err.copyWith(
          message: 'Connection timeout. Please check your internet connection.',
        );
        break;
      case DioExceptionType.connectionError:
        err = err.copyWith(
          message: 'Unable to connect to server. Please check your internet connection.',
        );
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode == 401) {
          err = err.copyWith(message: 'Authentication failed. Please login again.');
        } else if (statusCode == 403) {
          err = err.copyWith(message: 'Access denied.');
        } else if (statusCode == 404) {
          err = err.copyWith(message: 'Resource not found.');
        } else if (statusCode != null && statusCode >= 500) {
          err = err.copyWith(message: 'Server error. Please try again later.');
        }
        break;
      case DioExceptionType.cancel:
        err = err.copyWith(message: 'Request was cancelled.');
        break;
      case DioExceptionType.unknown:
        err = err.copyWith(message: 'An unexpected error occurred.');
        break;
      case DioExceptionType.badCertificate:
        err = err.copyWith(message: 'Certificate verification failed.');
        break;
    }
    
    handler.next(err);
  }
}
