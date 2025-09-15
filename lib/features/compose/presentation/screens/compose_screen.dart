import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailcraftsystem/shared/widgets/app_button.dart';
import 'package:mailcraftsystem/shared/widgets/app_card.dart';
import 'package:mailcraftsystem/shared/forms/app_text_field.dart';

/// Enterprise-grade email compose screen with rich editing capabilities
class ComposeScreen extends ConsumerStatefulWidget {
  /// Creates a compose screen
  const ComposeScreen({super.key});

  @override
  ConsumerState<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends ConsumerState<ComposeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _toController = TextEditingController();
  final _ccController = TextEditingController();
  final _bccController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();
  
  bool _showCc = false;
  bool _showBcc = false;
  bool _isRichText = false;
  bool _isSending = false;
  MessagePriority _priority = MessagePriority.normal;
  final List<AttachmentItem> _attachments = [];

  @override
  void dispose() {
    _toController.dispose();
    _ccController.dispose();
    _bccController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Compose header
            _buildComposeHeader(context),
            
            // Message content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipients section
                    _buildRecipientsSection(context),
                    
                    const SizedBox(height: 16),
                    
                    // Subject field
                    _buildSubjectField(context),
                    
                    const SizedBox(height: 16),
                    
                    // Attachments section
                    if (_attachments.isNotEmpty) _buildAttachmentsSection(context),
                    
                    // Message body
                    _buildMessageBodyField(context),
                    
                    const SizedBox(height: 24),
                    
                    // Formatting toolbar
                    if (_isRichText) _buildFormattingToolbar(context),
                  ],
                ),
              ),
            ),
            
            // Bottom action bar
            _buildBottomActionBar(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    
    return AppBar(
      title: Text(
        'Compose',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: _handleClose,
      ),
      actions: [
        // Priority indicator
        if (_priority != MessagePriority.normal)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Chip(
              label: Text(
                _priority == MessagePriority.high ? 'High' : 'Low',
                style: theme.textTheme.labelSmall,
              ),
              backgroundColor: _priority == MessagePriority.high 
                  ? Colors.red.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1),
              side: BorderSide.none,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        
        // More options
        PopupMenuButton<String>(
          onSelected: _handleMenuAction,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'priority',
              child: ListTile(
                leading: const Icon(Icons.priority_high_outlined),
                title: const Text('Set priority'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            PopupMenuItem(
              value: 'schedule',
              child: ListTile(
                leading: const Icon(Icons.schedule_outlined),
                title: const Text('Schedule send'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            PopupMenuItem(
              value: 'save_draft',
              child: ListTile(
                leading: const Icon(Icons.drafts_outlined),
                title: const Text('Save as draft'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            PopupMenuItem(
              value: 'discard',
              child: ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Discard'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComposeHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
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
            Icons.edit_outlined,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Message',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'From: user@example.com',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          // Send button
          AppButton(
            text: 'Send',
            icon: Icons.send_outlined,
            onPressed: _isSending ? null : _sendMessage,
            isLoading: _isSending,
            style: AppButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientsSection(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          // To field
          AppTextField(
            controller: _toController,
            label: 'To',
            hint: 'Enter email addresses',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter at least one recipient';
              }
              return null;
            },
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_showCc)
                  TextButton(
                    onPressed: () => setState(() => _showCc = true),
                    child: const Text('Cc'),
                  ),
                if (!_showBcc)
                  TextButton(
                    onPressed: () => setState(() => _showBcc = true),
                    child: const Text('Bcc'),
                  ),
              ],
            ),
          ),
          
          // Cc field
          if (_showCc) ...[
            const SizedBox(height: 12),
            AppTextField(
              controller: _ccController,
              label: 'Cc',
              hint: 'Carbon copy recipients',
              keyboardType: TextInputType.emailAddress,
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => setState(() {
                  _showCc = false;
                  _ccController.clear();
                }),
              ),
            ),
          ],
          
          // Bcc field
          if (_showBcc) ...[
            const SizedBox(height: 12),
            AppTextField(
              controller: _bccController,
              label: 'Bcc',
              hint: 'Blind carbon copy recipients',
              keyboardType: TextInputType.emailAddress,
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => setState(() {
                  _showBcc = false;
                  _bccController.clear();
                }),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSubjectField(BuildContext context) {
    return AppTextField(
      controller: _subjectController,
      label: 'Subject',
      hint: 'Enter email subject',
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a subject';
        }
        return null;
      },
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
                'Attachments (${_attachments.length})',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...._attachments.map((attachment) => _buildAttachmentItem(context, attachment)),
        ],
      ),
    );
  }

  Widget _buildAttachmentItem(BuildContext context, AttachmentItem attachment) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            _getFileIcon(attachment.name),
            color: colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attachment.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _formatFileSize(attachment.size),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _removeAttachment(attachment),
            tooltip: 'Remove attachment',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBodyField(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Message',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Switch(
                value: _isRichText,
                onChanged: (value) => setState(() => _isRichText = value),
              ),
              const SizedBox(width: 8),
              Text(
                'Rich Text',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _bodyController,
            maxLines: 12,
            decoration: InputDecoration(
              hintText: 'Compose your message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: colorScheme.surface,
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter a message';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFormattingToolbar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      child: Wrap(
        spacing: 8,
        children: [
          IconButton(
            icon: const Icon(Icons.format_bold),
            onPressed: () => _applyFormatting('bold'),
            tooltip: 'Bold',
          ),
          IconButton(
            icon: const Icon(Icons.format_italic),
            onPressed: () => _applyFormatting('italic'),
            tooltip: 'Italic',
          ),
          IconButton(
            icon: const Icon(Icons.format_underlined),
            onPressed: () => _applyFormatting('underline'),
            tooltip: 'Underline',
          ),
          const VerticalDivider(),
          IconButton(
            icon: const Icon(Icons.format_list_bulleted),
            onPressed: () => _applyFormatting('bullet'),
            tooltip: 'Bullet list',
          ),
          IconButton(
            icon: const Icon(Icons.format_list_numbered),
            onPressed: () => _applyFormatting('number'),
            tooltip: 'Numbered list',
          ),
          const VerticalDivider(),
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () => _insertLink(),
            tooltip: 'Insert link',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          AppButton.icon(
            icon: Icons.attach_file_outlined,
            onPressed: _addAttachment,
          ),
          const SizedBox(width: 12),
          AppButton.icon(
            icon: Icons.image_outlined,
            onPressed: _addImage,
          ),
          const SizedBox(width: 12),
          AppButton.icon(
            icon: Icons.emoji_emotions_outlined,
            onPressed: _showEmojiPicker,
          ),
          const Spacer(),
          AppButton(
            text: 'Save Draft',
            style: AppButtonStyle.text,
            onPressed: _saveDraft,
          ),
        ],
      ),
    );
  }

  // Helper methods
  IconData _getFileIcon(String filename) {
    final extension = filename.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'mp3':
      case 'wav':
        return Icons.audio_file;
      case 'mp4':
      case 'avi':
        return Icons.video_file;
      default:
        return Icons.insert_drive_file;
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  // Event handlers
  void _handleClose() {
    if (_hasUnsavedChanges()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Discard Message'),
          content: const Text('Are you sure you want to discard this message?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.pop();
              },
              child: const Text('Discard'),
            ),
          ],
        ),
      );
    } else {
      context.pop();
    }
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'priority':
        _showPriorityDialog();
        break;
      case 'schedule':
        _showScheduleDialog();
        break;
      case 'save_draft':
        _saveDraft();
        break;
      case 'discard':
        _handleClose();
        break;
    }
  }

  Future<void> _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSending = true);

    try {
      // Simulate sending
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  void _addAttachment() {
    // Mock attachment
    setState(() {
      _attachments.add(AttachmentItem(
        name: 'document_${_attachments.length + 1}.pdf',
        size: 1024 * 1024, // 1MB
      ));
    });
  }

  void _addImage() {
    // Mock image attachment
    setState(() {
      _attachments.add(AttachmentItem(
        name: 'image_${_attachments.length + 1}.jpg',
        size: 2 * 1024 * 1024, // 2MB
      ));
    });
  }

  void _removeAttachment(AttachmentItem attachment) {
    setState(() {
      _attachments.remove(attachment);
    });
  }

  void _showEmojiPicker() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Emoji picker not implemented')),
    );
  }

  void _applyFormatting(String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Applied $format formatting')),
    );
  }

  void _insertLink() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Link insertion not implemented')),
    );
  }

  void _saveDraft() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Draft saved')),
    );
  }

  void _showPriorityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Priority'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: MessagePriority.values.map((priority) => RadioListTile<MessagePriority>(
            title: Text(priority.name.toUpperCase()),
            value: priority,
            groupValue: _priority,
            onChanged: (value) {
              setState(() => _priority = value!);
              Navigator.of(context).pop();
            },
          )).toList(),
        ),
      ),
    );
  }

  void _showScheduleDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Schedule send not implemented')),
    );
  }

  bool _hasUnsavedChanges() {
    return _toController.text.isNotEmpty ||
           _subjectController.text.isNotEmpty ||
           _bodyController.text.isNotEmpty ||
           _attachments.isNotEmpty;
  }
}

/// Message priority enum
enum MessagePriority { low, normal, high }

/// Attachment item data class
class AttachmentItem {
  const AttachmentItem({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;
}
