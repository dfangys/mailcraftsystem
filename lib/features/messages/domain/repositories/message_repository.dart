import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message_content.dart';

/// Message repository interface
abstract class MessageRepository {
  /// Get messages from a mailbox
  Future<Either<Failure, List<Message>>> getMessages(
    String accountId,
    String mailboxPath, {
    int? limit,
    int? offset,
    dynamic sortOrder,
  });

  /// Get a specific message by UID
  Future<Either<Failure, Message>> getMessage(
    String accountId,
    String mailboxPath,
    int uid,
  );

  /// Get message content (full body)
  Future<Either<Failure, MessageContent>> getMessageContent(
    String accountId,
    String mailboxPath,
    int uid,
  );

  /// Mark message as read
  Future<Either<Failure, void>> markAsRead(
    String accountId,
    String mailboxPath,
    int uid,
  );

  /// Mark message as unread
  Future<Either<Failure, void>> markAsUnread(
    String accountId,
    String mailboxPath,
    int uid,
  );

  /// Flag message
  Future<Either<Failure, void>> flagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  );

  /// Unflag message
  Future<Either<Failure, void>> unflagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  );

  /// Move message to another mailbox
  Future<Either<Failure, void>> moveMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  );

  /// Copy message to another mailbox
  Future<Either<Failure, void>> copyMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  );

  /// Delete message (move to trash or permanent delete)
  Future<Either<Failure, void>> deleteMessage(
    String accountId,
    String mailboxPath,
    int uid, {
    bool permanent = false,
  });

  /// Download attachment
  Future<Either<Failure, String>> downloadAttachment(
    String accountId,
    String mailboxPath,
    int uid,
    String attachmentId,
  );

  /// Search messages
  Future<Either<Failure, List<Message>>> searchMessages(
    String accountId,
    String mailboxPath,
    dynamic criteria,
  );

  /// Get message thread
  Future<Either<Failure, List<Message>>> getMessageThread(
    String accountId,
    String messageId,
  );

  /// Bulk operations
  Future<Either<Failure, void>> bulkMarkAsRead(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );

  Future<Either<Failure, void>> bulkMarkAsUnread(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );

  Future<Either<Failure, void>> bulkFlag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );

  Future<Either<Failure, void>> bulkUnflag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  );

  Future<Either<Failure, void>> bulkMove(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    List<int> uids,
  );

  Future<Either<Failure, void>> bulkDelete(
    String accountId,
    String mailboxPath,
    List<int> uids, {
    bool permanent = false,
  });
}

