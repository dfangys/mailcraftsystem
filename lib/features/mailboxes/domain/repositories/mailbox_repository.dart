import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox_status.dart';

/// Mailbox repository interface
abstract class MailboxRepository {
  /// Get all mailboxes for an account
  Future<({Failure? left, [^}]* right})>> getMailboxes(String accountId);
  
  /// Get a specific mailbox by path
  Future<({Failure? left, [^}]* right})> getMailbox(String accountId, String path);
  
  /// Refresh mailbox list from server
  Future<({Failure? left, [^}]* right})>> refreshMailboxes(String accountId);
  
  /// Create a new mailbox
  Future<({Failure? left, [^}]* right})> createMailbox(
    String accountId,
    String name,
    String? parentPath,
  );
  
  /// Rename a mailbox
  Future<({Failure? left, [^}]* right})> renameMailbox(
    String accountId,
    String currentPath,
    String newName,
  );
  
  /// Delete a mailbox
  Future<({Failure? left, [^}]* right})> deleteMailbox(String accountId, String path);
  
  /// Subscribe to a mailbox
  Future<({Failure? left, [^}]* right})> subscribeMailbox(String accountId, String path);
  
  /// Unsubscribe from a mailbox
  Future<({Failure? left, [^}]* right})> unsubscribeMailbox(String accountId, String path);
  
  /// Get mailbox status (message counts, etc.)
  Future<({Failure? left, [^}]* right})> getMailboxStatus(
    String accountId,
    String path,
  );
  
  /// Mark all messages in mailbox as read
  Future<({Failure? left, [^}]* right})> markAllAsRead(String accountId, String path);
  
  /// Empty trash mailbox
  Future<({Failure? left, [^}]* right})> emptyTrash(String accountId);
  
  /// Empty spam mailbox
  Future<({Failure? left, [^}]* right})> emptySpam(String accountId);
  
  /// Get mailbox hierarchy
  Future<({Failure? left, [^}]* right})>> getMailboxHierarchy(String accountId);
  
  /// Search for mailboxes by name
  Future<({Failure? left, [^}]* right})>> searchMailboxes(
    String accountId,
    String query,
  );
}
