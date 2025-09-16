import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/providers/mailbox_providers.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mailcraftsystem/features/navigation/presentation/widgets/app_drawer.dart';
import 'package:mailcraftsystem/shared/widgets/email_list_item.dart';
import 'package:mailcraftsystem/shared/widgets/loading_widget.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/controllers/mailbox_controller.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart' as model;


/// Enterprise-grade mailbox screen with comprehensive email management
class MailboxScreen extends ConsumerStatefulWidget {
  /// Creates a mailbox screen
  const MailboxScreen({super.key, this.initialFolder});

  /// Optional initial folder to show (e.g., INBOX, sent, drafts, archive)
  final String? initialFolder;

  @override
  ConsumerState<MailboxScreen> createState() => _MailboxScreenState();
}

class _MailboxScreenState extends ConsumerState<MailboxScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedMessages = <String>{};
  String _currentFolder = 'INBOX';
  bool _isCompactView = false;

  String _normalizeFolder(String? folder) {
    if (folder == null || folder.isEmpty) return 'INBOX';
    final f = folder.toLowerCase();
    switch (f) {
      case 'inbox':
        return 'INBOX';
      case 'sent':
        return 'Sent';
      case 'draft':
      case 'drafts':
        return 'Drafts';
      case 'archive':
      case 'archived':
        return 'Archive';
      default:
        return folder;
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize folder from route if provided
    _currentFolder = _normalizeFolder(widget.initialFolder);
    _loadInitialData();
  }

  void _loadInitialData() {
    Future.microtask(() {
      final authState = ref.read(authControllerProvider);
      final accountId = authState.userEmail ?? 'default';
      ref.read(mailboxControllerProvider.notifier).getMailboxes(accountId);
      ref
          .read(mailboxControllerProvider.notifier)
          .getMessages(accountId, _currentFolder);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(mailboxControllerProvider);

    return Scaffold(
      appBar: _buildAppBar(context, state),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(
          children: [
            // Folder selector
            _buildFolderSelector(context, state),

            // Mailboxes (horizontal chips)
            _buildMailboxChips(context, state),

            // Email list
            Expanded(
              child: _buildEmailList(context, state),
            ),

            // Selection actions bar
            if (_isSelectionMode) _buildSelectionActionsBar(context),
          ],
        ),
      ),
      floatingActionButton: _isSelectionMode
          ? null
          : FloatingActionButton(
              onPressed: () => context.push('/compose'),
              child: const Icon(Icons.edit_outlined),
              tooltip: 'Compose email',
            ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, MailboxState state) {
    final theme = Theme.of(context);

    if (_isSelectionMode) {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _exitSelectionMode,
        ),
        title: Text('${_selectedMessages.length} selected'),
        actions: [
          IconButton(
            icon: const Icon(Icons.select_all),
            onPressed: _selectAll,
            tooltip: 'Select all',
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _deleteSelected,
            tooltip: 'Delete selected',
          ),
          PopupMenuButton<String>(
            onSelected: _handleBulkAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'mark_read',
                child: ListTile(
                  leading: Icon(Icons.mark_email_read_outlined),
                  title: Text('Mark as read'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'mark_unread',
                child: ListTile(
                  leading: Icon(Icons.mark_email_unread_outlined),
                  title: Text('Mark as unread'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'archive',
                child: ListTile(
                  leading: Icon(Icons.archive_outlined),
                  title: Text('Archive'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'move',
                child: ListTile(
                  leading: Icon(Icons.folder_outlined),
                  title: Text('Move to folder'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return AppBar(
      title: Text(
        _getFolderDisplayName(_currentFolder),
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(_isCompactView ? Icons.view_agenda : Icons.view_list),
          onPressed: _toggleViewMode,
          tooltip: _isCompactView ? 'Detailed view' : 'Compact view',
        ),
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () => context.push('/search'),
          tooltip: 'Search emails',
        ),
        PopupMenuButton<String>(
          onSelected: _handleMenuAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'refresh',
              child: ListTile(
                leading: Icon(Icons.refresh_outlined),
                title: Text('Refresh'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'select_all',
              child: ListTile(
                leading: Icon(Icons.checklist_outlined),
                title: Text('Select messages'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'settings',
              child: ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFolderSelector(BuildContext context, MailboxState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getFolderIcon(_currentFolder),
            color: colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getFolderDisplayName(_currentFolder),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${state.messages.length} messages',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          // Unread count badge
          if (_getUnreadCount(state.messages) > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_getUnreadCount(state.messages)}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmailList(BuildContext context, MailboxState state) {
    if (state.isLoading) {
      return const LoadingWidget(
        message: 'Loading emails...',
        size: LoadingSize.large,
      );
    }

    if (state.failure != null) {
      return _buildErrorState(context, state.failure!.message);
    }

    if (state.messages.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      itemCount: state.messages.length,
      itemBuilder: (context, index) {
        final message = state.messages[index];
        final isSelected = _selectedMessages.contains(message.id);

        if (_isCompactView) {
          return CompactEmailListItem(
            message: message,
            isSelected: isSelected,
            onTap: () => _handleMessageTap(message),
          );
        }

        return EmailListItem(
          message: message,
          isSelected: isSelected,
          showCheckbox: _isSelectionMode,
          onTap: () => _handleMessageTap(message),
          onLongPress: () => _handleMessageLongPress(message),
          onSelectionChanged: (selected) =>
              _handleMessageSelection(message.id, selected ?? false),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load emails',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Retry',
            icon: Icons.refresh_outlined,
            onPressed: _loadInitialData,
          ),
        ],
      ),
    );
  }

  Widget _buildMailboxChips(BuildContext context, MailboxState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (state.mailboxes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: colorScheme.outline.withOpacity(0.1)),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final box in state.mailboxes)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(box.displayName),
                      if (box.unreadCount > 0) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            box.unreadCount > 999
                                ? '999+'
                                : box.unreadCount.toString(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  selected: box.path == _currentFolder,
                  onSelected: (_) => _onMailboxSelected(box),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No emails in ${_getFolderDisplayName(_currentFolder)}',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Your ${_getFolderDisplayName(_currentFolder).toLowerCase()} is empty',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Compose Email',
            icon: Icons.edit_outlined,
            onPressed: () => context.go('/compose'),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionActionsBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              text: 'Delete',
              icon: Icons.delete_outline,
              style: AppButtonStyle.secondary,
              onPressed: _deleteSelected,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AppButton(
              text: 'Archive',
              icon: Icons.archive_outlined,
              style: AppButtonStyle.secondary,
              onPressed: () => _handleBulkAction('archive'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AppButton(
              text: 'Move',
              icon: Icons.folder_outlined,
              style: AppButtonStyle.secondary,
              onPressed: () => _handleBulkAction('move'),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods
  String _getFolderDisplayName(String folder) {
    switch (folder.toUpperCase()) {
      case 'INBOX':
        return 'Inbox';
      case 'SENT':
        return 'Sent';
      case 'DRAFTS':
        return 'Drafts';
      case 'TRASH':
        return 'Trash';
      case 'SPAM':
        return 'Spam';
      default:
        return folder;
    }
  }

  IconData _getFolderIcon(String folder) {
    switch (folder.toUpperCase()) {
      case 'INBOX':
        return Icons.inbox_outlined;
      case 'SENT':
        return Icons.send_outlined;
      case 'DRAFTS':
        return Icons.drafts_outlined;
      case 'TRASH':
        return Icons.delete_outline;
      case 'SPAM':
        return Icons.report_outlined;
      default:
        return Icons.folder_outlined;
    }
  }

  int _getUnreadCount(List<Message> messages) {
    return messages.where((message) => !message.isRead).length;
  }

  // Event handlers
  void _onMailboxSelected(model.Mailbox box) {
    setState(() {
      _currentFolder = box.path;
    });
    final authState = ref.read(authControllerProvider);
    final accountId = authState.userEmail ?? 'default';
    ref.read(mailboxControllerProvider.notifier).getMessages(accountId, box.path);
  }

  void _handleMessageTap(Message message) {
    if (_isSelectionMode) {
      _handleMessageSelection(
          message.id, !_selectedMessages.contains(message.id));
    } else {
      context.go('/message-detail', extra: message);
    }
  }

  void _handleMessageLongPress(Message message) {
    if (!_isSelectionMode) {
      setState(() {
        _isSelectionMode = true;
        _selectedMessages.add(message.id);
      });
    }
  }

  void _handleMessageSelection(String messageId, bool selected) {
    setState(() {
      if (selected) {
        _selectedMessages.add(messageId);
      } else {
        _selectedMessages.remove(messageId);
      }

      if (_selectedMessages.isEmpty) {
        _isSelectionMode = false;
      }
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelectionMode = false;
      _selectedMessages.clear();
    });
  }

  void _selectAll() {
    final state = ref.read(mailboxControllerProvider);
    setState(() {
      _selectedMessages.addAll(state.messages.map((m) => m.id).toList());
    });
  }

  void _toggleViewMode() {
    setState(() {
      _isCompactView = !_isCompactView;
    });
  }

  Future<void> _handleRefresh() async {
    await ref
        .read(mailboxControllerProvider.notifier)
        .getMessages("dummy_account", _currentFolder);
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'refresh':
        _handleRefresh();
        break;
      case 'select_all':
        setState(() {
          _isSelectionMode = true;
        });
        _selectAll();
        break;
      case 'settings':
        context.go('/settings');
        break;
    }
  }

  void _handleBulkAction(String action) {
    // Handle bulk actions
    switch (action) {
      case 'mark_read':
        // Mark selected messages as read
        break;
      case 'mark_unread':
        // Mark selected messages as unread
        break;
      case 'archive':
        // Archive selected messages
        break;
      case 'move':
        // Show folder selection dialog
        _showMoveDialog();
        break;
    }
    _exitSelectionMode();
  }

  void _deleteSelected() {
    // Show confirmation dialog and delete selected messages
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Messages'),
        content: Text('Delete ${_selectedMessages.length} selected messages?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Delete messages
              _exitSelectionMode();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showMoveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Move to Folder'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: const Text('Archive'),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.folder_outlined),
              title: const Text('Custom Folder'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
