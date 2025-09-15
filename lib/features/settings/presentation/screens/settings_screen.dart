import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('General'),
            subtitle: const Text('Theme, language, notifications'),
            leading: const Icon(Icons.settings),
            onTap: () {
              // Navigate to general settings
            },
          ),
          ListTile(
            title: const Text('Accounts'),
            subtitle: const Text('Manage your email accounts'),
            leading: const Icon(Icons.account_circle),
            onTap: () {
              // Navigate to accounts settings
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('App version, licenses'),
            leading: const Icon(Icons.info),
            onTap: () {
              // Navigate to about screen
            },
          ),
        ],
      ),
    );
  }
}

