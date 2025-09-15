import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/features/mailboxes/data/repositories/mock_mailbox_repository.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/controllers/mailbox_controller.dart';
import 'package:mailcraftsystem/features/messages/data/repositories/mock_message_repository.dart';
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';

final mailboxRepositoryProvider = Provider<MailboxRepository>((ref) {
  return MockMailboxRepository();
});

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  return MockMessageRepository();
});

final mailboxControllerProvider = StateNotifierProvider<MailboxController, MailboxState>((ref) {
  return MailboxController(
    mailboxRepository: ref.watch(mailboxRepositoryProvider),
    messageRepository: ref.watch(messageRepositoryProvider),
  );
});

