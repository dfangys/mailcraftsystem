import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/navigation/presentation/widgets/app_drawer.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';
import 'package:mailcraftsystem/shared/widgets/email_list_item.dart';
import 'package:mailcraftsystem/shared/widgets/loading_widget.dart';

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
  SearchFilter _currentFilter = const SearchFilter();
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
          color: colorScheme.surfaceContainerHighest.withAlpha(128),
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        color: colorScheme.surfaceContainerHighest.withAlpha(77),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withAlpha(51),
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
                  _currentFilter =
                      _currentFilter.copyWith(unreadOnly: selected);
                  _applyFilters();
                }),
              ),
              FilterChip(
                label: const Text('Has Attachments'),
                selected: _currentFilter.hasAttachments,
                onSelected: (selected) => setState(() {
                  _currentFilter =
                      _currentFilter.copyWith(hasAttachments: selected);
                  _applyFilters();
                }),
              ),
              FilterChip(
                label: const Text('Flagged'),
                selected: _currentFilter.flaggedOnly,
                onSelected: (selected) => setState(() {
                  _currentFilter =
                      _currentFilter.copyWith(flaggedOnly: selected);
                  _applyFilters();
                }),
              ),
              FilterChip(
                label: const Text('High Priority'),
                selected: _currentFilter.highPriorityOnly,
                onSelected: (selected) => setState(() {
                  _currentFilter =
                      _currentFilter.copyWith(highPriorityOnly: selected);
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
                  initialValue: _currentFilter.dateRange,
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
                  initialValue: _currentFilter.folder,
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
                children: _recentSearches
                    .map((search) => ListTile(
                          leading: const Icon(Icons.history_outlined),
                          title: Text(search),
                          trailing: IconButton(
                            icon: const Icon(Icons.north_west_outlined),
                            onPressed: () => _useRecentSearch(search),
                          ),
                          onTap: () => _useRecentSearch(search),
                        ))
                    .toList(),
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

  Widget _buildSuggestionTile(
      BuildContext context, String title, String query, IconData icon) {
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

  Widget _buildQuickActionCard(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
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
                  DropdownMenuItem(
                    value: 'relevance',
                    child: Text('Relevance'),
                  ),
                  DropdownMenuItem(
                    value: 'date_desc',
                    child: Text('Newest first'),
                  ),
                  DropdownMenuItem(
                    value: 'date_asc',
                    child: Text('Oldest first'),
                  ),
                ],
                onChanged: (value) {
                  // Handle sort change
                },
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
                onTap: () => context.go('/messages/${message.id}'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNoResults(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off_outlined,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'No results found for "$_currentQuery"',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different search term or adjust your filters.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Clear Search',
            onPressed: _clearSearch,
            style: AppButtonStyle.secondary,
          ),
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    setState(() {
      _currentQuery = query;
    });
  }

  void _performSearch(String query) {
    if (query.isEmpty) return;

    setState(() {
      _isSearching = true;
      _currentQuery = query;
    });

    // Simulate network request
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _searchResults = _generateDummyResults(query);
        _isSearching = false;
      });
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _currentQuery = '';
      _searchResults = [];
    });
  }

  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });
  }

  void _applyFilters() {
    // In a real app, you would re-run the search with the new filters
    _performSearch(_currentQuery);
  }

  void _clearFilters() {
    setState(() {
      _currentFilter = const SearchFilter();
    });
    _applyFilters();
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'advanced_search':
        // Navigate to advanced search screen
        break;
      case 'search_history':
        // Show search history
        break;
      case 'clear_history':
        // Clear search history
        break;
    }
  }

  void _useRecentSearch(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  void _useSearchSuggestion(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  void _quickSearch(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  List<Message> _generateDummyResults(String query) {
    // This is a dummy implementation. In a real app, you would fetch results
    // from your backend or local database.
    return List.generate(15, (index) {
      return Message(
        id: 'msg${index + 1}',
        uid: index + 1,
        mailboxPath: 'INBOX',
        from: MessageAddress(email: 'sender${index + 1}@example.com'),
        to: [const MessageAddress(email: 'user@example.com')],
        subject: 'Search result ${index + 1} for "$query"',
        preview:
            'This is a dummy email snippet for search result ${index + 1}.',
        date: DateTime.now().subtract(Duration(hours: index)),
        isRead: index % 3 == 0,
        isFlagged: index % 5 == 0,
      );
    });
  }
}

/// Search filter data class
class SearchFilter {
  /// Creates a search filter
  const SearchFilter({
    this.unreadOnly = false,
    this.hasAttachments = false,
    this.flaggedOnly = false,
    this.highPriorityOnly = false,
    this.dateRange = 'any',
    this.folder = 'all',
  });

  /// Whether to show unread emails only
  final bool unreadOnly;

  /// Whether to show emails with attachments only
  final bool hasAttachments;

  /// Whether to show flagged emails only
  final bool flaggedOnly;

  /// Whether to show high priority emails only
  final bool highPriorityOnly;

  /// The date range to filter by
  final String? dateRange;

  /// The folder to filter by
  final String? folder;

  /// Whether any filters are active
  bool get hasActiveFilters =>
      unreadOnly ||
      hasAttachments ||
      flaggedOnly ||
      highPriorityOnly ||
      dateRange != 'any' ||
      folder != 'all';

  /// Creates a copy of this search filter with the given fields replaced
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

