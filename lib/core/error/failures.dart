import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all failures in the application
@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;
  
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;
  
  const factory Failure.auth({
    required String message,
  }) = AuthFailure;
  
  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;
  
  const factory Failure.storage({
    required String message,
  }) = StorageFailure;
  
  const factory Failure.mail({
    required String message,
    String? details,
  }) = MailFailure;
  
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
      unknown: (message, error) => 'An unexpected error occurred: $message',
    );
  }
}
