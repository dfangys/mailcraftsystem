import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/search/domain/models/search_index.dart';
import 'package:mailcraftsystem/features/search/domain/models/search_query.dart';

/// Search repository interface
abstract class SearchRepository {
  /// Perform search with query
  Future<({Failure? left, [^}]* right})> search(SearchQuery query);
  
  /// Get search suggestions based on input
  Future<({Failure? left, [^}]* right})>> getSuggestions(
    String input,
    String accountId,
  );
  
  /// Save search query for later use
  Future<({Failure? left, [^}]* right})> saveSearch(SearchQuery query);
  
  /// Get saved searches for an account
  Future<({Failure? left, [^}]* right})>> getSavedSearches(String accountId);
  
  /// Delete saved search
  Future<({Failure? left, [^}]* right})> deleteSavedSearch(String queryId);
  
  /// Get search history for an account
  Future<({Failure? left, [^}]* right})>> getSearchHistory(
    String accountId, {
    int? limit,
  });
  
  /// Clear search history for an account
  Future<({Failure? left, [^}]* right})> clearSearchHistory(String accountId);
  
  /// Add search to history
  Future<({Failure? left, [^}]* right})> addToHistory(SearchHistory history);
  
  /// Get popular search terms
  Future<({Failure? left, [^}]* right})>> getPopularSearchTerms(String accountId);
  
  /// Index messages for search (background operation)
  Future<({Failure? left, [^}]* right})> indexMessages(
    String accountId,
    String mailboxPath,
  );
  
  /// Get search index status
  Future<({Failure? left, [^}]* right})> getIndexStatus(String accountId);
  
  /// Rebuild search index
  Future<({Failure? left, [^}]* right})> rebuildIndex(String accountId);
  
  /// Search within specific mailboxes
  Future<({Failure? left, [^}]* right})> searchInMailboxes(
    SearchQuery query,
    List<String> mailboxPaths,
  );
  
  /// Advanced search with complex criteria
  Future<({Failure? left, [^}]* right})> advancedSearch(
    String accountId,
    AdvancedSearchCriteria criteria,
  );
  
  /// Get search analytics
  Future<({Failure? left, [^}]* right})> getSearchAnalytics(String accountId);
}
