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

  // In-memory cache per mailbox path
  final Map<String, List<MimeMessage>> _messagesCache = {};
  final Map<String, DateTime> _cacheTime = {};
  final Duration _ttl = const Duration(minutes: 2);

  Future<MailClient> _requireClient() async {
    final client = mailClientService.client;
    if (client == null) {
      throw StateError('Mail client not initialized. Please login first.');
    }
    return client;
  }

  Future<Mailbox> _ensureSelected(String mailboxPath) async {
    final client = await _requireClient();
    final mailboxes = await client.listMailboxes();
    Mailbox target;
    try {
      target = mailboxes.firstWhere((m) => m.path == mailboxPath);
    } catch (_) {
      try {
        target = mailboxes.firstWhere(
          (m) => m.path.toUpperCase().contains('INBOX'),
        );
      } catch (_) {
        if (mailboxes.isEmpty) {
          throw StateError('No mailboxes available');
        }
        target = mailboxes.first;
      }
    }
    await client.selectMailbox(target);
    return target;
  }

  @override
  Future<Either<Failure, List<model.Message>>> getMessages(
    String accountId,
    String mailboxPath, {
    int? limit,
    int? offset,
    dynamic sortOrder,
  }) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final count = limit ?? 20;
      final page = (offset ?? 0) ~/ count + 1;
      final messages = await client.fetchMessages(count: count, page: page);

      // Cache the most recent page for quick subsequent lookups
      _messagesCache[mailboxPath] = messages;
      _cacheTime[mailboxPath] = DateTime.now();

      final mapped = messages.map(model.Message.fromEnoughMail).toList();
      return Right(mapped);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, model.Message>> getMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final msg = await _getMessageByUid(mailboxPath, uid, client);
      final full = await client.fetchMessageContents(msg);
      return Right(model.Message.fromEnoughMail(full));
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageContent>> getMessageContent(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      // Robustly locate the message by UID using cache + fallback fetch
      final message = await _getMessageByUid(mailboxPath, uid, client);
      final full = await client.fetchMessageContents(message);
      return Right(
        MessageContent(
          textPlain: full.decodeTextPlainPart() ?? '',
          textHtml: full.decodeTextHtmlPart() ?? '',
          attachments: [],
        ),
      );
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final message = await _getMessageByUid(mailboxPath, uid, client);
      await client.markSeen(MessageSequence.fromMessage(message));
      _updateCachedFlags(mailboxPath, uid, seen: true);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsUnread(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final message = await _getMessageByUid(mailboxPath, uid, client);
      await client.markUnseen(MessageSequence.fromMessage(message));
      _updateCachedFlags(mailboxPath, uid, seen: false);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsFlagged(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final message = await _getMessageByUid(mailboxPath, uid, client);
      await client.markFlagged(MessageSequence.fromMessage(message));
      _updateCachedFlags(mailboxPath, uid, flagged: true);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsUnflagged(
    String accountId,
    String mailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final message = await _getMessageByUid(mailboxPath, uid, client);
      await client.markUnflagged(MessageSequence.fromMessage(message));
      _updateCachedFlags(mailboxPath, uid, flagged: false);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  // Interface-required aliases
  @override
  Future<Either<Failure, void>> flagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) => markAsFlagged(accountId, mailboxPath, uid);

  @override
  Future<Either<Failure, void>> unflagMessage(
    String accountId,
    String mailboxPath,
    int uid,
  ) => markAsUnflagged(accountId, mailboxPath, uid);

  @override
  Future<Either<Failure, void>> moveMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(fromMailboxPath);

      final mailboxes = await client.listMailboxes();
      final toMailbox = mailboxes.firstWhere(
        (box) => box.path == toMailboxPath,
        orElse: () => mailboxes.first,
      );

      final message = await _getMessageByUid(fromMailboxPath, uid, client);
      await client.moveMessages(
        MessageSequence.fromMessage(message),
        toMailbox,
      );
      _removeFromCache(fromMailboxPath, uid);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> copyMessage(
    String accountId,
    String fromMailboxPath,
    String toMailboxPath,
    int uid,
  ) async {
    return const Left(
      Failure.notImplemented(message: 'Copy message not implemented'),
    );
  }

  @override
  Future<Either<Failure, void>> deleteMessage(
    String accountId,
    String mailboxPath,
    int uid, {
    bool permanent = false,
  }) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);

      final message = await _getMessageByUid(mailboxPath, uid, client);

      await client.markDeleted(MessageSequence.fromMessage(message));
      if (permanent) {
        final lowLevel = client.lowLevelIncomingMailClient;
        if (lowLevel is ImapClient) {
          await lowLevel.expunge();
        }
      }
      _removeFromCache(mailboxPath, uid);
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadAttachment(
    String accountId,
    String mailboxPath,
    int uid,
    String attachmentId,
  ) async {
    return const Left(
      Failure.notImplemented(message: 'Download attachment not implemented'),
    );
  }

  @override
  Future<Either<Failure, List<model.Message>>> searchMessages(
    String accountId,
    String mailboxPath,
    dynamic criteria,
  ) async {
    return const Left(
      Failure.notImplemented(message: 'Search messages not implemented'),
    );
  }

  @override
  Future<Either<Failure, List<model.Message>>> getMessageThread(
    String accountId,
    String messageId,
  ) async {
    return const Left(
      Failure.notImplemented(message: 'Get message thread not implemented'),
    );
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsRead(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);
      for (final uid in uids) {
        final message = await _getMessageByUid(mailboxPath, uid, client);
        await client.markSeen(MessageSequence.fromMessage(message));
        _updateCachedFlags(mailboxPath, uid, seen: true);
      }
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsUnread(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);
      for (final uid in uids) {
        final message = await _getMessageByUid(mailboxPath, uid, client);
        await client.markUnseen(MessageSequence.fromMessage(message));
        _updateCachedFlags(mailboxPath, uid, seen: false);
      }
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bulkFlag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);
      for (final uid in uids) {
        final message = await _getMessageByUid(mailboxPath, uid, client);
        await client.markFlagged(MessageSequence.fromMessage(message));
        _updateCachedFlags(mailboxPath, uid, flagged: true);
      }
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bulkUnflag(
    String accountId,
    String mailboxPath,
    List<int> uids,
  ) async {
    try {
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);
      for (final uid in uids) {
        final message = await _getMessageByUid(mailboxPath, uid, client);
        await client.markUnflagged(MessageSequence.fromMessage(message));
        _updateCachedFlags(mailboxPath, uid, flagged: false);
      }
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
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
      final client = await _requireClient();
      await _ensureSelected(fromMailboxPath);
      final mailboxes = await client.listMailboxes();
      final toMailbox = mailboxes.firstWhere(
        (box) => box.path == toMailboxPath,
        orElse: () => mailboxes.first,
      );
      for (final uid in uids) {
        final message = await _getMessageByUid(fromMailboxPath, uid, client);
        await client.moveMessages(
          MessageSequence.fromMessage(message),
          toMailbox,
        );
        _removeFromCache(fromMailboxPath, uid);
      }
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
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
      final client = await _requireClient();
      await _ensureSelected(mailboxPath);
      for (final uid in uids) {
        final message = await _getMessageByUid(mailboxPath, uid, client);
        await client.markDeleted(MessageSequence.fromMessage(message));
        _removeFromCache(mailboxPath, uid);
      }
      if (permanent) {
        final lowLevel = client.lowLevelIncomingMailClient;
        if (lowLevel is ImapClient) {
          await lowLevel.expunge();
        }
      }
      return const Right(null);
    } on MailException catch (e) {
      return Left(Failure.server(message: e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
  Future<MimeMessage> _getMessageByUid(
    String mailboxPath,
    int uid,
    MailClient client,
  ) async {
    final now = DateTime.now();
    final cached = _messagesCache[mailboxPath];
    final ts = _cacheTime[mailboxPath];
    if (cached != null && ts != null && now.difference(ts) < _ttl) {
      try {
        return cached.firstWhere((m) => m.uid == uid);
      } catch (_) {
        // Fallback to minimal fetch
      }
    }

    // Fetch a small page (up to 50) to locate the message
    final fetched = await client.fetchMessages(count: 50);
    _messagesCache[mailboxPath] = fetched;
    _cacheTime[mailboxPath] = now;
    return fetched.firstWhere((m) => m.uid == uid);
  }

  void _updateCachedFlags(
    String mailboxPath,
    int uid, {
    bool? seen,
    bool? flagged,
  }) {
    final list = _messagesCache[mailboxPath];
    if (list == null) return;
    for (var i = 0; i < list.length; i++) {
      final m = list[i];
      if (m.uid == uid) {
        // enough_mail MimeMessage has flags; but to keep simple, we no-op or refresh cache later
        break;
      }
    }
  }

  void _removeFromCache(String mailboxPath, int uid) {
    final list = _messagesCache[mailboxPath];
    if (list == null) return;
    list.removeWhere((m) => m.uid == uid);
  }
}
