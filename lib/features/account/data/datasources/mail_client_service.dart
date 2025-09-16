import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/foundation.dart';

class MailClientService {
  MailClient? _client;
  MailAccount? _account;
  bool _isConnected = false;
  bool _isClientSet = false;

  // Lightweight caches
  List<Mailbox>? _cachedMailboxes;
  DateTime? _mailboxesCachedAt;
  final Duration _mailboxesTtl = const Duration(minutes: 5);

  MailClient? get client => _client;
  MailAccount? get account => _account;
  bool get isConnected => _isConnected;
  bool get isClientSet => _isClientSet;

  /// Configure the account and client using fixed IMAP/SMTP credentials.
  /// Returns true if the client was set.
  bool setClientAndAccount(String email, String password) {
    _account = MailAccount.fromManualSettings(
      name: email,
      email: email,
      incomingHost: 'wbmail.wahdabank.com.ly',
      outgoingHost: 'wbmail.wahdabank.com.ly',
      password: password,
      incomingType: ServerType.imap,
      outgoingType: ServerType.smtp,
      incomingPort: 43245,
      outgoingPort: 43244,
      incomingSocketType: SocketType.ssl,
      outgoingSocketType: SocketType.plain,
      userName: email,
      outgoingClientDomain: 'wahdabank.com.ly',
    );

    _client = MailClient(
      _account!,
      isLogEnabled: kDebugMode,
      onBadCertificate: (x509Certificate) {
        return true;
      },
    );

    _isClientSet = true;
    return _isClientSet;
  }

  Future<bool> initializeAndConnect(String email, String password) async {
    try {
      if (!setClientAndAccount(email, password)) {
        throw Exception('Failed to set client and account');
      }

      // Connect to the mail server
      await _client!.connect();
      _isConnected = true;

      if (kDebugMode) {
        print('Mail client connected successfully for $email');
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to connect mail client: $e');
      }
      _isConnected = false;
      return false;
    }
  }

  Future<bool> ensureConnected() async {
    if (_client == null) return false;
    if (_isConnected) return true;
    try {
      await _client!.connect();
      _isConnected = true;
      return true;
    } catch (_) {
      _isConnected = false;
      return false;
    }
  }

  Future<List<Mailbox>> listMailboxesCached() async {
    if (_client == null) {
      throw StateError('Mail client not initialized');
    }
    final now = DateTime.now();
    if (_cachedMailboxes != null &&
        _mailboxesCachedAt != null &&
        now.difference(_mailboxesCachedAt!) < _mailboxesTtl) {
      return _cachedMailboxes!;
    }
    final list = await _client!.listMailboxes();
    _cachedMailboxes = list;
    _mailboxesCachedAt = now;
    return list;
  }

  void invalidateMailboxesCache() {
    _cachedMailboxes = null;
    _mailboxesCachedAt = null;
  }

  Future<void> disconnect() async {
    try {
      if (_client != null && _isConnected) {
        await _client!.disconnect();
        _isConnected = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error disconnecting mail client: $e');
      }
    }
  }

  void reset() {
    _client = null;
    _account = null;
    _isConnected = false;
    _isClientSet = false;
  }
}
