import 'package:flutter/material.dart';

class EnterpriseFeaturesScreen extends StatelessWidget {
  const EnterpriseFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enterprise Features'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Data Loss Prevention (DLP)'),
            subtitle: const Text('Configure DLP policies'),
            leading: const Icon(Icons.security),
            onTap: () {
              // Navigate to DLP settings
            },
          ),
          ListTile(
            title: const Text('eDiscovery'),
            subtitle: const Text('Search and export emails for legal matters'),
            leading: const Icon(Icons.gavel),
            onTap: () {
              // Navigate to eDiscovery screen
            },
          ),
          ListTile(
            title: const Text('Audit Logs'),
            subtitle: const Text('Review user activity and security events'),
            leading: const Icon(Icons.history),
            onTap: () {
              // Navigate to audit logs screen
            },
          ),
        ],
      ),
    );
  }
}

