'''
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_index.freezed.dart';
part 'search_index.g.dart';

/// Search index status model
@freezed

/// SearchIndexStatus class
class SearchIndexStatus with _$SearchIndexStatus {
  /// Creates a search index status
  const factory SearchIndexStatus({
    /// The ID of the account
    required String accountId,

    /// Whether the account is indexed
    required bool isIndexed,

    /// The total number of messages in the account
    required int totalMessages,

    /// The number of indexed messages in the account
    required int indexedMessages,

    /// The last time the index was updated
    required DateTime lastIndexUpdate,

    /// Whether the account is currently being indexed
    @Default(false) bool isIndexing,

    /// The progress of the indexing process
    double? indexingProgress,

    /// The status of the indexing process
    String? indexingStatus,
  }) = _SearchIndexStatus;

  /// Creates a search index status from a JSON object
  factory SearchIndexStatus.fromJson(Map<String, dynamic> json) =>
      _$SearchIndexStatusFromJson(json);
}

/// Advanced search criteria model
@freezed

/// AdvancedSearchCriteria class
class AdvancedSearchCriteria with _$AdvancedSearchCriteria {
  /// Creates an advanced search criteria
  const factory AdvancedSearchCriteria({
    /// A string of words that must all be present in the search results
    String? allWords,

    /// A string that must be present as an exact phrase in the search results
    String? exactPhrase,

    /// A string of words of which at least one must be present in the search results
    String? anyWords,

    /// A string of words that must not be present in the search results
    String? excludeWords,

    /// The sender of the message
    String? from,

    /// The recipient of the message
    String? to,

    /// The subject of the message
    String? subject,

    /// The body of the message
    String? body,

    /// The start date of the search range
    DateTime? dateFrom,

    /// The end date of the search range
    DateTime? dateTo,

    /// Whether the message has attachments
    bool? hasAttachments,

    /// The types of attachments to search for
    List<String>? attachmentTypes,

    /// Whether the message is read
    bool? isRead,

    /// Whether the message is flagged
    bool? isFlagged,

    /// Whether the message is important
    bool? isImportant,

    /// The minimum size of the message in bytes
    int? minSize,

    /// The maximum size of the message in bytes
    int? maxSize,

    /// The labels to search for
    List<String>? labels,

    /// The mailbox paths to search in
    List<String>? mailboxPaths,
  }) = _AdvancedSearchCriteria;

  /// Creates an advanced search criteria from a JSON object
  factory AdvancedSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$AdvancedSearchCriteriaFromJson(json);
}

/// Search analytics model
@freezed

/// SearchAnalytics class
class SearchAnalytics with _$SearchAnalytics {
  /// Creates a search analytics object
  const factory SearchAnalytics({
    /// The ID of the account
    required String accountId,

    /// The total number of searches performed
    required int totalSearches,

    /// The most frequently searched terms
    required Map<String, int> topSearchTerms,

    /// The number of results for each search
    required Map<String, int> searchResultCounts,

    /// The average time taken for a search
    required Duration averageSearchTime,

    /// The last time a search was performed
    required DateTime lastSearch,

    /// The number of searches performed in each mailbox
    Map<String, int>? searchesByMailbox,

    /// The number of searches performed at different times of the day
    Map<String, int>? searchesByTimeOfDay,
  }) = _SearchAnalytics;

  /// Creates a search analytics object from a JSON object
  factory SearchAnalytics.fromJson(Map<String, dynamic> json) =>
      _$SearchAnalyticsFromJson(json);
}

/// Extension for search index status
extension SearchIndexStatusExtension on SearchIndexStatus {
  /// Get indexing progress percentage
  double get indexingProgressPercentage {
    if (totalMessages == 0) return 100;
    return (indexedMessages / totalMessages) * 100;
  }

  /// Get formatted indexing progress
  String get formattedIndexingProgress {
    return '${indexingProgressPercentage.toStringAsFixed(1)}%';
  }

  /// Get index status summary
  String get indexStatusSummary {
    if (isIndexing) {
      return 'Indexing... $formattedIndexingProgress';
    }

    if (isIndexed) {
      return 'Index up to date ($indexedMessages messages)';
    }

    return 'Index needs update';
  }

  /// Check if index is complete
  bool get isIndexComplete => indexedMessages >= totalMessages;

  /// Check if index is recent (within last day)
  bool get isIndexRecent {
    return DateTime.now().difference(lastIndexUpdate).inDays < 1;
  }
}

/// Extension for advanced search criteria
extension AdvancedSearchCriteriaExtension on AdvancedSearchCriteria {
  /// Check if criteria is empty
  bool get isEmpty {
    return allWords == null &&
        exactPhrase == null &&
        anyWords == null &&
        excludeWords == null &&
        from == null &&
        to == null &&
        subject == null &&
        body == null &&
        dateFrom == null &&
        dateTo == null &&
        hasAttachments == null &&
        (attachmentTypes?.isEmpty ?? true) &&
        isRead == null &&
        isFlagged == null &&
        isImportant == null &&
        minSize == null &&
        maxSize == null &&
        (labels?.isEmpty ?? true) &&
        (mailboxPaths?.isEmpty ?? true);
  }

  /// Get active criteria count
  int get activeCriteriaCount {
    var count = 0;
    if (allWords?.isNotEmpty ?? false) count++;
    if (exactPhrase?.isNotEmpty ?? false) count++;
    if (anyWords?.isNotEmpty ?? false) count++;
    if (excludeWords?.isNotEmpty ?? false) count++;
    if (from?.isNotEmpty ?? false) count++;
    if (to?.isNotEmpty ?? false) count++;
    if (subject?.isNotEmpty ?? false) count++;
    if (body?.isNotEmpty ?? false) count++;
    if (dateFrom != null) count++;
    if (dateTo != null) count++;
    if (hasAttachments != null) count++;
    if (attachmentTypes?.isNotEmpty ?? false) count++;
    if (isRead != null) count++;
    if (isFlagged != null) count++;
    if (isImportant != null) count++;
    if (minSize != null) count++;
    if (maxSize != null) count++;
    if (labels?.isNotEmpty ?? false) count++;
    if (mailboxPaths?.isNotEmpty ?? false) count++;
    return count;
  }

  /// Convert to search query string
  String toQueryString() {
    final parts = <String>[];

    if (allWords?.isNotEmpty ?? false) {
      parts.add(allWords!);
    }

    if (exactPhrase?.isNotEmpty ?? false) {
      parts.add('\"$exactPhrase\"');
    }

    if (anyWords?.isNotEmpty ?? false) {
      final words = anyWords!.split(' ');
      parts.add('(${words.join(' OR ')})');
    }

    if (excludeWords?.isNotEmpty ?? false) {
      final words = excludeWords!.split(' ');
      for (final word in words) {
        parts.add('-$word');
      }
    }

    if (from?.isNotEmpty ?? false) parts.add('from:$from');
    if (to?.isNotEmpty ?? false) parts.add('to:$to');
    if (subject?.isNotEmpty ?? false) parts.add('subject:$subject');
    if (hasAttachments ?? false) parts.add('has:attachment');
    if (isRead ?? false) parts.add('is:read');
    if (isRead == false) parts.add('is:unread');
    if (isFlagged ?? false) parts.add('is:flagged');
    if (isImportant ?? false) parts.add('is:important');

    return parts.join(' ');
  }
}

/// Extension for search analytics
extension SearchAnalyticsExtension on SearchAnalytics {
  /// Get top search term
  String? get topSearchTerm {
    if (topSearchTerms.isEmpty) return null;
    return topSearchTerms.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  /// Get formatted average search time
  String get formattedAverageSearchTime {
    if (averageSearchTime.inMilliseconds < 1000) {
      return '${averageSearchTime.inMilliseconds}ms';
    } else {
      return '${(averageSearchTime.inMilliseconds / 1000).toStringAsFixed(1)}s';
    }
  }

  /// Get analytics summary
  String get analyticsSummary {
    return '$totalSearches searches, avg $formattedAverageSearchTime';
  }

  /// Get most searched mailbox
  String? get mostSearchedMailbox {
    if (searchesByMailbox?.isEmpty ?? true) return null;
    return searchesByMailbox!.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }
}
'''
