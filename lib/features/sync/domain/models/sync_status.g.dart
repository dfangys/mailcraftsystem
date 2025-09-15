// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncStatusImpl _$$SyncStatusImplFromJson(Map<String, dynamic> json) =>
    _$SyncStatusImpl(
      accountId: json['accountId'] as String,
      state: $enumDecode(_$SyncStateEnumMap, json['state']),
      lastSync: DateTime.parse(json['lastSync'] as String),
      nextSync: json['nextSync'] == null
          ? null
          : DateTime.parse(json['nextSync'] as String),
      currentMailbox: json['currentMailbox'] as String?,
      totalMailboxes: (json['totalMailboxes'] as num?)?.toInt(),
      syncedMailboxes: (json['syncedMailboxes'] as num?)?.toInt(),
      totalMessages: (json['totalMessages'] as num?)?.toInt(),
      syncedMessages: (json['syncedMessages'] as num?)?.toInt(),
      error: json['error'] as String?,
      progress: json['progress'] == null
          ? null
          : SyncProgress.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SyncStatusImplToJson(_$SyncStatusImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'state': _$SyncStateEnumMap[instance.state]!,
      'lastSync': instance.lastSync.toIso8601String(),
      'nextSync': instance.nextSync?.toIso8601String(),
      'currentMailbox': instance.currentMailbox,
      'totalMailboxes': instance.totalMailboxes,
      'syncedMailboxes': instance.syncedMailboxes,
      'totalMessages': instance.totalMessages,
      'syncedMessages': instance.syncedMessages,
      'error': instance.error,
      'progress': instance.progress,
    };

const _$SyncStateEnumMap = {
  SyncState.idle: 'idle',
  SyncState.syncing: 'syncing',
  SyncState.paused: 'paused',
  SyncState.error: 'error',
  SyncState.completed: 'completed',
};

_$SyncProgressImpl _$$SyncProgressImplFromJson(Map<String, dynamic> json) =>
    _$SyncProgressImpl(
      percentage: (json['percentage'] as num).toDouble(),
      currentOperation: json['currentOperation'] as String,
      estimatedTimeRemaining: json['estimatedTimeRemaining'] as String?,
      itemsProcessed: (json['itemsProcessed'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SyncProgressImplToJson(_$SyncProgressImpl instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'currentOperation': instance.currentOperation,
      'estimatedTimeRemaining': instance.estimatedTimeRemaining,
      'itemsProcessed': instance.itemsProcessed,
      'totalItems': instance.totalItems,
    };

_$SyncConfigurationImpl _$$SyncConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncConfigurationImpl(
      accountId: json['accountId'] as String,
      autoSync: json['autoSync'] as bool? ?? true,
      syncIntervalMinutes: (json['syncIntervalMinutes'] as num?)?.toInt() ?? 15,
      syncOnWifiOnly: json['syncOnWifiOnly'] as bool? ?? true,
      syncAttachments: json['syncAttachments'] as bool? ?? false,
      maxMessagesPerMailbox:
          (json['maxMessagesPerMailbox'] as num?)?.toInt() ?? 100,
      syncHistoryDays: (json['syncHistoryDays'] as num?)?.toInt() ?? 30,
      excludedMailboxes: (json['excludedMailboxes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      enablePushNotifications: json['enablePushNotifications'] as bool? ?? true,
      syncInBackground: json['syncInBackground'] as bool? ?? false,
    );

Map<String, dynamic> _$$SyncConfigurationImplToJson(
        _$SyncConfigurationImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'autoSync': instance.autoSync,
      'syncIntervalMinutes': instance.syncIntervalMinutes,
      'syncOnWifiOnly': instance.syncOnWifiOnly,
      'syncAttachments': instance.syncAttachments,
      'maxMessagesPerMailbox': instance.maxMessagesPerMailbox,
      'syncHistoryDays': instance.syncHistoryDays,
      'excludedMailboxes': instance.excludedMailboxes,
      'enablePushNotifications': instance.enablePushNotifications,
      'syncInBackground': instance.syncInBackground,
    };

_$SyncResultImpl _$$SyncResultImplFromJson(Map<String, dynamic> json) =>
    _$SyncResultImpl(
      accountId: json['accountId'] as String,
      success: json['success'] as bool,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      newMessages: (json['newMessages'] as num?)?.toInt() ?? 0,
      updatedMessages: (json['updatedMessages'] as num?)?.toInt() ?? 0,
      deletedMessages: (json['deletedMessages'] as num?)?.toInt() ?? 0,
      syncedMailboxes: (json['syncedMailboxes'] as num?)?.toInt() ?? 0,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mailboxMessageCounts:
          (json['mailboxMessageCounts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$SyncResultImplToJson(_$SyncResultImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'success': instance.success,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'newMessages': instance.newMessages,
      'updatedMessages': instance.updatedMessages,
      'deletedMessages': instance.deletedMessages,
      'syncedMailboxes': instance.syncedMailboxes,
      'errors': instance.errors,
      'mailboxMessageCounts': instance.mailboxMessageCounts,
    };
