import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message_content.dart';

/// Message repository interface
abstract class MessageRepository {
  /// Get messages from a mailbox
  Future<({Failure? left, [^}]* right})>> getMessages(
    String accountId,
    String mailboxPath, {
    int? limit,
    int? offset,
    MessageSortOrder? sortOrder,
  });
  
  /// Get a specific message by UID
  Future<({Failure? left, [^}]* right})> getMessage(
    String accountId,
    String mailboxPath,
    int uid,
  );
  
  /// Get message content (full body)
  Future<({Failure? left, [^}]* right})> getMessageContent(
    String accountId,
    String mailboxPath,
    int uid,
  );
  
  /// Mark message as read
  Future<({Failure? left, [^}]* right})> markAsRead(
    String accountId,
    String mailboxPath,
    int uid,
  );
  
  /// Mark message as unread
  Future<({Failure? left, [^}]* right})> markAsUnread(
    String accountId,
    String mailboxPath,
    int uid,
  );
  
  /// Flag message
  Future<({Failure? left, [^}]* right})> flagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  );
  
  /// Unflag message
  Future<({Failure? left, [^}]* right})> unflagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  );
  
  /// Move message to another mailbox
  Future<({Failure? left, [^}]* right})> moveMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  );
  
  /// Copy message to another mailbox
  Future<({Failure? left, [^}]* right})> copyMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  );
  
  /// Delete message (move to trash or permanent delete)
  Future<({Failure? left, [^}]* right})> deleteMessage(
    String accountId,
    String mailboxPath,
    int uid, {
    bool permanent = false,
  });
  
  /// Download attachment
  Future<({Failure? left, [^}]* right})> downloadAttachment(
    String accountId,
    String mailboxPath,
    int uid,
    String attachmentId,
  );
  
  /// Search messages
  Future<({Failure? left, [^}]* right})>> searchMessages(
    String accountId,
    String mailboxPath,
    MessageSearchCriteria criteria,
  );
  
  /// Get message thread
  Future<({Failure? left, [^}]* right})>> getMessageThread(
    String accountId,
    String messageId,
  );
  
  /// Bulk operations
  Future<({Failure? left, [^}]* right})> bulkMarkAsRead(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );
  
  Future<({Failure? left, [^}]* right})> bulkMarkAsUnread(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );
  
  Future<({Failure? left, [^}]* right})> bulkFlag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );
  
  Future<({Failure? left, [^}]* right})> bulkUnflag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );
  
  Future<({Failure? left, [^}]* right})> bulkMove(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    List<int> uids,
  );
  
  Future<({Failure? left, [^}]* right})> bulkDelete(
    String accountId,
    String mailboxPath,
    List<int> uids, {
    bool permanent = false,
  });
}
