// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compose_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComposeMessageImpl _$$ComposeMessageImplFromJson(Map<String, dynamic> json) =>
    _$ComposeMessageImpl(
      id: json['id'] as String?,
      accountId: json['accountId'] as String,
      to: (json['to'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      cc: (json['cc'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      bcc: (json['bcc'] as List<dynamic>?)
          ?.map((e) => MessageAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String?,
      textContent: json['textContent'] as String?,
      htmlContent: json['htmlContent'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => ComposeAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: $enumDecodeNullable(_$MessagePriorityEnumMap, json['priority']),
      requestReadReceipt: json['requestReadReceipt'] as bool? ?? false,
      requestDeliveryReceipt: json['requestDeliveryReceipt'] as bool? ?? false,
      composeType:
          $enumDecodeNullable(_$ComposeTypeEnumMap, json['composeType']),
      originalMessageId: json['originalMessageId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
      isDraft: json['isDraft'] as bool? ?? false,
      isScheduled: json['isScheduled'] as bool? ?? false,
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
    );

Map<String, dynamic> _$$ComposeMessageImplToJson(
        _$ComposeMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'subject': instance.subject,
      'textContent': instance.textContent,
      'htmlContent': instance.htmlContent,
      'attachments': instance.attachments,
      'priority': _$MessagePriorityEnumMap[instance.priority],
      'requestReadReceipt': instance.requestReadReceipt,
      'requestDeliveryReceipt': instance.requestDeliveryReceipt,
      'composeType': _$ComposeTypeEnumMap[instance.composeType],
      'originalMessageId': instance.originalMessageId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastModified': instance.lastModified?.toIso8601String(),
      'isDraft': instance.isDraft,
      'isScheduled': instance.isScheduled,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
    };

const _$MessagePriorityEnumMap = {
  MessagePriority.highest: 'highest',
  MessagePriority.high: 'high',
  MessagePriority.normal: 'normal',
  MessagePriority.low: 'low',
  MessagePriority.lowest: 'lowest',
};

const _$ComposeTypeEnumMap = {
  ComposeType.newMessage: 'new',
  ComposeType.reply: 'reply',
  ComposeType.replyAll: 'reply_all',
  ComposeType.forward: 'forward',
};

_$ComposeAttachmentImpl _$$ComposeAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$ComposeAttachmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      isInline: json['isInline'] as bool? ?? false,
      contentId: json['contentId'] as String?,
      source: $enumDecodeNullable(_$AttachmentSourceEnumMap, json['source']),
    );

Map<String, dynamic> _$$ComposeAttachmentImplToJson(
        _$ComposeAttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'isInline': instance.isInline,
      'contentId': instance.contentId,
      'source': _$AttachmentSourceEnumMap[instance.source],
    };

const _$AttachmentSourceEnumMap = {
  AttachmentSource.file: 'file',
  AttachmentSource.camera: 'camera',
  AttachmentSource.gallery: 'gallery',
  AttachmentSource.cloud: 'cloud',
};
