import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

part 'search_query.freezed.dart';
part 'search_query.g.dart';

/// Search query model
@freezed
class SearchQuery with _$SearchQuery {
  const factory SearchQuery({
    required String id,
    required String query,
    String? accountId,
    List<String>? mailboxPaths,
    SearchFilters? filters,
    SearchSort? sort,
    @Default(50) int limit,
    @Default(0) int offset,
    DateTime? createdAt,
    @Default(false) bool isSaved,
    String? name,
  }) = _SearchQuery;

  factory SearchQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchQueryFromJson(json);
}

/// Search filters model
@freezed
class SearchFilters with _$SearchFilters {
  const factory SearchFilters({
    String? from,
    String? to,
    String? subject,
    String? body,
    DateTime? dateFrom,
    DateTime? dateTo,
    bool? hasAttachments,
    bool? isRead,
    bool? isFlagged,
    MessagePriority? priority,
    List<String>? attachmentTypes,
    int? minSize,
    int? maxSize,
  }) = _SearchFilters;

  factory SearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersFromJson(json);
}

/// Search sort model
@freezed
class SearchSort with _$SearchSort {
  const factory SearchSort({
    required SearchSortField field,
    required SearchSortOrder order,
  }) = _SearchSort;

  factory SearchSort.fromJson(Map<String, dynamic> json) =>
      _$SearchSortFromJson(json);
}

/// Search result model
@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String queryId,
    required List<Message> messages,
    required int totalCount,
    required bool hasMore,
    required DateTime searchTime,
    required Duration searchDuration,
    SearchStats? stats,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

/// Search statistics model
@freezed
class SearchStats with _$SearchStats {
  const factory SearchStats({
    required int totalMessages,
    required int matchedMessages,
    required Map<String, int> mailboxCounts,
    required Map<String, int> senderCounts,
    required Map<String, int> dateCounts,
  }) = _SearchStats;

  factory SearchStats.fromJson(Map<String, dynamic> json) =>
      _$SearchStatsFromJson(json);
}

/// Search suggestion model
@freezed
class SearchSuggestion with _$SearchSuggestion {
  const factory SearchSuggestion({
    required String text,
    required SearchSuggestionType type,
    String? description,
    int? frequency,
    DateTime? lastUsed,
  }) = _SearchSuggestion;

  factory SearchSuggestion.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionFromJson(json);
}

/// Search history model
@freezed
class SearchHistory with _$SearchHistory {
  const factory SearchHistory({
    required String id,
    required String query,
    required DateTime searchTime,
    int? resultCount,
    String? accountId,
  }) = _SearchHistory;

  factory SearchHistory.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryFromJson(json);
}

/// Search sort field enumeration
enum SearchSortField {
  @JsonValue('relevance')
  relevance,
  @JsonValue('date')
  date,
  @JsonValue('from')
  from,
  @JsonValue('subject')
  subject,
  @JsonValue('size')
  size,
}

/// Search sort order enumeration
enum SearchSortOrder {
  @JsonValue('asc')
  ascending,
  @JsonValue('desc')
  descending,
}

/// Search suggestion type enumeration
enum SearchSuggestionType {
  @JsonValue('query')
  query,
  @JsonValue('sender')
  sender,
  @JsonValue('subject')
  subject,
  @JsonValue('mailbox')
  mailbox,
}

/// Extension for search sort field
extension SearchSortFieldExtension on SearchSortField {
  /// Get display name
  String get displayName {
    switch (this) {
      case SearchSortField.relevance:
        return 'Relevance';
      case SearchSortField.date:
        return 'Date';
      case SearchSortField.from:
        return 'From';
      case SearchSortField.subject:
        return 'Subject';
      case SearchSortField.size:
        return 'Size';
    }
  }
}

/// Extension for search sort order
extension SearchSortOrderExtension on SearchSortOrder {
  /// Get display name
  String get displayName {
    switch (this) {
      case SearchSortOrder.ascending:
        return 'Ascending';
      case SearchSortOrder.descending:
        return 'Descending';
    }
  }
  
  /// Get icon name
  String get iconName {
    switch (this) {
      case SearchSortOrder.ascending:
        return 'arrow_upward';
      case SearchSortOrder.descending:
        return 'arrow_downward';
    }
  }
}

/// Extension for search suggestion type
extension SearchSuggestionTypeExtension on SearchSuggestionType {
  /// Get display name
  String get displayName {
    switch (this) {
      case SearchSuggestionType.query:
        return 'Search Query';
      case SearchSuggestionType.sender:
        return 'Sender';
      case SearchSuggestionType.subject:
        return 'Subject';
      case SearchSuggestionType.mailbox:
        return 'Mailbox';
    }
  }
  
  /// Get icon name
  String get iconName {
    switch (this) {
      case SearchSuggestionType.query:
        return 'search';
      case SearchSuggestionType.sender:
        return 'person';
      case SearchSuggestionType.subject:
        return 'subject';
      case SearchSuggestionType.mailbox:
        return 'folder';
    }
  }
}

/// Extension for search query
extension SearchQueryExtension on SearchQuery {
  /// Check if query has filters
  bool get hasFilters => filters != null && !filters!.isEmpty;
  
  /// Check if query is simple text search
  bool get isSimpleSearch => !hasFilters && query.isNotEmpty;
  
  /// Get query summary for display
  String get querySummary {
    final parts = <String>[query];
    
    if (filters != null) {
      final f = filters!;
      if (f.from?.isNotEmpty == true) parts.add('from:${f.from}');
      if (f.to?.isNotEmpty == true) parts.add('to:${f.to}');
      if (f.subject?.isNotEmpty == true) parts.add('subject:${f.subject}');
      if (f.hasAttachments == true) parts.add('has:attachment');
      if (f.isRead == true) parts.add('is:read');
      if (f.isRead == false) parts.add('is:unread');
      if (f.isFlagged == true) parts.add('is:flagged');
    }
    
    return parts.join(' ');
  }
  
  /// Get estimated search complexity
  SearchComplexity get complexity {
    if (isSimpleSearch && query.length < 10) {
      return SearchComplexity.simple;
    }
    
    if (hasFilters || query.length > 50) {
      return SearchComplexity.complex;
    }
    
    return SearchComplexity.moderate;
  }
}

/// Extension for search filters
extension SearchFiltersExtension on SearchFilters {
  /// Check if filters are empty
  bool get isEmpty {
    return from == null &&
           to == null &&
           subject == null &&
           body == null &&
           dateFrom == null &&
           dateTo == null &&
           hasAttachments == null &&
           isRead == null &&
           isFlagged == null &&
           priority == null &&
           (attachmentTypes?.isEmpty ?? true) &&
           minSize == null &&
           maxSize == null;
  }
  
  /// Get active filter count
  int get activeFilterCount {
    int count = 0;
    if (from?.isNotEmpty == true) count++;
    if (to?.isNotEmpty == true) count++;
    if (subject?.isNotEmpty == true) count++;
    if (body?.isNotEmpty == true) count++;
    if (dateFrom != null) count++;
    if (dateTo != null) count++;
    if (hasAttachments != null) count++;
    if (isRead != null) count++;
    if (isFlagged != null) count++;
    if (priority != null) count++;
    if (attachmentTypes?.isNotEmpty == true) count++;
    if (minSize != null) count++;
    if (maxSize != null) count++;
    return count;
  }
  
  /// Get filter summary
  String get filterSummary {
    final parts = <String>[];
    
    if (from?.isNotEmpty == true) parts.add('From: $from');
    if (to?.isNotEmpty == true) parts.add('To: $to');
    if (subject?.isNotEmpty == true) parts.add('Subject: $subject');
    if (hasAttachments == true) parts.add('Has attachments');
    if (isRead == true) parts.add('Read');
    if (isRead == false) parts.add('Unread');
    if (isFlagged == true) parts.add('Flagged');
    if (priority != null) parts.add('Priority: ${priority!.displayName}');
    
    return parts.join(', ');
  }
}

/// Extension for search result
extension SearchResultExtension on SearchResult {
  /// Check if there are more results
  bool get canLoadMore => hasMore;
  
  /// Get result summary
  String get resultSummary {
    if (totalCount == 0) return 'No results found';
    if (totalCount == 1) return '1 result found';
    return '$totalCount results found';
  }
  
  /// Get search performance summary
  String get performanceSummary {
    return 'Found $totalCount results in ${searchDuration.inMilliseconds}ms';
  }
}

/// Extension for search suggestion
extension SearchSuggestionExtension on SearchSuggestion {
  /// Get relevance score for sorting
  double get relevanceScore {
    double score = 0.0;
    
    // Frequency contributes to score
    if (frequency != null) {
      score += frequency! * 0.1;
    }
    
    // Recent usage contributes to score
    if (lastUsed != null) {
      final daysSinceUsed = DateTime.now().difference(lastUsed!).inDays;
      score += (30 - daysSinceUsed.clamp(0, 30)) * 0.1;
    }
    
    return score;
  }
}

/// Search complexity enumeration
enum SearchComplexity {
  simple,
  moderate,
  complex,
}
