// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchIndexStatusImpl _$$SearchIndexStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchIndexStatusImpl(
      accountId: json['accountId'] as String,
      isIndexed: json['isIndexed'] as bool,
      totalMessages: (json['totalMessages'] as num).toInt(),
      indexedMessages: (json['indexedMessages'] as num).toInt(),
      lastIndexUpdate: DateTime.parse(json['lastIndexUpdate'] as String),
      isIndexing: json['isIndexing'] as bool? ?? false,
      indexingProgress: (json['indexingProgress'] as num?)?.toDouble(),
      indexingStatus: json['indexingStatus'] as String?,
    );

Map<String, dynamic> _$$SearchIndexStatusImplToJson(
        _$SearchIndexStatusImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'isIndexed': instance.isIndexed,
      'totalMessages': instance.totalMessages,
      'indexedMessages': instance.indexedMessages,
      'lastIndexUpdate': instance.lastIndexUpdate.toIso8601String(),
      'isIndexing': instance.isIndexing,
      'indexingProgress': instance.indexingProgress,
      'indexingStatus': instance.indexingStatus,
    };

_$AdvancedSearchCriteriaImpl _$$AdvancedSearchCriteriaImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvancedSearchCriteriaImpl(
      allWords: json['allWords'] as String?,
      exactPhrase: json['exactPhrase'] as String?,
      anyWords: json['anyWords'] as String?,
      excludeWords: json['excludeWords'] as String?,
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
      attachmentTypes: (json['attachmentTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isRead: json['isRead'] as bool?,
      isFlagged: json['isFlagged'] as bool?,
      isImportant: json['isImportant'] as bool?,
      minSize: (json['minSize'] as num?)?.toInt(),
      maxSize: (json['maxSize'] as num?)?.toInt(),
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mailboxPaths: (json['mailboxPaths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AdvancedSearchCriteriaImplToJson(
        _$AdvancedSearchCriteriaImpl instance) =>
    <String, dynamic>{
      'allWords': instance.allWords,
      'exactPhrase': instance.exactPhrase,
      'anyWords': instance.anyWords,
      'excludeWords': instance.excludeWords,
      'from': instance.from,
      'to': instance.to,
      'subject': instance.subject,
      'body': instance.body,
      'dateFrom': instance.dateFrom?.toIso8601String(),
      'dateTo': instance.dateTo?.toIso8601String(),
      'hasAttachments': instance.hasAttachments,
      'attachmentTypes': instance.attachmentTypes,
      'isRead': instance.isRead,
      'isFlagged': instance.isFlagged,
      'isImportant': instance.isImportant,
      'minSize': instance.minSize,
      'maxSize': instance.maxSize,
      'labels': instance.labels,
      'mailboxPaths': instance.mailboxPaths,
    };

_$SearchAnalyticsImpl _$$SearchAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchAnalyticsImpl(
      accountId: json['accountId'] as String,
      totalSearches: (json['totalSearches'] as num).toInt(),
      topSearchTerms: Map<String, int>.from(json['topSearchTerms'] as Map),
      searchResultCounts:
          Map<String, int>.from(json['searchResultCounts'] as Map),
      averageSearchTime:
          Duration(microseconds: (json['averageSearchTime'] as num).toInt()),
      lastSearch: DateTime.parse(json['lastSearch'] as String),
      searchesByMailbox:
          (json['searchesByMailbox'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      searchesByTimeOfDay:
          (json['searchesByTimeOfDay'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$SearchAnalyticsImplToJson(
        _$SearchAnalyticsImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'totalSearches': instance.totalSearches,
      'topSearchTerms': instance.topSearchTerms,
      'searchResultCounts': instance.searchResultCounts,
      'averageSearchTime': instance.averageSearchTime.inMicroseconds,
      'lastSearch': instance.lastSearch.toIso8601String(),
      'searchesByMailbox': instance.searchesByMailbox,
      'searchesByTimeOfDay': instance.searchesByTimeOfDay,
    };
