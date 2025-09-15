/// Search index model for email search functionality
class SearchIndex {
  /// Creates a search index
  const SearchIndex({
    required this.id,
    required this.messageId,
    required this.content,
    required this.keywords,
    this.lastUpdated,
  });

  /// Index ID
  final String id;

  /// Associated message ID
  final String messageId;

  /// Indexed content
  final String content;

  /// Search keywords
  final List<String> keywords;

  /// Last updated timestamp
  final DateTime? lastUpdated;
}
