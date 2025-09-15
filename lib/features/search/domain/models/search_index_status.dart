/// Status of search index
enum SearchIndexStatus {
  /// Index is being built
  building,
  
  /// Index is ready for use
  ready,
  
  /// Index has an error
  error,
  
  /// Index is outdated and needs rebuilding
  outdated,
}
