import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

part 'mailbox_state.freezed.dart';

/// State for mailbox management
@freezed
class MailboxState with _$MailboxState {
  /// Creates a mailbox state
  const factory MailboxState({
    @Default([]) List<Mailbox> mailboxes,
    @Default([]) List<Message> messages,
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    String? error,
    Mailbox? selectedMailbox,
  }) = _MailboxState;
}
