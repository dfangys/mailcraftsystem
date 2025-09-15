// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncAvailabilityImpl _$$SyncAvailabilityImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncAvailabilityImpl(
      isAvailable: json['isAvailable'] as bool,
      hasNetworkConnection: json['hasNetworkConnection'] as bool,
      isOnWifi: json['isOnWifi'] as bool,
      hasPermissions: json['hasPermissions'] as bool,
      isAccountActive: json['isAccountActive'] as bool,
      restrictions: (json['restrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$SyncAvailabilityImplToJson(
        _$SyncAvailabilityImpl instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'hasNetworkConnection': instance.hasNetworkConnection,
      'isOnWifi': instance.isOnWifi,
      'hasPermissions': instance.hasPermissions,
      'isAccountActive': instance.isAccountActive,
      'restrictions': instance.restrictions,
      'reason': instance.reason,
    };

_$SyncEstimateImpl _$$SyncEstimateImplFromJson(Map<String, dynamic> json) =>
    _$SyncEstimateImpl(
      estimatedDuration:
          Duration(microseconds: (json['estimatedDuration'] as num).toInt()),
      estimatedDataUsage: (json['estimatedDataUsage'] as num).toInt(),
      estimatedNewMessages: (json['estimatedNewMessages'] as num).toInt(),
      mailboxEstimates: Map<String, int>.from(json['mailboxEstimates'] as Map),
      estimatedCompletion: json['estimatedCompletion'] == null
          ? null
          : DateTime.parse(json['estimatedCompletion'] as String),
    );

Map<String, dynamic> _$$SyncEstimateImplToJson(_$SyncEstimateImpl instance) =>
    <String, dynamic>{
      'estimatedDuration': instance.estimatedDuration.inMicroseconds,
      'estimatedDataUsage': instance.estimatedDataUsage,
      'estimatedNewMessages': instance.estimatedNewMessages,
      'mailboxEstimates': instance.mailboxEstimates,
      'estimatedCompletion': instance.estimatedCompletion?.toIso8601String(),
    };

_$SyncStatisticsImpl _$$SyncStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$SyncStatisticsImpl(
      accountId: json['accountId'] as String,
      totalSyncs: (json['totalSyncs'] as num).toInt(),
      successfulSyncs: (json['successfulSyncs'] as num).toInt(),
      failedSyncs: (json['failedSyncs'] as num).toInt(),
      totalSyncTime:
          Duration(microseconds: (json['totalSyncTime'] as num).toInt()),
      averageSyncTime:
          Duration(microseconds: (json['averageSyncTime'] as num).toInt()),
      totalMessagesSynced: (json['totalMessagesSynced'] as num).toInt(),
      totalDataTransferred: (json['totalDataTransferred'] as num).toInt(),
      firstSync: json['firstSync'] == null
          ? null
          : DateTime.parse(json['firstSync'] as String),
      lastSuccessfulSync: json['lastSuccessfulSync'] == null
          ? null
          : DateTime.parse(json['lastSuccessfulSync'] as String),
      errorCounts: (json['errorCounts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$SyncStatisticsImplToJson(
        _$SyncStatisticsImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'totalSyncs': instance.totalSyncs,
      'successfulSyncs': instance.successfulSyncs,
      'failedSyncs': instance.failedSyncs,
      'totalSyncTime': instance.totalSyncTime.inMicroseconds,
      'averageSyncTime': instance.averageSyncTime.inMicroseconds,
      'totalMessagesSynced': instance.totalMessagesSynced,
      'totalDataTransferred': instance.totalDataTransferred,
      'firstSync': instance.firstSync?.toIso8601String(),
      'lastSuccessfulSync': instance.lastSuccessfulSync?.toIso8601String(),
      'errorCounts': instance.errorCounts,
    };
