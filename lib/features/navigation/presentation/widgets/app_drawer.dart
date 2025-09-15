import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'MailCraft',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.inbox),
            title: const Text('Inbox'),
            onTap: () {
              // Navigate to Inbox
            },
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Sent'),
            onTap: () {
              // Navigate to Sent
            },
          ),
          ListTile(
            leading: const Icon(Icons.drafts),
            title: const Text('Drafts'),
            onTap: () {
              // Navigate to Drafts
            },
          ),
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Archive'),
            onTap: () {
              // Navigate to Archive
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Trash'),
            onTap: () {
              // Navigate to Trash
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to Settings
            },
          ),
        ],
      ),
    );
  }
}

