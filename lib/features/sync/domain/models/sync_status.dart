import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_status.freezed.dart';
part 'sync_status.g.dart';

/// Sync status model
@freezed
/// SyncStatus class
class SyncStatus with _$SyncStatus {
  const factory SyncStatus({
    required String accountId,
    required SyncState state,
    required DateTime lastSync,
    DateTime? nextSync,
    String? currentMailbox,
    int? totalMailboxes,
    int? syncedMailboxes,
    int? totalMessages,
    int? syncedMessages,
    String? error,
    SyncProgress? progress,
  }) = _SyncStatus;

  factory SyncStatus.fromJson(Map<String, dynamic> json) =>
      _$SyncStatusFromJson(json);
}

/// Sync state enumeration
enum SyncState {
  /// Sync is idle and not running
  @JsonValue('idle')
  /// idle
  idle,
  /// Sync is currently in progress
  @JsonValue('syncing')
  /// syncing
  syncing,
  /// Sync is paused by user or system
  @JsonValue('paused')
  /// paused
  paused,
  /// Sync encountered an error
  @JsonValue('error')
  /// error
  error,
  /// Sync completed successfully
  @JsonValue('completed')
  /// completed
  completed,
}

/// Sync progress model
@freezed
/// SyncProgress class
class SyncProgress with _$SyncProgress {
  const factory SyncProgress({
    required double percentage,
    required String currentOperation,
    String? estimatedTimeRemaining,
    int? itemsProcessed,
    int? totalItems,
  }) = _SyncProgress;

  factory SyncProgress.fromJson(Map<String, dynamic> json) =>
      _$SyncProgressFromJson(json);
}

/// Sync configuration model
@freezed
/// SyncConfiguration class
class SyncConfiguration with _$SyncConfiguration {
  const factory SyncConfiguration({
    required String accountId,
    @Default(true) bool autoSync,
    @Default(15) int syncIntervalMinutes,
    @Default(true) bool syncOnWifiOnly,
    @Default(false) bool syncAttachments,
    @Default(100) int maxMessagesPerMailbox,
    @Default(30) int syncHistoryDays,
    List<String>? excludedMailboxes,
    @Default(true) bool enablePushNotifications,
    @Default(false) bool syncInBackground,
  }) = _SyncConfiguration;

  factory SyncConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SyncConfigurationFromJson(json);
}

/// Sync result model
@freezed
/// SyncResult class
class SyncResult with _$SyncResult {
  const factory SyncResult({
    required String accountId,
    required bool success,
    required DateTime startTime,
    required DateTime endTime,
    @Default(0) int newMessages,
    @Default(0) int updatedMessages,
    @Default(0) int deletedMessages,
    @Default(0) int syncedMailboxes,
    List<String>? errors,
    Map<String, int>? mailboxMessageCounts,
  }) = _SyncResult;

  factory SyncResult.fromJson(Map<String, dynamic> json) =>
      _$SyncResultFromJson(json);
}

/// Extension for sync state
extension SyncStateExtension on SyncState {
  /// Get display name
  String get displayName {
    switch (this) {
      case SyncState.idle:
        return 'Idle';
      case SyncState.syncing:
        return 'Syncing';
      case SyncState.paused:
        return 'Paused';
      case SyncState.error:
        return 'Error';
      case SyncState.completed:
        return 'Completed';
    }
  }
  
  /// Check if sync is active
  bool get isActive => this == SyncState.syncing;
  
  /// Check if sync has error
  bool get hasError => this == SyncState.error;
  
  /// Check if sync can be started
  bool get canStart => 
      this == SyncState.idle || 
      this == SyncState.error || 
      this == SyncState.completed;
  
  /// Check if sync can be paused
  bool get canPause => this == SyncState.syncing;
  
  /// Check if sync can be resumed
  bool get canResume => this == SyncState.paused;
}

/// Extension for sync status
extension SyncStatusExtension on SyncStatus {
  /// Get sync progress percentage
  double get progressPercentage => progress?.percentage ?? 0;
  
  /// Get formatted progress text
  String get progressText {
    if (progress == null) return '';
    return '${progress!.percentage.toStringAsFixed(1)}%';
  }
  
  /// Get current operation text
  String get currentOperationText {
    return progress?.currentOperation ?? state.displayName;
  }
  
  /// Check if sync is recent (within last hour)
  bool get isRecentSync {
    return DateTime.now().difference(lastSync).inHours < 1;
  }
  
  /// Get time since last sync
  String get timeSinceLastSync {
    final duration = DateTime.now().difference(lastSync);
    
    if (duration.inMinutes < 1) {
      return 'Just now';
    } else if (duration.inHours < 1) {
      return '${duration.inMinutes}m ago';
    } else if (duration.inDays < 1) {
      return '${duration.inHours}h ago';
    } else {
      return '${duration.inDays}d ago';
    }
  }
  
  /// Get estimated completion time
  String? get estimatedCompletion {
    if (progress?.estimatedTimeRemaining == null) return null;
    return progress!.estimatedTimeRemaining!;
  }
}

/// Extension for sync configuration
extension SyncConfigurationExtension on SyncConfiguration {
  /// Get sync interval in milliseconds
  int get syncIntervalMs => syncIntervalMinutes * 60 * 1000;
  
  /// Get sync history cutoff date
  DateTime get syncHistoryCutoff {
    return DateTime.now().subtract(Duration(days: syncHistoryDays));
  }
  
  /// Check if mailbox should be synced
  bool shouldSyncMailbox(String mailboxPath) {
    if (excludedMailboxes == null) return true;
    return !excludedMailboxes!.contains(mailboxPath);
  }
  
  /// Get configuration summary
  String get configurationSummary {
    final parts = <String>[];
    
    if (autoSync) {
      parts.add('Auto-sync every $syncIntervalMinutes');
    } else {
      parts.add('Manual sync only');
    }
    
    if (syncOnWifiOnly) parts.add('WiFi only');
    if (syncAttachments) parts.add('Include attachments');
    if (enablePushNotifications) parts.add('Push notifications');
    if (syncInBackground) parts.add('Background sync');
    
    return parts.join(', ');
  }
}

/// Extension for sync result
extension SyncResultExtension on SyncResult {
  /// Get sync duration
  Duration get duration => endTime.difference(startTime);
  
  /// Get formatted duration
  String get formattedDuration {
    final duration = this.duration;
    if (duration.inMinutes < 1) {
      return '${duration.inSeconds}s';
    } else if (duration.inHours < 1) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    }
  }
  
  /// Get total message changes
  int get totalChanges => newMessages + updatedMessages + deletedMessages;
  
  /// Get sync summary
  String get syncSummary {
    if (!success) return 'Sync failed';
    
    if (totalChanges == 0) {
      return 'No changes';
    }
    
    final parts = <String>[];
    if (newMessages > 0) parts.add('$newMessages new');
    if (updatedMessages > 0) parts.add('$updatedMessages updated');
    if (deletedMessages > 0) parts.add('$deletedMessages deleted');
    
    return parts.join(', ');
  }
  
  /// Check if sync had errors
  bool get hasErrors => errors?.isNotEmpty ?? false;
  
  /// Get error summary
  String? get errorSummary {
    if (!hasErrors) return null;
    return errors!.join(', ');
  }
}
