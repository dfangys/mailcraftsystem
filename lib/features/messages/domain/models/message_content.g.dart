// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageContentImpl _$$MessageContentImplFromJson(Map<String, dynamic> json) =>
    _$MessageContentImpl(
      textPlain: json['textPlain'] as String,
      textHtml: json['textHtml'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inlineAttachments: (json['inlineAttachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageContentImplToJson(
        _$MessageContentImpl instance) =>
    <String, dynamic>{
      'textPlain': instance.textPlain,
      'textHtml': instance.textHtml,
      'attachments': instance.attachments,
      'inlineAttachments': instance.inlineAttachments,
    };

_$AttachmentDataImpl _$$AttachmentDataImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentDataImpl(
      name: json['name'] as String,
      mimeType: json['mimeType'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AttachmentDataImplToJson(
        _$AttachmentDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mimeType': instance.mimeType,
      'data': instance.data,
      'size': instance.size,
    };

_$MessageSearchCriteriaImpl _$$MessageSearchCriteriaImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageSearchCriteriaImpl(
      query: json['query'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      subject: json['subject'] as String?,
      body: json['body'] as String?,
      since: json['since'] == null
          ? null
          : DateTime.parse(json['since'] as String),
      before: json['before'] == null
          ? null
          : DateTime.parse(json['before'] as String),
      isRead: json['isRead'] as bool?,
      isFlagged: json['isFlagged'] as bool?,
      hasAttachments: json['hasAttachments'] as bool?,
      priority: $enumDecodeNullable(_$MessagePriorityEnumMap, json['priority']),
    );

Map<String, dynamic> _$$MessageSearchCriteriaImplToJson(
        _$MessageSearchCriteriaImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'from': instance.from,
      'to': instance.to,
      'subject': instance.subject,
      'body': instance.body,
      'since': instance.since?.toIso8601String(),
      'before': instance.before?.toIso8601String(),
      'isRead': instance.isRead,
      'isFlagged': instance.isFlagged,
      'hasAttachments': instance.hasAttachments,
      'priority': _$MessagePriorityEnumMap[instance.priority],
    };

const _$MessagePriorityEnumMap = {
  MessagePriority.highest: 'highest',
  MessagePriority.high: 'high',
  MessagePriority.normal: 'normal',
  MessagePriority.low: 'low',
  MessagePriority.lowest: 'lowest',
};
