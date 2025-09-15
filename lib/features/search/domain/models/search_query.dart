import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

part 'search_query.freezed.dart';
part 'search_query.g.dart';

/// Search query model
@freezed

/// SearchQuery class
class SearchQuery with _$SearchQuery {
  /// Creates a search query
  const factory SearchQuery({
    /// Unique ID of the search query
    required String id,

    /// The search query string
    required String query,

    /// The ID of the account to search in
    String? accountId,

    /// The paths of the mailboxes to search in
    List<String>? mailboxPaths,

    /// The search filters
    SearchFilters? filters,

    /// The search sort order
    SearchSort? sort,

    /// The maximum number of results to return
    @Default(50) int limit,

    /// The offset of the results to return
    @Default(0) int offset,

    /// The time the search was created
    DateTime? createdAt,

    /// Whether the search is saved
    @Default(false) bool isSaved,

    /// The name of the saved search
    String? name,
  }) = _SearchQuery;

  /// Creates a search query from a JSON object
  factory SearchQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchQueryFromJson(json);
}

/// Search filters model
@freezed

/// SearchFilters class
class SearchFilters with _$SearchFilters {
  /// Creates a search filters object
  const factory SearchFilters({
    /// The sender to filter by
    String? from,

    /// The recipient to filter by
    String? to,

    /// The subject to filter by
    String? subject,

    /// The body to filter by
    String? body,

    /// The start date to filter by
    DateTime? dateFrom,

    /// The end date to filter by
    DateTime? dateTo,

    /// Whether to filter by messages with attachments
    bool? hasAttachments,

    /// Whether to filter by read messages
    bool? isRead,

    /// Whether to filter by flagged messages
    bool? isFlagged,

    /// The priority to filter by
    MessagePriority? priority,

    /// The attachment types to filter by
    List<String>? attachmentTypes,

    /// The minimum size to filter by
    int? minSize,

    /// The maximum size to filter by
    int? maxSize,
  }) = _SearchFilters;

  /// Creates a search filters object from a JSON object
  factory SearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersFromJson(json);
}

/// Search sort model
@freezed

/// SearchSort class
class SearchSort with _$SearchSort {
  /// Creates a search sort object
  const factory SearchSort({
    /// The field to sort by
    required SearchSortField field,

    /// The order to sort by
    required SearchSortOrder order,
  }) = _SearchSort;

  /// Creates a search sort object from a JSON object
  factory SearchSort.fromJson(Map<String, dynamic> json) =>
      _$SearchSortFromJson(json);
}

/// Search result model
@freezed

/// SearchResult class
class SearchResult with _$SearchResult {
  /// Creates a search result object
  const factory SearchResult({
    /// The ID of the search query
    required String queryId,

    /// The messages that match the search query
    required List<Message> messages,

    /// The total number of messages that match the search query
    required int totalCount,

    /// Whether there are more results to load
    required bool hasMore,

    /// The time the search was performed
    required DateTime searchTime,

    /// The duration of the search
    required Duration searchDuration,

    /// The search statistics
    SearchStats? stats,
  }) = _SearchResult;

  /// Creates a search result object from a JSON object
  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

/// Search statistics model
@freezed

/// SearchStats class
class SearchStats with _$SearchStats {
  /// Creates a search stats object
  const factory SearchStats({
    /// The total number of messages in the searched mailboxes
    required int totalMessages,

    /// The number of messages that matched the search query
    required int matchedMessages,

    /// The number of messages in each mailbox
    required Map<String, int> mailboxCounts,

    /// The number of messages from each sender
    required Map<String, int> senderCounts,

    /// The number of messages in each date range
    required Map<String, int> dateCounts,
  }) = _SearchStats;

  /// Creates a search stats object from a JSON object
  factory SearchStats.fromJson(Map<String, dynamic> json) =>
      _$SearchStatsFromJson(json);
}

/// Search suggestion model
@freezed

/// SearchSuggestion class
class SearchSuggestion with _$SearchSuggestion {
  /// Creates a search suggestion object
  const factory SearchSuggestion({
    /// The suggestion text
    required String text,

    /// The type of the suggestion
    required SearchSuggestionType type,

    /// The description of the suggestion
    String? description,

    /// The frequency of the suggestion
    int? frequency,

    /// The last time the suggestion was used
    DateTime? lastUsed,
  }) = _SearchSuggestion;

  /// Creates a search suggestion object from a JSON object
  factory SearchSuggestion.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionFromJson(json);
}

/// Search history model
@freezed

/// SearchHistory class
class SearchHistory with _$SearchHistory {
  /// Creates a search history object
  const factory SearchHistory({
    /// The ID of the search history item
    required String id,

    /// The search query
    required String query,

    /// The time the search was performed
    required DateTime searchTime,

    /// The number of results found
    int? resultCount,

    /// The ID of the account that was searched
    String? accountId,
  }) = _SearchHistory;

  /// Creates a search history object from a JSON object
  factory SearchHistory.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryFromJson(json);
}

/// Search sort field enumeration
enum SearchSortField {
  /// Sort by relevance
  @JsonValue('relevance')
  relevance,

  /// Sort by date
  @JsonValue('date')
  date,

  /// Sort by sender
  @JsonValue('from')
  from,

  /// Sort by subject
  @JsonValue('subject')
  subject,

  /// Sort by size
  @JsonValue('size')
  size,
}

/// Search sort order enumeration
enum SearchSortOrder {
  /// Sort in ascending order
  @JsonValue('asc')
  ascending,

  /// Sort in descending order
  @JsonValue('desc')
  descending,
}

/// Search suggestion type enumeration
enum SearchSuggestionType {
  /// A search query suggestion
  @JsonValue('query')
  query,

  /// A sender suggestion
  @JsonValue('sender')
  sender,

  /// A subject suggestion
  @JsonValue('subject')
  subject,

  /// A mailbox suggestion
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
      if (f.from?.isNotEmpty ?? false) parts.add('from:${f.from}');
      if (f.to?.isNotEmpty ?? false) parts.add('to:${f.to}');
      if (f.subject?.isNotEmpty ?? false) parts.add('subject:${f.subject}');
      if (f.hasAttachments ?? false) parts.add('has:attachment');
      if (f.isRead ?? false) parts.add('is:read');
      if (f.isRead == false) parts.add('is:unread');
      if (f.isFlagged ?? false) parts.add('is:flagged');
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
    var count = 0;
    if (from?.isNotEmpty ?? false) count++;
    if (to?.isNotEmpty ?? false) count++;
    if (subject?.isNotEmpty ?? false) count++;
    if (body?.isNotEmpty ?? false) count++;
    if (dateFrom != null) count++;
    if (dateTo != null) count++;
    if (hasAttachments != null) count++;
    if (isRead != null) count++;
    if (isFlagged != null) count++;
    if (priority != null) count++;
    if (attachmentTypes?.isNotEmpty ?? false) count++;
    if (minSize != null) count++;
    if (maxSize != null) count++;
    return count;
  }

  /// Get filter summary
  String get filterSummary {
    final parts = <String>[];

    if (from?.isNotEmpty ?? false) parts.add('From: $from');
    if (to?.isNotEmpty ?? false) parts.add('To: $to');
    if (subject?.isNotEmpty ?? false) parts.add('Subject: $subject');
    if (hasAttachments ?? false) parts.add('Has attachments');
    if (isRead ?? false) parts.add('Read');
    if (isRead == false) parts.add('Unread');
    if (isFlagged ?? false) parts.add('Flagged');
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
    double score = 0;

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
  /// A simple search
  simple,

  /// A moderately complex search
  moderate,

  /// A complex search
  complex,
}

