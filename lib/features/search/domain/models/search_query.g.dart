// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchQueryImpl _$$SearchQueryImplFromJson(Map<String, dynamic> json) =>
    _$SearchQueryImpl(
      id: json['id'] as String,
      query: json['query'] as String,
      accountId: json['accountId'] as String?,
      mailboxPaths: (json['mailboxPaths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      filters: json['filters'] == null
          ? null
          : SearchFilters.fromJson(json['filters'] as Map<String, dynamic>),
      sort: json['sort'] == null
          ? null
          : SearchSort.fromJson(json['sort'] as Map<String, dynamic>),
      limit: (json['limit'] as num?)?.toInt() ?? 50,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isSaved: json['isSaved'] as bool? ?? false,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$SearchQueryImplToJson(_$SearchQueryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
      'accountId': instance.accountId,
      'mailboxPaths': instance.mailboxPaths,
      'filters': instance.filters,
      'sort': instance.sort,
      'limit': instance.limit,
      'offset': instance.offset,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isSaved': instance.isSaved,
      'name': instance.name,
    };

_$SearchFiltersImpl _$$SearchFiltersImplFromJson(Map<String, dynamic> json) =>
    _$SearchFiltersImpl(
      from: json['from'] as String?,
      to: json['to'] as String?,
      subject: json['subject'] as String?,
      body: json['body'] as String?,
      dateFrom: json['dateFrom'] == null
          ? null
          : DateTime.parse(json['dateFrom'] as String),
      dateTo: json['dateTo'] == null
          ? null
          : DateTime.parse(json['dateTo'] as String),
      hasAttachments: json['hasAttachments'] as bool?,
      isRead: json['isRead'] as bool?,
      isFlagged: json['isFlagged'] as bool?,
      priority: $enumDecodeNullable(_$MessagePriorityEnumMap, json['priority']),
      attachmentTypes: (json['attachmentTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      minSize: (json['minSize'] as num?)?.toInt(),
      maxSize: (json['maxSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SearchFiltersImplToJson(_$SearchFiltersImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'subject': instance.subject,
      'body': instance.body,
      'dateFrom': instance.dateFrom?.toIso8601String(),
      'dateTo': instance.dateTo?.toIso8601String(),
      'hasAttachments': instance.hasAttachments,
      'isRead': instance.isRead,
      'isFlagged': instance.isFlagged,
      'priority': _$MessagePriorityEnumMap[instance.priority],
      'attachmentTypes': instance.attachmentTypes,
      'minSize': instance.minSize,
      'maxSize': instance.maxSize,
    };

const _$MessagePriorityEnumMap = {
  MessagePriority.highest: 'highest',
  MessagePriority.high: 'high',
  MessagePriority.normal: 'normal',
  MessagePriority.low: 'low',
  MessagePriority.lowest: 'lowest',
};

_$SearchSortImpl _$$SearchSortImplFromJson(Map<String, dynamic> json) =>
    _$SearchSortImpl(
      field: $enumDecode(_$SearchSortFieldEnumMap, json['field']),
      order: $enumDecode(_$SearchSortOrderEnumMap, json['order']),
    );

Map<String, dynamic> _$$SearchSortImplToJson(_$SearchSortImpl instance) =>
    <String, dynamic>{
      'field': _$SearchSortFieldEnumMap[instance.field]!,
      'order': _$SearchSortOrderEnumMap[instance.order]!,
    };

const _$SearchSortFieldEnumMap = {
  SearchSortField.relevance: 'relevance',
  SearchSortField.date: 'date',
  SearchSortField.from: 'from',
  SearchSortField.subject: 'subject',
  SearchSortField.size: 'size',
};

const _$SearchSortOrderEnumMap = {
  SearchSortOrder.ascending: 'asc',
  SearchSortOrder.descending: 'desc',
};

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      queryId: json['queryId'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
      searchTime: DateTime.parse(json['searchTime'] as String),
      searchDuration:
          Duration(microseconds: (json['searchDuration'] as num).toInt()),
      stats: json['stats'] == null
          ? null
          : SearchStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'queryId': instance.queryId,
      'messages': instance.messages,
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
      'searchTime': instance.searchTime.toIso8601String(),
      'searchDuration': instance.searchDuration.inMicroseconds,
      'stats': instance.stats,
    };

_$SearchStatsImpl _$$SearchStatsImplFromJson(Map<String, dynamic> json) =>
    _$SearchStatsImpl(
      totalMessages: (json['totalMessages'] as num).toInt(),
      matchedMessages: (json['matchedMessages'] as num).toInt(),
      mailboxCounts: Map<String, int>.from(json['mailboxCounts'] as Map),
      senderCounts: Map<String, int>.from(json['senderCounts'] as Map),
      dateCounts: Map<String, int>.from(json['dateCounts'] as Map),
    );

Map<String, dynamic> _$$SearchStatsImplToJson(_$SearchStatsImpl instance) =>
    <String, dynamic>{
      'totalMessages': instance.totalMessages,
      'matchedMessages': instance.matchedMessages,
      'mailboxCounts': instance.mailboxCounts,
      'senderCounts': instance.senderCounts,
      'dateCounts': instance.dateCounts,
    };

_$SearchSuggestionImpl _$$SearchSuggestionImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchSuggestionImpl(
      text: json['text'] as String,
      type: $enumDecode(_$SearchSuggestionTypeEnumMap, json['type']),
      description: json['description'] as String?,
      frequency: (json['frequency'] as num?)?.toInt(),
      lastUsed: json['lastUsed'] == null
          ? null
          : DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$$SearchSuggestionImplToJson(
        _$SearchSuggestionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$SearchSuggestionTypeEnumMap[instance.type]!,
      'description': instance.description,
      'frequency': instance.frequency,
      'lastUsed': instance.lastUsed?.toIso8601String(),
    };

const _$SearchSuggestionTypeEnumMap = {
  SearchSuggestionType.query: 'query',
  SearchSuggestionType.sender: 'sender',
  SearchSuggestionType.subject: 'subject',
  SearchSuggestionType.mailbox: 'mailbox',
};

_$SearchHistoryImpl _$$SearchHistoryImplFromJson(Map<String, dynamic> json) =>
    _$SearchHistoryImpl(
      id: json['id'] as String,
      query: json['query'] as String,
      searchTime: DateTime.parse(json['searchTime'] as String),
      resultCount: (json['resultCount'] as num?)?.toInt(),
      accountId: json['accountId'] as String?,
    );

Map<String, dynamic> _$$SearchHistoryImplToJson(_$SearchHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
      'searchTime': instance.searchTime.toIso8601String(),
      'resultCount': instance.resultCount,
      'accountId': instance.accountId,
    };
