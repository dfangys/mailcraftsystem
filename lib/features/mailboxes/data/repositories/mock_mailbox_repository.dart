import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox_status.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';

class MockMailboxRepository implements MailboxRepository {
  @override
  Future<Either<Failure, List<Mailbox>>> getMailboxes(String accountId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right([
      Mailbox(id: 'INBOX', path: 'INBOX', name: 'Inbox', type: MailboxType.inbox, isSubscribed: true, isSelectable: true),
      Mailbox(id: 'Sent', path: 'Sent', name: 'Sent', type: MailboxType.sent, isSubscribed: true, isSelectable: true),
      Mailbox(id: 'Drafts', path: 'Drafts', name: 'Drafts', type: MailboxType.drafts, isSubscribed: true, isSelectable: true),
      Mailbox(id: 'Trash', path: 'Trash', name: 'Trash', type: MailboxType.trash, isSubscribed: true, isSelectable: true),
    ]);
  }

  @override
  Future<Either<Failure, Mailbox>> getMailbox(String accountId, String path) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(Mailbox(id: path, path: path, name: path, type: MailboxType.custom, isSubscribed: true, isSelectable: true));
  }

  @override
  Future<Either<Failure, List<Mailbox>>> refreshMailboxes(String accountId) async {
    return getMailboxes(accountId);
  }

  @override
  Future<Either<Failure, Mailbox>> createMailbox(String accountId, String name, String? parentPath) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(Mailbox(id: name, path: name, name: name, type: MailboxType.custom, isSubscribed: true, isSelectable: true));
  }

  @override
  Future<Either<Failure, void>> renameMailbox(String accountId, String currentPath, String newName) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteMailbox(String accountId, String path) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> subscribeMailbox(String accountId, String path) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> unsubscribeMailbox(String accountId, String path) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, MailboxStatus>> getMailboxStatus(String accountId, String path) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(MailboxStatus(path: path, messageCount: 10, unreadCount: 2, recentCount: 0));
  }

  @override
  Future<Either<Failure, void>> markAllAsRead(String accountId, String path) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> emptyTrash(String accountId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> emptySpam(String accountId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<Mailbox>>> getMailboxHierarchy(String accountId) async {
    return getMailboxes(accountId);
  }

  @override
  Future<Either<Failure, List<Mailbox>>> searchMailboxes(String accountId, String query) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right([]);
  }
}

