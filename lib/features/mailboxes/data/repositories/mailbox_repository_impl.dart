import 'package:dartz/dartz.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/account/data/datasources/mail_client_service.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart' as model;
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox_status.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';

class MailboxRepositoryImpl implements MailboxRepository {
  MailboxRepositoryImpl({required this.mailClientService});

  final MailClientService mailClientService;

  @override
  Future<Either<Failure, List<model.Mailbox>>> getMailboxes(String accountId) async {
    try {
      final mailboxes = await mailClientService.client!.listMailboxes();
      final mappedMailboxes = mailboxes.map((e) => model.Mailbox.fromEnoughMail(e)).toList();
      return Right(mappedMailboxes);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown mail error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, model.Mailbox>> getMailbox(String accountId, String path) async {
    try {
      final mailboxes = await mailClientService.client!.listMailboxes();
      final mailbox = mailboxes.firstWhere((box) => box.path == path);
      return Right(model.Mailbox.fromEnoughMail(mailbox));
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown mail error'));
    } catch (e) {
      return Left(Failure.notFound(message: 'Mailbox not found: $path'));
    }
  }

  @override
  Future<Either<Failure, List<model.Mailbox>>> refreshMailboxes(String accountId) async {
    return getMailboxes(accountId);
  }

  @override
  Future<Either<Failure, model.Mailbox>> createMailbox(
    String accountId,
    String name,
    String? parentPath,
  ) async {
    try {
      final path = parentPath != null ? '$parentPath/$name' : name;
      await mailClientService.client!.createMailbox(path);
      final mailboxes = await mailClientService.client!.listMailboxes();
      final mailbox = mailboxes.firstWhere((box) => box.path == path);
      return Right(model.Mailbox.fromEnoughMail(mailbox));
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown mail error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> renameMailbox(
    String accountId,
    String currentPath,
    String newName,
  ) async {
    return const Left(Failure.notImplemented(message: 'Rename mailbox not implemented'));
  }

  @override
  Future<Either<Failure, void>> deleteMailbox(String accountId, String path) async {
    try {
      final mailboxes = await mailClientService.client!.listMailboxes();
      final mailbox = mailboxes.firstWhere((box) => box.path == path);
      await mailClientService.client!.deleteMailbox(mailbox);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown mail error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> subscribeMailbox(String accountId, String path) async {
    return const Left(Failure.notImplemented(message: 'Subscribe mailbox not implemented'));
  }

  @override
  Future<Either<Failure, void>> unsubscribeMailbox(String accountId, String path) async {
    return const Left(Failure.notImplemented(message: 'Unsubscribe mailbox not implemented'));
  }

  @override
  Future<Either<Failure, MailboxStatus>> getMailboxStatus(
    String accountId,
    String path,
  ) async {
    try {
      final mailbox = await mailClientService.client!.selectMailboxByPath(path);
      return Right(MailboxStatus(
        path: path,
        messageCount: mailbox.messagesExists,
        unreadCount: mailbox.messagesUnseen,
        recentCount: mailbox.messagesRecent,
        uidNext: mailbox.uidNext,
        uidValidity: mailbox.uidValidity,
      ));
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown mail error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead(String accountId, String path) async {
    return const Left(Failure.notImplemented(message: 'Mark all as read not implemented'));
  }

  @override
  Future<Either<Failure, void>> emptyTrash(String accountId) async {
    return const Left(Failure.notImplemented(message: 'Empty trash not implemented'));
  }

  @override
  Future<Either<Failure, void>> emptySpam(String accountId) async {
    return const Left(Failure.notImplemented(message: 'Empty spam not implemented'));
  }

  @override
  Future<Either<Failure, List<model.Mailbox>>> getMailboxHierarchy(String accountId) async {
    return getMailboxes(accountId);
  }

  @override
  Future<Either<Failure, List<model.Mailbox>>> searchMailboxes(
    String accountId,
    String query,
  ) async {
    try {
      final mailboxes = await mailClientService.client!.listMailboxes();
      final filteredMailboxes = mailboxes
          .where((box) => 
              box.name.toLowerCase().contains(query.toLowerCase()) ||
              box.path.toLowerCase().contains(query.toLowerCase()))
          .map((e) => model.Mailbox.fromEnoughMail(e))
          .toList();
      return Right(filteredMailboxes);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown mail error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }
}
