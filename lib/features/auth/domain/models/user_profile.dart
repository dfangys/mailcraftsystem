import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// User profile model
@freezed

/// UserProfile class
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    required String name,
    String? avatar,
    @JsonKey(name: 'two_factor_enabled') bool? twoFactorEnabled,
    UserQuota? quota,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// User quota information
@freezed

/// UserQuota class
class UserQuota with _$UserQuota {
  const factory UserQuota({
    required int used,
    required int total,
    String? unit,
  }) = _UserQuota;

  factory UserQuota.fromJson(Map<String, dynamic> json) =>
      _$UserQuotaFromJson(json);
}

/// Extension for quota calculations
extension UserQuotaExtension on UserQuota {
  /// Get usage percentage
  double get usagePercentage => total > 0 ? (used / total) * 100 : 0;

  /// Check if quota is nearly full (>90%)
  bool get isNearlyFull => usagePercentage > 90;

  /// Get formatted usage string
  String get formattedUsage {
    final unitStr = unit ?? 'MB';
    return '$used / $total $unitStr';
  }
}
