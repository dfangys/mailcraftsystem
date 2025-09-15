import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_index.freezed.dart';
part 'search_index.g.dart';

/// Search index status model
@freezed
/// SearchIndexStatus class
class SearchIndexStatus with _$SearchIndexStatus {
  const factory SearchIndexStatus({
    required String accountId,
    required bool isIndexed,
    required int totalMessages,
    required int indexedMessages,
    required DateTime lastIndexUpdate,
    @Default(false) bool isIndexing,
    double? indexingProgress,
    String? indexingStatus,
  }) = _SearchIndexStatus;
  
  factory SearchIndexStatus.fromJson(Map<String, dynamic> json) =>
      _$SearchIndexStatusFromJson(json);
}

/// Advanced search criteria model
@freezed
/// AdvancedSearchCriteria class
class AdvancedSearchCriteria with _$AdvancedSearchCriteria {
  const factory AdvancedSearchCriteria({
    String? allWords,
    String? exactPhrase,
    String? anyWords,
    String? excludeWords,
    String? from,
    String? to,
    String? subject,
    String? body,
    DateTime? dateFrom,
    DateTime? dateTo,
    bool? hasAttachments,
    List<String>? attachmentTypes,
    bool? isRead,
    bool? isFlagged,
    bool? isImportant,
    int? minSize,
    int? maxSize,
    List<String>? labels,
    List<String>? mailboxPaths,
  }) = _AdvancedSearchCriteria;
  
  factory AdvancedSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$AdvancedSearchCriteriaFromJson(json);
}

/// Search analytics model
@freezed
/// SearchAnalytics class
class SearchAnalytics with _$SearchAnalytics {
  const factory SearchAnalytics({
    required String accountId,
    required int totalSearches,
    required Map<String, int> topSearchTerms,
    required Map<String, int> searchResultCounts,
    required Duration averageSearchTime,
    required DateTime lastSearch,
    Map<String, int>? searchesByMailbox,
    Map<String, int>? searchesByTimeOfDay,
  }) = _SearchAnalytics;
  
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
    int count = 0;
    if (allWords?.isNotEmpty == true) count++;
    if (exactPhrase?.isNotEmpty == true) count++;
    if (anyWords?.isNotEmpty == true) count++;
    if (excludeWords?.isNotEmpty == true) count++;
    if (from?.isNotEmpty == true) count++;
    if (to?.isNotEmpty == true) count++;
    if (subject?.isNotEmpty == true) count++;
    if (body?.isNotEmpty == true) count++;
    if (dateFrom != null) count++;
    if (dateTo != null) count++;
    if (hasAttachments != null) count++;
    if (attachmentTypes?.isNotEmpty == true) count++;
    if (isRead != null) count++;
    if (isFlagged != null) count++;
    if (isImportant != null) count++;
    if (minSize != null) count++;
    if (maxSize != null) count++;
    if (labels?.isNotEmpty == true) count++;
    if (mailboxPaths?.isNotEmpty == true) count++;
    return count;
  }
  
  /// Convert to search query string
  String toQueryString() {
    final parts = <String>[];
    
    if (allWords?.isNotEmpty == true) {
      parts.add(allWords!);
    }
    
    if (exactPhrase?.isNotEmpty == true) {
      parts.add('"$exactPhrase"');
    }
    
    if (anyWords?.isNotEmpty == true) {
      final words = anyWords!.split(' ');
      parts.add('(${words.join(' OR ')})');
    }
    
    if (excludeWords?.isNotEmpty == true) {
      final words = excludeWords!.split(' ');
      for (final word in words) {
        parts.add('-$word');
      }
    }
    
    if (from?.isNotEmpty == true) parts.add('from:$from');
    if (to?.isNotEmpty == true) parts.add('to:$to');
    if (subject?.isNotEmpty == true) parts.add('subject:$subject');
    if (hasAttachments == true) parts.add('has:attachment');
    if (isRead == true) parts.add('is:read');
    if (isRead == false) parts.add('is:unread');
    if (isFlagged == true) parts.add('is:flagged');
    if (isImportant == true) parts.add('is:important');
    
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
