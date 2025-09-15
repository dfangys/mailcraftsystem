import 'package:dartz/dartz.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/account/data/datasources/mail_client_service.dart';
import 'package:mailcraftsystem/features/mailboxes/domain/models/mailbox.dart' as model;
import 'package:mailcraftsystem/features/mailboxes/domain/repositories/mailbox_repository.dart';

class MailboxRepositoryImpl implements MailboxRepository {
  MailboxRepositoryImpl({required this.mailClientService});

  final MailClientService mailClientService;

  @override
  Future<Either<Failure, List<model.Mailbox>>> fetchMailboxes(String accountId) async {
    try {
      final mailboxes = await mailClientService.client!.listMailboxes(accountId);
      final mappedMailboxes = mailboxes.map((e) => model.Mailbox.fromEnoughMail(e)).toList();
      return Right(mappedMailboxes);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> selectMailbox(String accountId, String mailboxPath) async {
    try {
      await mailClientService.client!.selectMailboxByPath(accountId, mailboxPath);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }
}

