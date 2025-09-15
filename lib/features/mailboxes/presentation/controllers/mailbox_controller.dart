import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';

part 'mailbox_controller.freezed.dart';

@freezed
class MailboxState with _$MailboxState {
  const factory MailboxState({
    @Default(true) bool isLoading,
    Failure? failure,
    @Default([]) List<Mailbox> mailboxes,
    @Default([]) List<Message> messages,
    Mailbox? selectedMailbox,
  }) = _MailboxState;
}

class MailboxController extends StateNotifier<MailboxState> {
  MailboxController(
    this.mailboxRepository,
    this.messageRepository,
  ) : super(const MailboxState());

  final MailboxRepository mailboxRepository;
  final MessageRepository messageRepository;

  Future<void> getMailboxes(String accountId) async {
    state = state.copyWith(isLoading: true);
    final result = await mailboxRepository.fetchMailboxes(accountId);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, failure: failure),
      (mailboxes) => state = state.copyWith(isLoading: false, mailboxes: mailboxes),
    );
  }

  Future<void> getMessages(String accountId, String mailboxPath) async {
    state = state.copyWith(isLoading: true);
    final result = await messageRepository.fetchMessages(accountId, mailboxPath);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, failure: failure),
      (messages) => state = state.copyWith(isLoading: false, messages: messages),
    );
  }
}

final mailboxControllerProvider = StateNotifierProvider<MailboxController, MailboxState>((ref) {
  // This will be properly initialized later with the actual repositories
  throw UnimplementedError(); 
});

