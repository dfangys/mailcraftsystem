// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mailbox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MailboxImpl _$$MailboxImplFromJson(Map<String, dynamic> json) =>
    _$MailboxImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      type: $enumDecode(_$MailboxTypeEnumMap, json['type']),
      messageCount: (json['messageCount'] as num?)?.toInt() ?? 0,
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      recentCount: (json['recentCount'] as num?)?.toInt() ?? 0,
      isSelectable: json['isSelectable'] as bool? ?? false,
      hasChildren: json['hasChildren'] as bool? ?? false,
      isSubscribed: json['isSubscribed'] as bool? ?? false,
      flags: (json['flags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MailboxFlagEnumMap, e))
          .toList(),
      parentPath: json['parentPath'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Mailbox.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
    );

Map<String, dynamic> _$$MailboxImplToJson(_$MailboxImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'type': _$MailboxTypeEnumMap[instance.type]!,
      'messageCount': instance.messageCount,
      'unreadCount': instance.unreadCount,
      'recentCount': instance.recentCount,
      'isSelectable': instance.isSelectable,
      'hasChildren': instance.hasChildren,
      'isSubscribed': instance.isSubscribed,
      'flags': instance.flags?.map((e) => _$MailboxFlagEnumMap[e]!).toList(),
      'parentPath': instance.parentPath,
      'children': instance.children,
      'lastSync': instance.lastSync?.toIso8601String(),
    };

const _$MailboxTypeEnumMap = {
  MailboxType.inbox: 'inbox',
  MailboxType.sent: 'sent',
  MailboxType.drafts: 'drafts',
  MailboxType.trash: 'trash',
  MailboxType.spam: 'spam',
  MailboxType.archive: 'archive',
  MailboxType.custom: 'custom',
  MailboxType.unknown: 'unknown',
};

const _$MailboxFlagEnumMap = {
  MailboxFlag.noselect: 'noselect',
  MailboxFlag.noinferiors: 'noinferiors',
  MailboxFlag.marked: 'marked',
  MailboxFlag.unmarked: 'unmarked',
  MailboxFlag.haschildren: 'haschildren',
  MailboxFlag.hasnochildren: 'hasnochildren',
};
