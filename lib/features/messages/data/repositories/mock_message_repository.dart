import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message.dart';
import 'package:mailcraftsystem/features/messages/domain/models/message_content.dart';
import 'package:mailcraftsystem/features/messages/domain/repositories/message_repository.dart';

class MockMessageRepository implements MessageRepository {
  @override
  Future<Either<Failure, List<Message>>> getMessages(String accountId, String mailboxPath, {int? limit, int? offset, dynamic sortOrder}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(List.generate(limit ?? 20, (index) => Message(id: '$index', uid: index, mailboxPath: mailboxPath, subject: 'Mock Email $index')));
  }

  @override
  Future<Either<Failure, Message>> getMessage(String accountId, String mailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(Message(id: '$uid', uid: uid, mailboxPath: mailboxPath, subject: 'Mock Email $uid'));
  }

  @override
  Future<Either<Failure, MessageContent>> getMessageContent(String accountId, String mailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(MessageContent(textPlain: 'This is a mock email body.'));
  }

  @override
  Future<Either<Failure, void>> markAsRead(String accountId, String mailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> markAsUnread(String accountId, String mailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> flagMessage(String accountId, String mailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> unflagMessage(String accountId, String mailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> moveMessage(String accountId, String fromMailboxPath, String toMailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> copyMessage(String accountId, String fromMailboxPath, String toMailboxPath, int uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteMessage(String accountId, String mailboxPath, int uid, {bool permanent = false}) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, String>> downloadAttachment(String accountId, String mailboxPath, int uid, String attachmentId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right('mock_attachment.zip');
  }

  @override
  Future<Either<Failure, List<Message>>> searchMessages(String accountId, String mailboxPath, dynamic criteria) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<Message>>> getMessageThread(String accountId, String messageId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right([]);
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsRead(String accountId, String mailboxPath, List<int> uids) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsUnread(String accountId, String mailboxPath, List<int> uids) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> bulkFlag(String accountId, String mailboxPath, List<int> uids) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> bulkUnflag(String accountId, String mailboxPath, List<int> uids) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> bulkMove(String accountId, String fromMailboxPath, String toMailboxPath, List<int> uids) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> bulkDelete(String accountId, String mailboxPath, List<int> uids, {bool permanent = false}) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }
}

