import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/foundation.dart';

class MailClientService {
  MailClient? client;
  MailAccount? account;

  bool setClientAndAccount(String email, String password) {
    account = MailAccount.fromManualSettings(
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
    client = MailClient(
      account!,
      isLogEnabled: kDebugMode,
      onBadCertificate: (x509Certificate) {
        return true;
      },
    );
    return true;
  }
}

