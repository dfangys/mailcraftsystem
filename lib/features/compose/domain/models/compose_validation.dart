import 'package:freezed_annotation/freezed_annotation.dart';

part 'compose_validation.freezed.dart';
part 'compose_validation.g.dart';

/// Message validation result
@freezed
/// MessageValidationResult class
class MessageValidationResult with _$MessageValidationResult {
  const factory MessageValidationResult({
    required bool isValid,
    List<String>? errors,
    List<String>? warnings,
    MessageSizeInfo? sizeInfo,
  }) = _MessageValidationResult;
  
  factory MessageValidationResult.fromJson(Map<String, dynamic> json) =>
      _$MessageValidationResultFromJson(json);
}

/// Message size information
@freezed
/// MessageSizeInfo class
class MessageSizeInfo with _$MessageSizeInfo {
  const factory MessageSizeInfo({
    required int totalSize,
    required int contentSize,
    required int attachmentSize,
    @Default(false) bool exceedsLimit,
    int? maxAllowedSize,
  }) = _MessageSizeInfo;
  
  factory MessageSizeInfo.fromJson(Map<String, dynamic> json) =>
      _$MessageSizeInfoFromJson(json);
}

/// Address validation result
@freezed
/// AddressValidationResult class
class AddressValidationResult with _$AddressValidationResult {
  const factory AddressValidationResult({
    required String address,
    required bool isValid,
    String? error,
    String? suggestion,
  }) = _AddressValidationResult;
  
  factory AddressValidationResult.fromJson(Map<String, dynamic> json) =>
      _$AddressValidationResultFromJson(json);
}

/// Address suggestion for auto-complete
@freezed
/// AddressSuggestion class
class AddressSuggestion with _$AddressSuggestion {
  const factory AddressSuggestion({
    required String email,
    String? name,
    String? source,
    int? frequency,
    DateTime? lastUsed,
  }) = _AddressSuggestion;
  
  factory AddressSuggestion.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionFromJson(json);
}

/// Contact information
@freezed
/// ContactInfo class
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    required String email,
    String? name,
    String? organization,
    String? phone,
    String? notes,
  }) = _ContactInfo;
  
  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
}

/// Send result
@freezed
/// SendResult class
class SendResult with _$SendResult {
  const factory SendResult({
    required bool success,
    String? messageId,
    String? error,
    DateTime? sentAt,
  }) = _SendResult;
  
  factory SendResult.fromJson(Map<String, dynamic> json) =>
      _$SendResultFromJson(json);
}

/// Extension for message validation result
extension MessageValidationResultExtension on MessageValidationResult {
  /// Check if there are any warnings
  bool get hasWarnings => warnings?.isNotEmpty ?? false;
  
  /// Check if there are any errors
  bool get hasErrors => errors?.isNotEmpty ?? false;
  
  /// Get all issues (errors + warnings)
  List<String> get allIssues {
    final issues = <String>[];
    if (errors != null) issues.addAll(errors!);
    if (warnings != null) issues.addAll(warnings!);
    return issues;
  }
}

/// Extension for message size info
extension MessageSizeInfoExtension on MessageSizeInfo {
  /// Get formatted total size
  String get formattedTotalSize => _formatBytes(totalSize);
  
  /// Get formatted content size
  String get formattedContentSize => _formatBytes(contentSize);
  
  /// Get formatted attachment size
  String get formattedAttachmentSize => _formatBytes(attachmentSize);
  
  /// Get size warning message
  String? get sizeWarning {
    if (!exceedsLimit) return null;
    if (maxAllowedSize == null) return 'Message size is too large';
    return 'Message size ($formattedTotalSize) exceeds limit (${_formatBytes(maxAllowedSize!)})';
  }
  
  /// Format bytes to human readable string
  String _formatBytes(int bytes) {
    const units = ['B', 'KB', 'MB', 'GB'];
    var size = bytes.toDouble();
    var unitIndex = 0;
    
    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }
    
    return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
  }
}

/// Extension for address suggestion
extension AddressSuggestionExtension on AddressSuggestion {
  /// Get display name
  String get displayName => name?.isNotEmpty ?? false ? name! : email;
  
  /// Get formatted suggestion
  String get formatted {
    if (name?.isNotEmpty ?? false) {
      return '$name <$email>';
    }
    return email;
  }
  
  /// Get relevance score for sorting
  double get relevanceScore {
    double score = 0;
    
    // Frequency contributes to score
    if (frequency != null) {
      score += frequency! * 0.1;
    }
    
    // Recent usage contributes to score
    if (lastUsed != null) {
      final daysSinceUsed = DateTime.now().difference(lastUsed!).inDays;
      score += (30 - daysSinceUsed.clamp(0, 30)) * 0.1;
    }
    
    return score;
  }
}
