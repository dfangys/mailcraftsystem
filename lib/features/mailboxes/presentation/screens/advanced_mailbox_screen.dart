import 'package:flutter/material.dart';

class AdvancedMailboxScreen extends StatefulWidget {
  const AdvancedMailboxScreen({super.key});

  @override
  State<AdvancedMailboxScreen> createState() => _AdvancedMailboxScreenState();
}

class _AdvancedMailboxScreenState extends State<AdvancedMailboxScreen> {
  final List<String> _emails =
      List.generate(20, (index) => 'Email ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _emails.length,
        itemBuilder: (context, index) {
          final email = _emails[index];
          return Dismissible(
            key: Key(email),
            background: _buildDismissibleBackground(
                Alignment.centerLeft, Colors.green, Icons.archive, 'Archive'),
            secondaryBackground: _buildDismissibleBackground(
                Alignment.centerRight, Colors.red, Icons.delete, 'Delete'),
            onDismissed: (direction) {
              setState(() {
                _emails.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        '$email ${direction == DismissDirection.startToEnd ? 'archived' : 'deleted'}')),
              );
            },
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(email),
              subtitle: const Text('This is the email body...'),
              trailing: const Text('10:00 AM'),
              onTap: () {
                // Navigate to email detail
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDismissibleBackground(
      AlignmentGeometry alignment, Color color, IconData icon, String label) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: alignment,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: Colors.white),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
