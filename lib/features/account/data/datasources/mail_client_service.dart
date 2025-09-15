import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/foundation.dart';

class MailClientService {
  MailClient? _client;
  MailAccount? _account;
  bool _isConnected = false;

  MailClient? get client => _client;
  MailAccount? get account => _account;
  bool get isConnected => _isConnected;

  Future<bool> initializeAndConnect(String email, String password) async {
    try {
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
  }
}
