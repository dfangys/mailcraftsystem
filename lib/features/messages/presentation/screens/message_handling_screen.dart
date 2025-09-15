import 'package:flutter/material.dart';

/// A screen that provides options for handling messages.
class MessageHandlingScreen extends StatelessWidget {
  /// Creates a [MessageHandlingScreen].
  const MessageHandlingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Message'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Archive'),
            onTap: () {
              // Handle archive action
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Delete'),
            onTap: () {
              // Handle delete action
            },
          ),
          ListTile(
            leading: const Icon(Icons.mark_email_unread_outlined),
            title: const Text('Mark as unread'),
            onTap: () {
              // Handle mark as unread action
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: const Text('Move to folder'),
            onTap: () {
              // Handle move to folder action
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_outlined),
            title: const Text('Report spam'),
            onTap: () {
              // Handle report spam action
            },
          ),
        ],
      ),
    );
  }
}

