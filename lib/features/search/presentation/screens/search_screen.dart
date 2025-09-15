import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/navigation/presentation/widgets/app_drawer.dart';
import 'package:mailcraftsystem/shared/widgets/email_list_item.dart';
import 'package:mailcraftsystem/shared/widgets/loading_widget.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

/// Enterprise-grade email search screen with advanced filtering
class SearchScreen extends ConsumerStatefulWidget {
  /// Creates a search screen
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  
  bool _isSearching = false;
  bool _showFilters = false;
  List<Message> _searchResults = [];
  String _currentQuery = '';
  
  // Filter options
  SearchFilter _currentFilter = SearchFilter();
  final List<String> _recentSearches = [
    'project update',
    'meeting notes',
    'invoice',
    'quarterly report',
  ];

  @override
  void initState() {
    super.initState();
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: _buildSearchAppBar(context),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Search filters
          if (_showFilters) _buildFiltersSection(context),
          
          // Search content
          Expanded(
            child: _buildSearchContent(context),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildSearchAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          decoration: InputDecoration(
            hintText: 'Search emails, contacts, attachments...',
            prefixIcon: const Icon(Icons.search_outlined),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearSearch,
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          onChanged: _onSearchChanged,
          onSubmitted: _performSearch,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            _showFilters ? Icons.filter_list : Icons.filter_list_outlined,
            color: _showFilters ? colorScheme.primary : null,
          ),
          onPressed: _toggleFilters,
          tooltip: 'Search filters',
        ),
        PopupMenuButton<String>(
          onSelected: _handleMenuAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'advanced_search',
              child: ListTile(
                leading: Icon(Icons.manage_search_outlined),
                title: Text('Advanced search'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'search_history',
              child: ListTile(
                leading: Icon(Icons.history_outlined),
                title: Text('Search history'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'clear_history',
              child: ListTile(
                leading: Icon(Icons.clear_all_outlined),
                title: Text('Clear history'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFiltersSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Filters',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          
          // Filter chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilterChip(
                label: const Text('Unread'),
                selected: _currentFilter.unreadOnly,
                onSelected: (selected) => setState(() {
                  _currentFilter = _currentFilter.copyWith(unreadOnly: selected);
                  _applyFilters();
                }),
              ),
              FilterChip(
                label: const Text('Has Attachments'),
                selected: _currentFilter.hasAttachments,
                onSelected: (selected) => setState(() {
                  _currentFilter = _currentFilter.copyWith(hasAttachments: selected);
                  _applyFilters();
                }),
              ),
              FilterChip(
                label: const Text('Flagged'),
                selected: _currentFilter.flaggedOnly,
                onSelected: (selected) => setState(() {
                  _currentFilter = _currentFilter.copyWith(flaggedOnly: selected);
                  _applyFilters();
                }),
              ),
              FilterChip(
                label: const Text('High Priority'),
                selected: _currentFilter.highPriorityOnly,
                onSelected: (selected) => setState(() {
                  _currentFilter = _currentFilter.copyWith(highPriorityOnly: selected);
                  _applyFilters();
                }),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Date range and folder filters
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _currentFilter.dateRange,
                  decoration: const InputDecoration(
                    labelText: 'Date Range',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: const [
                    DropdownMenuItem(value: 'any', child: Text('Any time')),
                    DropdownMenuItem(value: 'today', child: Text('Today')),
                    DropdownMenuItem(value: 'week', child: Text('This week')),
                    DropdownMenuItem(value: 'month', child: Text('This month')),
                    DropdownMenuItem(value: 'year', child: Text('This year')),
                  ],
                  onChanged: (value) => setState(() {
                    _currentFilter = _currentFilter.copyWith(dateRange: value);
                    _applyFilters();
                  }),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _currentFilter.folder,
                  decoration: const InputDecoration(
                    labelText: 'Folder',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All folders')),
                    DropdownMenuItem(value: 'inbox', child: Text('Inbox')),
                    DropdownMenuItem(value: 'sent', child: Text('Sent')),
                    DropdownMenuItem(value: 'drafts', child: Text('Drafts')),
                    DropdownMenuItem(value: 'archive', child: Text('Archive')),
                  ],
                  onChanged: (value) => setState(() {
                    _currentFilter = _currentFilter.copyWith(folder: value);
                    _applyFilters();
                  }),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Clear filters button
          if (_currentFilter.hasActiveFilters)
            AppButton(
              text: 'Clear Filters',
              icon: Icons.clear_outlined,
              style: AppButtonStyle.text,
              onPressed: _clearFilters,
            ),
        ],
      ),
    );
  }

  Widget _buildSearchContent(BuildContext context) {
    if (_currentQuery.isEmpty) {
      return _buildSearchSuggestions(context);
    }

    if (_isSearching) {
      return const LoadingWidget(
        message: 'Searching emails...',
        size: LoadingSize.large,
      );
    }

    if (_searchResults.isEmpty) {
      return _buildNoResults(context);
    }

    return _buildSearchResults(context);
  }

  Widget _buildSearchSuggestions(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent searches
          if (_recentSearches.isNotEmpty) ...[
            Text(
              'Recent Searches',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              child: Column(
                children: _recentSearches.map((search) => ListTile(
                  leading: const Icon(Icons.history_outlined),
                  title: Text(search),
                  trailing: IconButton(
                    icon: const Icon(Icons.north_west_outlined),
                    onPressed: () => _useRecentSearch(search),
                  ),
                  onTap: () => _useRecentSearch(search),
                )).toList(),
              ),
            ),
            const SizedBox(height: 24),
          ],
          
          // Search suggestions
          Text(
            'Search Suggestions',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              children: [
                _buildSuggestionTile(
                  context,
                  'Search by sender',
                  'from:john@example.com',
                  Icons.person_outline,
                ),
                _buildSuggestionTile(
                  context,
                  'Search by subject',
                  'subject:meeting',
                  Icons.subject_outlined,
                ),
                _buildSuggestionTile(
                  context,
                  'Search with attachments',
                  'has:attachment',
                  Icons.attach_file_outlined,
                ),
                _buildSuggestionTile(
                  context,
                  'Search unread emails',
                  'is:unread',
                  Icons.mark_email_unread_outlined,
                ),
                _buildSuggestionTile(
                  context,
                  'Search by date',
                  'after:2024-01-01',
                  Icons.date_range_outlined,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Quick actions
          Text(
            'Quick Actions',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
            children: [
              _buildQuickActionCard(
                context,
                'Unread Emails',
                Icons.mark_email_unread_outlined,
                () => _quickSearch('is:unread'),
              ),
              _buildQuickActionCard(
                context,
                'Today\'s Emails',
                Icons.today_outlined,
                () => _quickSearch('newer_than:1d'),
              ),
              _buildQuickActionCard(
                context,
                'With Attachments',
                Icons.attach_file_outlined,
                () => _quickSearch('has:attachment'),
              ),
              _buildQuickActionCard(
                context,
                'Flagged Emails',
                Icons.flag_outlined,
                () => _quickSearch('is:starred'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionTile(BuildContext context, String title, String query, IconData icon) {
    final theme = Theme.of(context);
    
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        query,
        style: theme.textTheme.bodySmall?.copyWith(
          fontFamily: 'monospace',
        ),
      ),
      trailing: const Icon(Icons.north_west_outlined),
      onTap: () => _useSearchSuggestion(query),
    );
  }

  Widget _buildQuickActionCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                icon,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Results header
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                '${_searchResults.length} results for "$_currentQuery"',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              DropdownButton<String>(
                value: 'relevance',
                items: const [
                  DropdownMenuItem(value: 'relevance', child: Text('Relevance')),
                  DropdownMenuItem(value: 'date_desc', child: Text('Newest first')),
                  DropdownMenuItem(value: 'date_asc', child: Text('Oldest first')),
                  DropdownMenuItem(value: 'sender', child: Text('Sender')),
                ],
                onChanged: (value) => _sortResults(value!),
              ),
            ],
          ),
        ),
        
        // Results list
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final message = _searchResults[index];
              return EmailListItem(
                message: message,
                onTap: () => context.go('/message-detail', extra: message),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNoResults(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_outlined,
            size: 64,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Try different keywords or adjust your filters',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Clear Search',
            icon: Icons.clear_outlined,
            onPressed: _clearSearch,
          ),
        ],
      ),
    );
  }

  // Event handlers
  void _onSearchChanged(String query) {
    setState(() => _currentQuery = query);
    
    if (query.isNotEmpty) {
      // Debounce search
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_currentQuery == query && query.isNotEmpty) {
          _performSearch(query);
        }
      });
    }
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isSearching = true;
      _currentQuery = query;
    });

    try {
      // Simulate search
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock search results
      final results = _generateMockResults(query);
      
      setState(() {
        _searchResults = results;
        _isSearching = false;
      });
      
      // Add to recent searches
      if (!_recentSearches.contains(query)) {
        _recentSearches.insert(0, query);
        if (_recentSearches.length > 10) {
          _recentSearches.removeLast();
        }
      }
    } catch (e) {
      setState(() => _isSearching = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Search failed: $e')),
        );
      }
    }
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _currentQuery = '';
      _searchResults.clear();
    });
  }

  void _toggleFilters() {
    setState(() => _showFilters = !_showFilters);
  }

  void _applyFilters() {
    if (_currentQuery.isNotEmpty) {
      _performSearch(_currentQuery);
    }
  }

  void _clearFilters() {
    setState(() {
      _currentFilter = SearchFilter();
    });
    _applyFilters();
  }

  void _useRecentSearch(String search) {
    _searchController.text = search;
    _performSearch(search);
  }

  void _useSearchSuggestion(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  void _quickSearch(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  void _sortResults(String sortBy) {
    setState(() {
      switch (sortBy) {
        case 'date_desc':
          _searchResults.sort((a, b) => (b.receivedDate ?? DateTime.now())
              .compareTo(a.receivedDate ?? DateTime.now()));
          break;
        case 'date_asc':
          _searchResults.sort((a, b) => (a.receivedDate ?? DateTime.now())
              .compareTo(b.receivedDate ?? DateTime.now()));
          break;
        case 'sender':
          _searchResults.sort((a, b) => (a.from?.name ?? '')
              .compareTo(b.from?.name ?? ''));
          break;
        case 'relevance':
        default:
          // Keep current order (relevance)
          break;
      }
    });
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'advanced_search':
        _showAdvancedSearchDialog();
        break;
      case 'search_history':
        _showSearchHistoryDialog();
        break;
      case 'clear_history':
        _clearSearchHistory();
        break;
    }
  }

  void _showAdvancedSearchDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Advanced search not implemented')),
    );
  }

  void _showSearchHistoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search History'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _recentSearches.length,
            itemBuilder: (context, index) {
              final search = _recentSearches[index];
              return ListTile(
                title: Text(search),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    setState(() => _recentSearches.removeAt(index));
                    Navigator.of(context).pop();
                  },
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _useRecentSearch(search);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _clearSearchHistory() {
    setState(() => _recentSearches.clear());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Search history cleared')),
    );
  }

  List<Message> _generateMockResults(String query) {
    // Mock search results generation
    return List.generate(5, (index) => Message(
      id: 'search_result_$index',
      subject: 'Search result $index for "$query"',
      from: EmailAddress(
        name: 'Sender $index',
        email: 'sender$index@example.com',
      ),
      to: [EmailAddress(email: 'user@example.com')],
      receivedDate: DateTime.now().subtract(Duration(days: index)),
      isRead: index % 2 == 0,
      hasAttachments: index % 3 == 0,
      isFlagged: index % 4 == 0,
      preview: 'This is a preview of search result $index containing "$query"...',
    ));
  }
}

/// Search filter configuration
class SearchFilter {
  const SearchFilter({
    this.unreadOnly = false,
    this.hasAttachments = false,
    this.flaggedOnly = false,
    this.highPriorityOnly = false,
    this.dateRange = 'any',
    this.folder = 'all',
  });

  final bool unreadOnly;
  final bool hasAttachments;
  final bool flaggedOnly;
  final bool highPriorityOnly;
  final String dateRange;
  final String folder;

  bool get hasActiveFilters =>
      unreadOnly ||
      hasAttachments ||
      flaggedOnly ||
      highPriorityOnly ||
      dateRange != 'any' ||
      folder != 'all';

  SearchFilter copyWith({
    bool? unreadOnly,
    bool? hasAttachments,
    bool? flaggedOnly,
    bool? highPriorityOnly,
    String? dateRange,
    String? folder,
  }) {
    return SearchFilter(
      unreadOnly: unreadOnly ?? this.unreadOnly,
      hasAttachments: hasAttachments ?? this.hasAttachments,
      flaggedOnly: flaggedOnly ?? this.flaggedOnly,
      highPriorityOnly: highPriorityOnly ?? this.highPriorityOnly,
      dateRange: dateRange ?? this.dateRange,
      folder: folder ?? this.folder,
    );
  }
}
