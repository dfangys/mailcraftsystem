import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox_status.dart';

/// Mailbox repository interface
abstract class MailboxRepository {
  /// Get all mailboxes for an account
  Future<Either<Failure, List<Mailbox>>> getMailboxes(String accountId);

  /// Get a specific mailbox by path
  Future<Either<Failure, Mailbox>> getMailbox(String accountId, String path);

  /// Refresh mailbox list from server
  Future<Either<Failure, List<Mailbox>>> refreshMailboxes(String accountId);

  /// Create a new mailbox
  Future<Either<Failure, Mailbox>> createMailbox(
    String accountId,
    String name,
    String? parentPath,
  );

  /// Rename a mailbox
  Future<Either<Failure, void>> renameMailbox(
    String accountId,
    String currentPath,
    String newName,
  );

  /// Delete a mailbox
  Future<Either<Failure, void>> deleteMailbox(String accountId, String path);

  /// Subscribe to a mailbox
  Future<Either<Failure, void>> subscribeMailbox(String accountId, String path);

  /// Unsubscribe from a mailbox
  Future<Either<Failure, void>> unsubscribeMailbox(
      String accountId, String path);

  /// Get mailbox status (message counts, etc.)
  Future<Either<Failure, MailboxStatus>> getMailboxStatus(
    String accountId,
    String path,
  );

  /// Mark all messages in mailbox as read
  Future<Either<Failure, void>> markAllAsRead(String accountId, String path);

  /// Empty trash mailbox
  Future<Either<Failure, void>> emptyTrash(String accountId);

  /// Empty spam mailbox
  Future<Either<Failure, void>> emptySpam(String accountId);

  /// Get mailbox hierarchy
  Future<Either<Failure, List<Mailbox>>> getMailboxHierarchy(String accountId);

  /// Search for mailboxes by name
  Future<Either<Failure, List<Mailbox>>> searchMailboxes(
    String accountId,
    String query,
  );
}
