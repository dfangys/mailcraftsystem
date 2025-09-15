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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages(
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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      final fullMessage = await client.fetchMessageContents(message);
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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      final fullMessage = await client.fetchMessageContents(message);
      
      return Right(MessageContent(
        textPlain: fullMessage.decodeTextPlainPart() ?? '',
        textHtml: fullMessage.decodeTextHtmlPart() ?? '',
        attachments: [],
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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      await client.markSeen(MessageSequence.fromMessage(message));
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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      await client.markUnseen(MessageSequence.fromMessage(message));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsFlagged(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      await client.markFlagged(MessageSequence.fromMessage(message));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsUnflagged(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      await client.markUnflagged(MessageSequence.fromMessage(message));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      await client.markDeleted(MessageSequence.fromMessage(message));
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
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final mailboxes = await client.listMailboxes();
      final toMailbox = mailboxes.firstWhere((box) => box.path == toMailboxPath);
      final messages = await client.fetchMessages();
      final message = messages.firstWhere((m) => m.uid == uid);
      
      await client.moveMessages(MessageSequence.fromMessage(message), toMailbox);
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
    return const Left(Failure.notImplemented(message: 'Copy message not implemented'));
  }

  @override
  Future<Either<Failure, List<model.Message>>> searchMessages(
    String accountId,
    String mailboxPath,
    dynamic criteria,
  ) async {
    return const Left(Failure.notImplemented(message: 'Search messages not implemented'));
  }

  @override
  Future<Either<Failure, void>> markMultipleAsRead(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      await client.markSeen(MessageSequence.fromIds(uids));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markMultipleAsUnread(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      await client.markUnseen(MessageSequence.fromIds(uids));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMultipleMessages(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      await client.markDeleted(MessageSequence.fromIds(uids));
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> moveMultipleMessages(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = mailClientService.client;
      if (client == null) {
        return const Left(Failure.auth(message: 'Mail client not initialized. Please login first.'));
      }
      
      final mailboxes = await client.listMailboxes();
      final toMailbox = mailboxes.firstWhere((box) => box.path == toMailboxPath);
      
      await client.moveMessages(MessageSequence.fromIds(uids), toMailbox);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: 'An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> archiveMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    return const Left(Failure.notImplemented(message: 'Archive message not implemented'));
  }

  @override
  Future<Either<Failure, void>> unarchiveMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    return const Left(Failure.notImplemented(message: 'Unarchive message not implemented'));
  }

  @override
  Future<Either<Failure, void>> spamMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    return const Left(Failure.notImplemented(message: 'Spam message not implemented'));
  }

  @override
  Future<Either<Failure, void>> unspamMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    return const Left(Failure.notImplemented(message: 'Unspam message not implemented'));
  }

  @override
  Future<Either<Failure, void>> flagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    return markAsFlagged(accountId, mailboxPath, uid);
  }

  @override
  Future<Either<Failure, void>> unflagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    return markAsUnflagged(accountId, mailboxPath, uid);
  }

  @override
  Future<Either<Failure, String>> downloadAttachment(
    String accountId,
    String mailboxPath,
    int uid,
    String attachmentId,
  ) async {
    return const Left(Failure.notImplemented(message: 'Download attachment not implemented'));
  }

  @override
  Future<Either<Failure, List<model.Message>>> getMessageThread(
    String accountId,
    String messageId,
  ) async {
    return const Left(Failure.notImplemented(message: 'Get message thread not implemented'));
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsRead(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    return markMultipleAsRead(accountId, mailboxPath, uids);
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsUnread(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    return markMultipleAsUnread(accountId, mailboxPath, uids);
  }

  @override
  Future<Either<Failure, void>> bulkFlag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    return const Left(Failure.notImplemented(message: 'Bulk flag not implemented'));
  }

  @override
  Future<Either<Failure, void>> bulkUnflag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    return const Left(Failure.notImplemented(message: 'Bulk unflag not implemented'));
  }

  @override
  Future<Either<Failure, void>> bulkMove(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    List<int> uids,
  ) async {
    return moveMultipleMessages(accountId, fromMailboxPath, toMailboxPath, uids);
  }

  @override
  Future<Either<Failure, void>> bulkDelete(
    String accountId,
    String mailboxPath,
    List<int> uids, {
    bool permanent = false,
  }) async {
    return deleteMultipleMessages(accountId, mailboxPath, uids);
  }
}
