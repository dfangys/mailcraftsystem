import 'package:flutter/material.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

/// A reusable email list item widget for displaying messages
class EmailListItem extends StatelessWidget {
  /// Creates an email list item
  const EmailListItem({
    super.key,
    required this.message,
    this.onTap,
    this.onLongPress,
    this.isSelected = false,
    this.showCheckbox = false,
    this.onSelectionChanged,
  });

  /// The message to display
  final Message message;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  /// Callback when item is long pressed
  final VoidCallback? onLongPress;

  /// Whether the item is selected
  final bool isSelected;

  /// Whether to show selection checkbox
  final bool showCheckbox;

  /// Callback when selection state changes
  final ValueChanged<bool>? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: isSelected ? 4 : 1,
      color: isSelected ? colorScheme.primaryContainer.withOpacity(0.3) : null,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selection checkbox or avatar
              if (showCheckbox)
                Checkbox(
                  value: isSelected,
                  onChanged: onSelectionChanged,
                )
              else
                _buildAvatar(context),
              
              const SizedBox(width: 12),
              
              // Message content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row with sender and time
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            message.from?.name ?? message.from?.email ?? 'Unknown',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatTime(message.receivedDate),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Subject
                    Text(
                      message.subject ?? '(No Subject)',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: message.isRead ? FontWeight.normal : FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Preview text
                    if (message.preview != null)
                      Text(
                        message.preview!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    
                    const SizedBox(height: 8),
                    
                    // Status indicators
                    Row(
                      children: [
                        // Unread indicator
                        if (!message.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        
                        if (!message.isRead) const SizedBox(width: 8),
                        
                        // Attachment indicator
                        if (message.hasAttachments)
                          Icon(
                            Icons.attach_file_outlined,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        
                        if (message.hasAttachments) const SizedBox(width: 8),
                        
                        // Priority indicator
                        if (message.priority == MessagePriority.high)
                          Icon(
                            Icons.priority_high_outlined,
                            size: 16,
                            color: Colors.red,
                          ),
                        
                        if (message.priority == MessagePriority.high) const SizedBox(width: 8),
                        
                        // Flagged indicator
                        if (message.isFlagged)
                          Icon(
                            Icons.flag_outlined,
                            size: 16,
                            color: Colors.orange,
                          ),
                        
                        const Spacer(),
                        
                        // Actions menu
                        PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_vert_outlined,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          onSelected: (value) => _handleAction(context, value),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'reply',
                              child: Row(
                                children: [
                                  const Icon(Icons.reply_outlined, size: 16),
                                  const SizedBox(width: 8),
                                  const Text('Reply'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'forward',
                              child: Row(
                                children: [
                                  const Icon(Icons.forward_outlined, size: 16),
                                  const SizedBox(width: 8),
                                  const Text('Forward'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  const Icon(Icons.delete_outline, size: 16),
                                  const SizedBox(width: 8),
                                  const Text('Delete'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: message.isRead ? 'mark_unread' : 'mark_read',
                              child: Row(
                                children: [
                                  Icon(
                                    message.isRead 
                                        ? Icons.mark_email_unread_outlined 
                                        : Icons.mark_email_read_outlined,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(message.isRead ? 'Mark Unread' : 'Mark Read'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final senderName = message.from?.name ?? message.from?.email ?? 'U';
    final initial = senderName.isNotEmpty ? senderName[0].toUpperCase() : 'U';

    return CircleAvatar(
      radius: 20,
      backgroundColor: colorScheme.primaryContainer,
      child: Text(
        initial,
        style: theme.textTheme.titleSmall?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else {
        return '${dateTime.day}/${dateTime.month}';
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _handleAction(BuildContext context, String action) {
    // Handle menu actions
    switch (action) {
      case 'reply':
        // Handle reply
        break;
      case 'forward':
        // Handle forward
        break;
      case 'delete':
        // Handle delete
        break;
      case 'mark_read':
      case 'mark_unread':
        // Handle read/unread toggle
        break;
    }
  }
}

/// Compact version of email list item for dense layouts
class CompactEmailListItem extends StatelessWidget {
  /// Creates a compact email list item
  const CompactEmailListItem({
    super.key,
    required this.message,
    this.onTap,
    this.isSelected = false,
  });

  /// The message to display
  final Message message;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  /// Whether the item is selected
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      onTap: onTap,
      selected: isSelected,
      selectedTileColor: colorScheme.primaryContainer.withOpacity(0.3),
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: colorScheme.primaryContainer,
        child: Text(
          (message.from?.name ?? message.from?.email ?? 'U')[0].toUpperCase(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              message.from?.name ?? message.from?.email ?? 'Unknown',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            _formatTime(message.receivedDate),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      subtitle: Text(
        message.subject ?? '(No Subject)',
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!message.isRead)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          if (message.hasAttachments) ...[
            const SizedBox(width: 4),
            Icon(
              Icons.attach_file_outlined,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}
