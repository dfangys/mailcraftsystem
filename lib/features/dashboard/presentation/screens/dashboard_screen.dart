import 'package:flutter/material.dart';
import 'package:mailcraftsystem/features/navigation/presentation/widgets/app_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome to MailCraft!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Emails',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual recent email count
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.email),
                      title: Text('Email Subject ${index + 1}'),
                      subtitle: Text('From: sender@example.com'),
                      onTap: () {
                        // Navigate to email detail
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Quick Access',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildQuickAccessCard(context, Icons.inbox, 'Inbox'),
                _buildQuickAccessCard(context, Icons.send, 'Sent'),
                _buildQuickAccessCard(context, Icons.drafts, 'Drafts'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(BuildContext context, IconData icon, String label) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to the respective mailbox
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Icon(icon, size: 40),
              const SizedBox(height: 10),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

