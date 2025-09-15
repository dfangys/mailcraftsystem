// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mailbox_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MailboxStatusImpl _$$MailboxStatusImplFromJson(Map<String, dynamic> json) =>
    _$MailboxStatusImpl(
      path: json['path'] as String,
      messageCount: (json['messageCount'] as num).toInt(),
      unreadCount: (json['unreadCount'] as num).toInt(),
      recentCount: (json['recentCount'] as num).toInt(),
      uidNext: (json['uidNext'] as num?)?.toInt(),
      uidValidity: (json['uidValidity'] as num?)?.toInt(),
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
      isSelectable: json['isSelectable'] as bool?,
    );

Map<String, dynamic> _$$MailboxStatusImplToJson(_$MailboxStatusImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'messageCount': instance.messageCount,
      'unreadCount': instance.unreadCount,
      'recentCount': instance.recentCount,
      'uidNext': instance.uidNext,
      'uidValidity': instance.uidValidity,
      'lastSync': instance.lastSync?.toIso8601String(),
      'isSelectable': instance.isSelectable,
    };

_$MailboxOperationResultImpl _$$MailboxOperationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MailboxOperationResultImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      mailboxData: json['mailboxData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MailboxOperationResultImplToJson(
        _$MailboxOperationResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'mailboxData': instance.mailboxData,
    };
