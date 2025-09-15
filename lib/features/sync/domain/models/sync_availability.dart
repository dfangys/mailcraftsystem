import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_availability.freezed.dart';
part 'sync_availability.g.dart';

/// Sync availability model
@freezed
/// SyncAvailability class
class SyncAvailability with _$SyncAvailability {
  const factory SyncAvailability({
    required bool isAvailable,
    required bool hasNetworkConnection,
    required bool isOnWifi,
    required bool hasPermissions,
    required bool isAccountActive,
    List<String>? restrictions,
    String? reason,
  }) = _SyncAvailability;
  
  factory SyncAvailability.fromJson(Map<String, dynamic> json) =>
      _$SyncAvailabilityFromJson(json);
}

/// Sync estimate model
@freezed
/// SyncEstimate class
class SyncEstimate with _$SyncEstimate {
  const factory SyncEstimate({
    required Duration estimatedDuration,
    required int estimatedDataUsage,
    required int estimatedNewMessages,
    required Map<String, int> mailboxEstimates,
    DateTime? estimatedCompletion,
  }) = _SyncEstimate;
  
  factory SyncEstimate.fromJson(Map<String, dynamic> json) =>
      _$SyncEstimateFromJson(json);
}

/// Sync statistics model
@freezed
/// SyncStatistics class
class SyncStatistics with _$SyncStatistics {
  const factory SyncStatistics({
    required String accountId,
    required int totalSyncs,
    required int successfulSyncs,
    required int failedSyncs,
    required Duration totalSyncTime,
    required Duration averageSyncTime,
    required int totalMessagesSynced,
    required int totalDataTransferred,
    DateTime? firstSync,
    DateTime? lastSuccessfulSync,
    Map<String, int>? errorCounts,
  }) = _SyncStatistics;
  
  factory SyncStatistics.fromJson(Map<String, dynamic> json) =>
      _$SyncStatisticsFromJson(json);
}

/// Extension for sync availability
extension SyncAvailabilityExtension on SyncAvailability {
  /// Get availability summary
  String get availabilitySummary {
    if (isAvailable) return 'Sync available';
    return reason ?? 'Sync not available';
  }
  
  /// Get restriction summary
  String? get restrictionSummary {
    if (restrictions?.isEmpty ?? true) return null;
    return restrictions!.join(', ');
  }
}

/// Extension for sync estimate
extension SyncEstimateExtension on SyncEstimate {
  /// Get formatted duration
  String get formattedDuration {
    if (estimatedDuration.inMinutes < 1) {
      return '${estimatedDuration.inSeconds}s';
    } else if (estimatedDuration.inHours < 1) {
      return '${estimatedDuration.inMinutes}m';
    } else {
      return '${estimatedDuration.inHours}h ${estimatedDuration.inMinutes % 60}m';
    }
  }
  
  /// Get formatted data usage
  String get formattedDataUsage {
    const units = ['B', 'KB', 'MB', 'GB'];
    double size = estimatedDataUsage.toDouble();
    int unitIndex = 0;
    
    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }
    
    return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
  }
  
  /// Get estimate summary
  String get estimateSummary {
    return 'Estimated: $formattedDuration, $formattedDataUsage, $estimatedNewMessages new messages';
  }
}

/// Extension for sync statistics
extension SyncStatisticsExtension on SyncStatistics {
  /// Get success rate percentage
  double get successRate {
    if (totalSyncs == 0) return 0;
    return (successfulSyncs / totalSyncs) * 100;
  }
  
  /// Get formatted success rate
  String get formattedSuccessRate {
    return '${successRate.toStringAsFixed(1)}%';
  }
  
  /// Get formatted average sync time
  String get formattedAverageSyncTime {
    if (averageSyncTime.inMinutes < 1) {
      return '${averageSyncTime.inSeconds}s';
    } else {
      return '${averageSyncTime.inMinutes}m ${averageSyncTime.inSeconds % 60}s';
    }
  }
  
  /// Get formatted total data transferred
  String get formattedTotalDataTransferred {
    const units = ['B', 'KB', 'MB', 'GB'];
    double size = totalDataTransferred.toDouble();
    int unitIndex = 0;
    
    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }
    
    return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
  }
  
  /// Get statistics summary
  String get statisticsSummary {
    return '$totalSyncs syncs ($formattedSuccessRate success), avg $formattedAverageSyncTime';
  }
}
