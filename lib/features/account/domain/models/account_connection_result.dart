import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_connection_result.freezed.dart';
part 'account_connection_result.g.dart';

/// Account connection test result
@freezed
/// AccountConnectionResult class
class AccountConnectionResult with _$AccountConnectionResult {
  const factory AccountConnectionResult({
    required bool imapConnected,
    required bool smtpConnected,
    String? imapError,
    String? smtpError,
    AccountCapabilities? capabilities,
  }) = _AccountConnectionResult;
  
  factory AccountConnectionResult.fromJson(Map<String, dynamic> json) =>
      _$AccountConnectionResultFromJson(json);
}

/// Account validation result
@freezed
/// AccountValidationResult class
class AccountValidationResult with _$AccountValidationResult {
  const factory AccountValidationResult({
    required bool isValid,
    Map<String, String>? fieldErrors,
    List<String>? warnings,
  }) = _AccountValidationResult;
  
  factory AccountValidationResult.fromJson(Map<String, dynamic> json) =>
      _$AccountValidationResultFromJson(json);
}

/// Account capabilities
@freezed
/// AccountCapabilities class
class AccountCapabilities with _$AccountCapabilities {
  const factory AccountCapabilities({
    @Default(false) bool supportsIdle,
    @Default(false) bool supportsMove,
    @Default(false) bool supportsSort,
    @Default(false) bool supportsSearch,
    @Default(false) bool supportsQuota,
    @Default(false) bool supportsUidPlus,
    List<String>? supportedExtensions,
    int? maxMessageSize,
  }) = _AccountCapabilities;
  
  factory AccountCapabilities.fromJson(Map<String, dynamic> json) =>
      _$AccountCapabilitiesFromJson(json);
}

/// Extension for account connection result
extension AccountConnectionResultExtension on AccountConnectionResult {
  /// Check if both connections are successful
  bool get isFullyConnected => imapConnected && smtpConnected;
  
  /// Get connection status summary
  String get statusSummary {
    if (isFullyConnected) return 'Connected successfully';
    if (imapConnected && !smtpConnected) return 'IMAP connected, SMTP failed';
    if (!imapConnected && smtpConnected) return 'SMTP connected, IMAP failed';
    return 'Connection failed';
  }
  
  /// Get error messages
  List<String> get errorMessages {
    final errors = <String>[];
    if (imapError != null) errors.add('IMAP: $imapError');
    if (smtpError != null) errors.add('SMTP: $smtpError');
    return errors;
  }
}

/// Extension for account capabilities
extension AccountCapabilitiesExtension on AccountCapabilities {
  /// Get capability summary for UI
  List<String> get capabilitySummary {
    final capabilities = <String>[];
    if (supportsIdle) capabilities.add('Push notifications');
    if (supportsMove) capabilities.add('Move messages');
    if (supportsSort) capabilities.add('Server-side sorting');
    if (supportsSearch) capabilities.add('Server-side search');
    if (supportsQuota) capabilities.add('Quota information');
    return capabilities;
  }
  
  /// Check if account has modern capabilities
  bool get hasModernCapabilities {
    return supportsIdle && supportsMove && supportsSort;
  }
}
