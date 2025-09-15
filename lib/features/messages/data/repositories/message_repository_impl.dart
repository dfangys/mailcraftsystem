import 'package:dartz/dartz.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/account/data/datasources/mail_client_service.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart' as model;
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl({required this.mailClientService});

  final MailClientService mailClientService;

  @override
  Future<Either<Failure, List<model.Message>>> getMessages(
    String accountId,
    String mailboxPath,
  ) async {
    try {
      final messages = await mailClientService.client!.fetchMessages();
      final mappedMessages = messages.map((e) => model.Message.fromEnoughMail(e)).toList();
      return Right(mappedMessages);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, model.Message>> getMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      // First get the message from the list, then fetch its contents
      final messages = await mailClientService.client!.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      final fullMessage = await mailClientService.client!.fetchMessageContents(message);
      final mappedMessage = model.Message.fromEnoughMail(fullMessage);
      return Right(mappedMessage);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }
}

