import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/providers/mailbox_providers.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message_content.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';
import 'package:mailcraftsystem/shared/widgets/loading_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Enterprise-grade message detail screen with comprehensive email viewing
class MessageDetailScreen extends ConsumerStatefulWidget {
  /// Creates a message detail screen
  const MessageDetailScreen({
    required this.message,
    super.key,
  });

  /// The message to display
  final Message message;

  @override
  ConsumerState<MessageDetailScreen> createState() =>
      _MessageDetailScreenState();
}

class _MessageDetailScreenState extends ConsumerState<MessageDetailScreen> {
  bool _showFullHeaders = false;
  bool _isLoading = false;
  String? _messageBody;
  String? _error;
  MessageContent? _content;
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    _loadMessageBody();
  }

  Future<void> _initWebView(String html) async {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent);
    final dataUri = Uri.dataFromString(
      html,
      mimeType: 'text/html',
      encoding: utf8,
    );
    await controller.loadRequest(dataUri);
    setState(() {
      _webViewController = controller;
    });
  }

  Future<void> _loadMessageBody() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final authState = ref.read(authControllerProvider);
      final accountId = authState.userEmail ?? 'default';
      final mailboxPath = widget.message.mailboxPath;
      final uid = widget.message.uid;

      final repo = ref.read(messageRepositoryProvider);
      final result = await repo.getMessageContent(accountId, mailboxPath, uid);

      result.fold((failure) {
        setState(() {
          _error = failure.message;
          _messageBody = widget.message.preview ?? '';
          _isLoading = false;
        });
      }, (content) async {
        String bodyText = content.textPlain;
        setState(() {
          _content = content;
          _messageBody = bodyText.isNotEmpty
              ? bodyText
              : (widget.message.preview ?? '');
        });
        if ((content.textHtml ?? '').trim().isNotEmpty) {
          await _initWebView(content.textHtml!);
        }
        setState(() {
          _isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _messageBody = widget.message.preview ?? '';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          // Message header
          _buildMessageHeader(context),

          // Message content
          Expanded(
            child: _isLoading
                ? const LoadingWidget(
                    message: 'Loading message...',
                    size: LoadingSize.large,
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_error != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              _error!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Theme.of(context).colorScheme.error),
                            ),
                          ),

                        // Attachments section (TODO: wire real attachments)
                        if (widget.message.hasAttachments)
                          _buildAttachmentsSection(context),

                        // Message body
                        _buildMessageBody(context),

                        const SizedBox(height: 24),

                        // Action buttons
                        _buildActionButtons(context),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(
        widget.message.subject ?? '(No Subject)',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            widget.message.isFlagged ? Icons.flag : Icons.flag_outlined,
            color: widget.message.isFlagged ? Colors.orange : null,
          ),
          onPressed: _toggleFlag,
          tooltip: widget.message.isFlagged ? 'Remove flag' : 'Add flag',
        ),
        IconButton(
          icon: const Icon(Icons.archive_outlined),
          onPressed: _archiveMessage,
          tooltip: 'Archive',
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: _deleteMessage,
          tooltip: 'Delete',
        ),
        PopupMenuButton<String>(
          onSelected: _handleMenuAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'mark_unread',
              child: ListTile(
                leading: Icon(Icons.mark_email_unread_outlined),
                title: Text('Mark as unread'),
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
            const PopupMenuItem(
              value: 'copy_link',
              child: ListTile(
                leading: Icon(Icons.link_outlined),
                title: Text('Copy link'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'print',
              child: ListTile(
                leading: Icon(Icons.print_outlined),
                title: Text('Print'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'report_spam',
              child: ListTile(
                leading: Icon(Icons.report_outlined),
                title: Text('Report spam'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMessageHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sender info
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: colorScheme.primaryContainer,
                child: Text(
                  (widget.message.from?.name ??
                          widget.message.from?.email ??
                          'U')[0]
                      .toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.message.from?.name ??
                          widget.message.from?.email ??
                          'Unknown Sender',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (widget.message.from?.email != null)
                      Text(
                        widget.message.from!.email!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _formatDateTime(widget.message.date),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.message.hasAttachments)
                        Icon(
                          Icons.attach_file_outlined,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      if (widget.message.priority == MessagePriority.high) ...[
                        if (widget.message.hasAttachments)
                          const SizedBox(width: 4),
                        const Icon(
                          Icons.priority_high_outlined,
                          size: 16,
                          color: Colors.red,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Recipients
          _buildRecipientInfo(context, 'To', widget.message.to ?? []),
          if (widget.message.cc?.isNotEmpty == true)
            _buildRecipientInfo(context, 'Cc', widget.message.cc!),
          if (widget.message.bcc?.isNotEmpty == true)
            _buildRecipientInfo(context, 'Bcc', widget.message.bcc!),

          // Subject
          const SizedBox(height: 12),
          Text(
            widget.message.subject ?? '(No Subject)',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          // Headers toggle
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () =>
                setState(() => _showFullHeaders = !_showFullHeaders),
            icon:
                Icon(_showFullHeaders ? Icons.expand_less : Icons.expand_more),
            label: Text(_showFullHeaders ? 'Hide details' : 'Show details'),
          ),

          // Full headers
          if (_showFullHeaders) _buildFullHeaders(context),
        ],
      ),
    );
  }

  Widget _buildRecipientInfo(
      BuildContext context, String label, List<MessageAddress> recipients) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              '$label:',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: recipients
                  .map((recipient) => Chip(
                        label: Text(
                          recipient.name ?? recipient.email,
                          style: theme.textTheme.bodySmall,
                        ),
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        side: BorderSide.none,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullHeaders(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(77),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderRow('Message ID', widget.message.id),
          _buildHeaderRow('Date', _formatFullDateTime(widget.message.date)),
          _buildHeaderRow('Size', _formatSize(widget.message.size ?? 0)),
          if (widget.message.replyTo != null)
            _buildHeaderRow('Reply-To', widget.message.replyTo!.first.email),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentsSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.attach_file_outlined,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Attachments',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Mock attachments
          _buildAttachmentItem(
              context, 'document.pdf', '2.4 MB', Icons.picture_as_pdf),
          _buildAttachmentItem(context, 'image.jpg', '1.2 MB', Icons.image),
        ],
      ),
    );
  }

  Widget _buildAttachmentItem(
      BuildContext context, String name, String size, IconData icon) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Icon(icon, color: colorScheme.primary),
      title: Text(name),
      subtitle: Text(size),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.download_outlined),
            onPressed: () => _downloadAttachment(name),
            tooltip: 'Download',
          ),
          IconButton(
            icon: const Icon(Icons.visibility_outlined),
            onPressed: () => _previewAttachment(name),
            tooltip: 'Preview',
          ),
        ],
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildMessageBody(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasHtml = (_content?.textHtml ?? '').trim().isNotEmpty &&
        _webViewController != null;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          if (hasHtml)
            // When HTML is available, show it inside a WebView with its own scroll
            SizedBox(
              height: 600,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: WebViewWidget(controller: _webViewController!),
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withAlpha(77),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                (_messageBody?.isNotEmpty ?? false)
                    ? _messageBody!
                    : 'No content',
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: 'Reply',
            icon: Icons.reply_outlined,
            onPressed: _replyToMessage,
            style: AppButtonStyle.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppButton(
            text: 'Reply All',
            icon: Icons.reply_all_outlined,
            onPressed: _replyAllToMessage,
            style: AppButtonStyle.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppButton(
            text: 'Forward',
            icon: Icons.forward_outlined,
            onPressed: _forwardMessage,
            style: AppButtonStyle.secondary,
          ),
        ),
      ],
    );
  }

  // Helper methods
  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday ${_formatTime(dateTime)}';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else {
        return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
      }
    } else {
      return _formatTime(dateTime);
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _formatFullDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${_formatTime(dateTime)}';
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  // Event handlers
  void _toggleFlag() {
    // Toggle message flag
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(widget.message.isFlagged ? 'Flag removed' : 'Message flagged'),
      ),
    );
  }

  void _archiveMessage() {
    // Archive message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message archived')),
    );
    Navigator.of(context).pop();
  }

  void _deleteMessage() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Message'),
        content: const Text('Are you sure you want to delete this message?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Message deleted')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'mark_unread':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Marked as unread')),
        );
        break;
      case 'move':
        _showMoveDialog();
        break;
      case 'copy_link':
        Clipboard.setData(
            ClipboardData(text: 'mailto:${widget.message.from?.email}'));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Link copied to clipboard')),
        );
        break;
      case 'print':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Print functionality not implemented')),
        );
        break;
      case 'report_spam':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message reported as spam')),
        );
        break;
    }
  }

  void _showMoveDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Move to Folder'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: const Text('Archive'),
              onTap: () {
                Navigator.of(context).pop();
                _archiveMessage();
              },
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

  void _downloadAttachment(String filename) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloading $filename...')),
    );
  }

  void _previewAttachment(String filename) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening preview for $filename...')),
    );
  }

  void _replyToMessage() {
    context.push('/compose?reply=${widget.message.id}');
  }

  void _replyAllToMessage() {
    context.push('/compose?replyAll=${widget.message.id}');
  }

  void _forwardMessage() {
    context.push('/compose?forward=${widget.message.id}');
  }
}

