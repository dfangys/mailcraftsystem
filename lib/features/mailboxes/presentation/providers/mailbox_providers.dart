import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailcraftsystem/features/auth/presentation/controllers/auth_controller.dart' show mailClientServiceProvider;
import 'package:mailcraftsystem/features/mailboxes/data/repositories/mailbox_repository_impl.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';
import 'package:mailcraftsystem/features/mailboxes/presentation/controllers/mailbox_controller.dart';
import 'package:mailcraftsystem/features/messages/data/repositories/message_repository_impl.dart';
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';

final mailboxRepositoryProvider = Provider<MailboxRepository>((ref) {
  final mailClientService = ref.watch(mailClientServiceProvider);
  return MailboxRepositoryImpl(mailClientService: mailClientService);
});

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  final mailClientService = ref.watch(mailClientServiceProvider);
  return MessageRepositoryImpl(mailClientService: mailClientService);
});

final mailboxControllerProvider =
    StateNotifierProvider<MailboxController, MailboxState>((ref) {
  return MailboxController(
    ref.watch(mailboxRepositoryProvider),
    ref.watch(messageRepositoryProvider),
  );
});
