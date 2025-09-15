// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      uid: (json['uid'] as num).toInt(),
      mailboxPath: json['mailboxPath'] as String,
      messageId: json['messageId'] as String?,
      subject: json['subject'] as String?,
      from: json['from'] == null
          ? null
          : MessageAddress.fromJson(json['from'] as Map<String, dynamic>),
      to: (json['to'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      cc: (json['cc'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      bcc: (json['bcc'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyTo: (json['replyTo'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isFlagged: json['isFlagged'] as bool? ?? false,
      isAnswered: json['isAnswered'] as bool? ?? false,
      isDraft: json['isDraft'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      isRecent: json['isRecent'] as bool? ?? false,
      priority: $enumDecodeNullable(_$MessagePriorityEnumMap, json['priority']),
      textPlain: json['textPlain'] as String?,
      textHtml: json['textHtml'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: (json['size'] as num?)?.toInt(),
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      inReplyTo: json['inReplyTo'] as String?,
      references: (json['references'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      receivedAt: json['receivedAt'] == null
          ? null
          : DateTime.parse(json['receivedAt'] as String),
      preview: json['preview'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'mailboxPath': instance.mailboxPath,
      'messageId': instance.messageId,
      'subject': instance.subject,
      'from': instance.from,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'replyTo': instance.replyTo,
      'date': instance.date?.toIso8601String(),
      'isRead': instance.isRead,
      'isFlagged': instance.isFlagged,
      'isAnswered': instance.isAnswered,
      'isDraft': instance.isDraft,
      'isDeleted': instance.isDeleted,
      'isRecent': instance.isRecent,
      'priority': _$MessagePriorityEnumMap[instance.priority],
      'textPlain': instance.textPlain,
      'textHtml': instance.textHtml,
      'attachments': instance.attachments,
      'size': instance.size,
      'flags': instance.flags,
      'inReplyTo': instance.inReplyTo,
      'references': instance.references,
      'receivedAt': instance.receivedAt?.toIso8601String(),
      'preview': instance.preview,
    };

const _$MessagePriorityEnumMap = {
  MessagePriority.highest: 'highest',
  MessagePriority.high: 'high',
  MessagePriority.normal: 'normal',
  MessagePriority.low: 'low',
  MessagePriority.lowest: 'lowest',
};

_$MessageAddressImpl _$$MessageAddressImplFromJson(Map<String, dynamic> json) =>
    _$MessageAddressImpl(
      name: json['name'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$MessageAddressImplToJson(
        _$MessageAddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };

_$MessageAttachmentImpl _$$MessageAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageAttachmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      isInline: json['isInline'] as bool? ?? false,
      contentId: json['contentId'] as String?,
      disposition: json['disposition'] as String?,
    );

Map<String, dynamic> _$$MessageAttachmentImplToJson(
        _$MessageAttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'isInline': instance.isInline,
      'contentId': instance.contentId,
      'disposition': instance.disposition,
    };
