import 'dart:io' show X509Certificate;

import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/foundation.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart'
    as acct;
import 'package:mailcraftsystem/features/account/domain/models/mail_provider_preset.dart';

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

  /// Configure the account and client using dynamic configuration derived from email/password.
  /// This finds a provider preset by domain when possible; otherwise attempts a sensible fallback.
  /// Returns true if the client was set.
  bool setClientAndAccount(String email, String password) {
    // Try preset by domain
    final preset = MailProviderPresets.findByEmail(email);
    acct.MailAccountConfig config;
    if (preset != null) {
      config = preset.createAccountConfig(email: email, password: password);
    } else {
      // Fallback heuristic: typical IMAP/SMTP hosts for the domain
      final domain = email.split('@').last;
      config = acct.MailAccountConfig(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: email,
        email: email,
        password: password,
        imapConfig: acct.ImapConfig(
          host: 'imap.$domain',
          port: 993,
          socketType: acct.SocketType.ssl, // local model SocketType
          username: email,
        ),
        smtpConfig: acct.SmtpConfig(
          host: 'smtp.$domain',
          port: 587,
          socketType: acct.SocketType.starttls, // local model SocketType
          username: email,
          clientDomain: domain,
        ),
        allowInsecureSSL: false,
      );
    }
    return setClientAndAccountFromConfig(config);
  }

  /// Configure the account and client using an explicit MailAccountConfig
  /// Returns true if the client was set.
  bool setClientAndAccountFromConfig(acct.MailAccountConfig config) {
    _account = config.toMailAccount();
    _client = MailClient(
      _account!,
      isLogEnabled: kDebugMode,
      onBadCertificate: (X509Certificate cert) {
        return _validateCertificate(cert, config);
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

  /// Initialize the client from an explicit configuration and connect.
  Future<bool> initializeAndConnectWithConfig(acct.MailAccountConfig config) async {
    try {
      if (!setClientAndAccountFromConfig(config)) {
        throw Exception('Failed to set client and account from config');
      }
      await _client!.connect();
      _isConnected = true;
      if (kDebugMode) {
        print('Mail client connected successfully for ${config.email}');
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

  // Exposed for testing: extract CN from a certificate subject string
  @visibleForTesting
  static String? parseCn(String subject) {
    final lower = subject.toLowerCase();
    final cnIndex = lower.indexOf('cn=');
    if (cnIndex == -1) return null;
    final after = subject.substring(cnIndex + 3);
    final commaIndex = after.indexOf(',');
    final cn = (commaIndex == -1 ? after : after.substring(0, commaIndex)).trim();
    return cn.toLowerCase();
  }

  // Exposed for testing: match host against CN/subject with wildcard support
  @visibleForTesting
  static bool hostMatchesSubject(String host, String subject) {
    final cn = parseCn(subject);
    final h = host.toLowerCase();

    if (cn != null) {
      final c = cn.toLowerCase();
      // Exact match
      if (c == h) return true;

      // Wildcard match: only a single label may be matched (e.g. *.example.com matches imap.example.com)
      if (c.startsWith('*.')) {
        final base = c.substring(2); // e.g. example.com
        // Do not match the apex domain itself
        if (h == base) return false;
        // Must end with ".base"
        if (h.endsWith('.' + base)) {
          // Ensure single-label before base: no additional dots in the prefix
          final prefix = h.substring(0, h.length - base.length - 1);
          if (!prefix.contains('.')) {
            return true;
          }
        }
        return false;
      }

      // CN exists but didn't match
      return false;
    }

    // No CN parsed: fall back to subject containing the host (to cover SubjectAltName in string form)
    final lower = subject.toLowerCase();
    if (lower.contains(h)) return true;
    return false;
  }

  bool _validateCertificate(X509Certificate cert, acct.MailAccountConfig config) {
    // If explicitly allowed, accept invalid/self-signed certificates
    if (config.allowInsecureSSL) {
      if (kDebugMode) {
        print('Warning: accepting invalid certificate for ${config.email} due to allowInsecureSSL');
      }
      return true;
    }

    // Hostname/CN matching
    final subject = cert.subject; // e.g. 'CN=imap.example.com, OU=...'
    final host = config.imapConfig.host;
    final ok = hostMatchesSubject(host, subject);
    if (!ok && kDebugMode) {
      print('Certificate validation failed for host $host; subject: $subject');
    }
    return ok;
  }
}
