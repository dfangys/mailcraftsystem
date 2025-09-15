import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/search/domain/models/search_index.dart';
import 'package:mailcraftsystem/features/search/domain/models/search_query.dart';

/// Search repository interface
abstract class SearchRepository {
  /// Perform search with query
  Future<Either<Failure, SearchResult>> search(SearchQuery query);
  
  /// Get search suggestions based on input
  Future<Either<Failure, List<SearchSuggestion>>> getSuggestions(
    String input,
    String accountId,
  );
  
  /// Save search query for later use
  Future<Either<Failure, SearchQuery>> saveSearch(SearchQuery query);
  
  /// Get saved searches for an account
  Future<Either<Failure, List<SearchQuery>>> getSavedSearches(String accountId);
  
  /// Delete saved search
  Future<Either<Failure, void>> deleteSavedSearch(String queryId);
  
  /// Get search history for an account
  Future<Either<Failure, List<SearchHistory>>> getSearchHistory(
    String accountId, {
    int? limit,
  });
  
  /// Clear search history for an account
  Future<Either<Failure, void>> clearSearchHistory(String accountId);
  
  /// Add search to history
  Future<Either<Failure, void>> addToHistory(SearchHistory history);
  
  /// Get popular search terms
  Future<Either<Failure, List<String>>> getPopularSearchTerms(String accountId);
  
  /// Index messages for search (background operation)
  Future<Either<Failure, void>> indexMessages(
    String accountId,
    String mailboxPath,
  );
  
  /// Get search index status
  Future<Either<Failure, SearchIndexStatus>> getIndexStatus(String accountId);
  
  /// Rebuild search index
  Future<Either<Failure, void>> rebuildIndex(String accountId);
  
  /// Search within specific mailboxes
  Future<Either<Failure, SearchResult>> searchInMailboxes(
    SearchQuery query,
    List<String> mailboxPaths,
  );
  
  /// Advanced search with complex criteria
  Future<Either<Failure, SearchResult>> advancedSearch(
    String accountId,
    AdvancedSearchCriteria criteria,
  );
  
  /// Get search analytics
  Future<Either<Failure, SearchAnalytics>> getSearchAnalytics(String accountId);
}
