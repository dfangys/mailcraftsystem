import 'package:flutter/material.dart';

class MessageHandlingScreen extends StatelessWidget {
  const MessageHandlingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Subject'),
        actions: [
          IconButton(
            icon: const Icon(Icons.archive),
            onPressed: () {
              // Handle archive
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Handle delete
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Email Subject',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('sender@example.com', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('to me'),
                  ],
                ),
                Spacer(),
                Text('10:00 AM'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'This is the email body. It can be a long text with multiple paragraphs. This is just a sample email body to demonstrate the UI of the message handling screen.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.reply),
              onPressed: () {
                // Handle reply
              },
            ),
            IconButton(
              icon: const Icon(Icons.reply_all),
              onPressed: () {
                // Handle reply all
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward),
              onPressed: () {
                // Handle forward
              },
            ),
          ],
        ),
      ),
    );
  }
}

