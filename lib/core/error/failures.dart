import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all failures in the application
@freezed

/// Failure class
class Failure with _$Failure {
  /// Server-related failure with optional status code
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  /// Network connectivity failure
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  /// Authentication and authorization failure
  const factory Failure.auth({
    required String message,
  }) = AuthFailure;

  /// Input validation failure with optional field errors
  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;

  /// Local storage operation failure
  const factory Failure.storage({
    required String message,
  }) = StorageFailure;

  /// Email protocol and mail operation failure
  const factory Failure.mail({
    required String message,
    String? details,
  }) = MailFailure;

  /// Resource not found failure
  const factory Failure.notFound({
    required String message,
  }) = NotFoundFailure;

  /// Feature not implemented failure
  const factory Failure.notImplemented({
    required String message,
  }) = NotImplementedFailure;

  /// Unknown or unexpected failure
  const factory Failure.unknown({
    required String message,
    Object? error,
  }) = UnknownFailure;
}

/// Extension to get user-friendly error messages
extension FailureExtension on Failure {
  String get userMessage {
    return when(
      server: (message, statusCode) => 'Server error: $message',
      network: (message) => 'Network error: Please check your connection',
      auth: (message) => 'Authentication error: $message',
      validation: (message, fieldErrors) => 'Validation error: $message',
      storage: (message) => 'Storage error: $message',
      mail: (message, details) => 'Mail error: $message',
      notFound: (message) => 'Not found: $message',
      notImplemented: (message) => 'Feature not implemented: $message',
      unknown: (message, error) => 'Unknown error: $message',
    );
  }
}
