import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

/// Message detail screen
class MessageDetailScreen extends ConsumerWidget {
  /// Creates a message detail screen
  const MessageDetailScreen({required this.message, super.key});

  /// The message to display
  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(message.subject ?? 'No Subject'),
        actions: [
          IconButton(
            icon: const Icon(Icons.archive_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mark_as_unread_outlined),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'move',
                child: Text('Move to'),
              ),
              const PopupMenuItem<String>(
                value: 'snooze',
                child: Text('Snooze'),
              ),
              const PopupMenuItem<String>(
                value: 'label',
                child: Text('Change labels'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.subject ?? 'No Subject',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  child: Text(message.from?.name?.substring(0, 1) ?? 'U'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.from?.name ?? 'Unknown Sender',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'to me',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Text(
                  message.date?.toString() ?? '',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              message.textPlain ?? 'No content',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

