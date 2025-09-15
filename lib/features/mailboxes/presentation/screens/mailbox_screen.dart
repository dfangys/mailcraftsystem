import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mailcraftsystem/features/mailboxes/presentation/providers/mailbox_providers.dart';

class MailboxScreen extends ConsumerStatefulWidget {
  const MailboxScreen({super.key});

  @override
  ConsumerState<MailboxScreen> createState() => _MailboxScreenState();
}

class _MailboxScreenState extends ConsumerState<MailboxScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch initial data
    // TODO: Replace 'dummy_account' with the actual account ID
    Future.microtask(() {
      ref.read(mailboxControllerProvider.notifier).getMailboxes("dummy_account");
      ref.read(mailboxControllerProvider.notifier).getMessages("dummy_account", "INBOX");
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mailboxControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.selectedMailbox?.name ?? 'Inbox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.failure != null
              ? Center(child: Text('Error: ${state.failure!.message}'))
              : ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(message.from?.name?.substring(0, 1) ?? 'N'),
                      ),
                      title: Text(message.subject ?? '(No Subject)'),
                      subtitle: Text(message.from?.name ?? 'Unknown Sender'),
                      trailing: Text(message.date?.toString() ?? ''),
                      onTap: () {
                        context.go('/message-detail', extra: message);
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/compose');
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

