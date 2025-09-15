import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_connection_result.freezed.dart';
part 'account_connection_result.g.dart';

/// Account connection test result
@freezed
class AccountConnectionResult with _$AccountConnectionResult {
  /// Creates an account connection result
  const factory AccountConnectionResult({
    required bool isSuccess,
    String? details,
    String? errorMessage,
    List<String>? capabilities,
  }) = _AccountConnectionResult;
  
  /// Creates from JSON
  factory AccountConnectionResult.fromJson(Map<String, dynamic> json) =>
      _$AccountConnectionResultFromJson(json);
}

/// Extension for account connection result
extension AccountConnectionResultExtension on AccountConnectionResult {
  /// Get connection status summary
  String get statusSummary {
    if (isSuccess) return details ?? 'Connected successfully';
    return errorMessage ?? 'Connection failed';
  }
}
