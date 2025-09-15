import 'package:dartz/dartz.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/account/data/datasources/mail_client_service.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart' as model;
import 'package:mailcraftsystem/features/messages/domain/models/message_content.dart';
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl({required this.mailClientService});

  final MailClientService mailClientService;

  @override
  Future<Either<Failure, List<model.Message>>> getMessages(
    String accountId,
    String mailboxPath, {
    int? limit,
    int? offset,
    dynamic sortOrder,
  }) async {
    try {
      final messages = await mailClientService.client!.fetchMessages(
        count: limit ?? 20,
        page: (offset ?? 0) ~/ (limit ?? 20) + 1,
      );
      final mappedMessages = messages.map((e) => model.Message.fromEnoughMail(e)).toList();
      return Right(mappedMessages);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
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
      final messages = await mailClientService.client!.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      final fullMessage = await mailClientService.client!.fetchMessageContents(message);
      final mappedMessage = model.Message.fromEnoughMail(fullMessage);
      return Right(mappedMessage);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, MessageContent>> getMessageContent(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final messages = await mailClientService.client!.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      final fullMessage = await mailClientService.client!.fetchMessageContents(message);
      
      return Right(MessageContent(
        textPlain: fullMessage.decodeTextPlainPart() ?? '',
        textHtml: fullMessage.decodeTextHtmlPart(),
        attachments: [],
        inlineAttachments: [],
      ));
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      await mailClientService.client!.markSeen(MessageSequence.fromId(uid));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsUnread(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      await mailClientService.client!.markUnseen(MessageSequence.fromId(uid));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> flagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      await mailClientService.client!.markFlagged(MessageSequence.fromId(uid));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> unflagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      await mailClientService.client!.markUnflagged(MessageSequence.fromId(uid));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> moveMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  ) async {
    try {
      // Get target mailbox
      final mailboxes = await mailClientService.client!.listMailboxes();
      final targetMailbox = mailboxes.firstWhere((box) => box.path == toMailboxPath);
      await mailClientService.client!.moveMessages(MessageSequence.fromId(uid), targetMailbox);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> copyMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  ) async {
    try {
      // Copy functionality is not directly available in enough_mail
      return const Left(Failure.notImplemented(message: 'Copy message not implemented'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMessage(
    String accountId,
    String mailboxPath,
    int uid, {
    bool permanent = false,
  }) async {
    try {
      await mailClientService.client!.deleteMessages(
        MessageSequence.fromId(uid), 
        expunge: permanent,
      );
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> downloadAttachment(
    String accountId,
    String mailboxPath,
    int uid,
    String attachmentId,
  ) async {
    try {
      // This would require more complex implementation with part fetching
      return const Left(Failure.notImplemented(message: 'Attachment download not implemented'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<model.Message>>> searchMessages(
    String accountId,
    String mailboxPath,
    dynamic criteria,
  ) async {
    try {
      // This would require implementing search criteria
      return const Left(Failure.notImplemented(message: 'Message search not implemented'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<model.Message>>> getMessageThread(
    String accountId,
    String messageId,
  ) async {
    try {
      // This would require implementing thread detection
      return const Left(Failure.notImplemented(message: 'Message threading not implemented'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsRead(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final sequence = MessageSequence.fromIds(uids);
      await mailClientService.client!.markSeen(sequence);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsUnread(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final sequence = MessageSequence.fromIds(uids);
      await mailClientService.client!.markUnseen(sequence);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> bulkFlag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final sequence = MessageSequence.fromIds(uids);
      await mailClientService.client!.markFlagged(sequence);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> bulkUnflag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final sequence = MessageSequence.fromIds(uids);
      await mailClientService.client!.markUnflagged(sequence);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> bulkMove(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    List<int> uids,
  ) async {
    try {
      final sequence = MessageSequence.fromIds(uids);
      final mailboxes = await mailClientService.client!.listMailboxes();
      final targetMailbox = mailboxes.firstWhere((box) => box.path == toMailboxPath);
      await mailClientService.client!.moveMessages(sequence, targetMailbox);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> bulkDelete(
    String accountId,
    String mailboxPath,
    List<int> uids, {
    bool permanent = false,
  }) async {
    try {
      final sequence = MessageSequence.fromIds(uids);
      await mailClientService.client!.deleteMessages(sequence, expunge: permanent);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }
}
