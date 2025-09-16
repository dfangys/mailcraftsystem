import 'package:flutter_test/flutter_test.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_provider_preset.dart';
import 'package:mailcraftsystem/features/account/data/datasources/mail_client_service.dart';

void main() {
  group('MailProviderPresets.findByEmail', () {
    test('detects Gmail domains', () {
      expect(MailProviderPresets.findByEmail('user@gmail.com')?.name, 'gmail');
      expect(MailProviderPresets.findByEmail('user@googlemail.com')?.name, 'gmail');
    });

    test('detects Outlook domains', () {
      expect(MailProviderPresets.findByEmail('user@outlook.com')?.name, 'outlook');
      expect(MailProviderPresets.findByEmail('user@hotmail.com')?.name, 'outlook');
      expect(MailProviderPresets.findByEmail('user@live.com')?.name, 'outlook');
    });

    test('detects Yahoo domains', () {
      expect(MailProviderPresets.findByEmail('user@yahoo.com')?.name, 'yahoo');
    });

    test('detects Wahda Bank domain', () {
      expect(MailProviderPresets.findByEmail('user@wahdabank.com.ly')?.name, 'wahda_bank');
    });

    test('returns null for unknown domains', () {
      expect(MailProviderPresets.findByEmail('user@example.com'), isNull);
    });
  });

  group('MailClientService certificate helpers', () {
    test('parseCn extracts CN from subject', () {
      const subject = 'CN=imap.example.com, OU=Ops, O=Example Inc, C=US';
      expect(MailClientService.parseCn(subject), 'imap.example.com');
    });

    test('hostMatchesSubject matches exact CN', () {
      const subject = 'CN=imap.example.com, OU=Ops';
      expect(MailClientService.hostMatchesSubject('imap.example.com', subject), isTrue);
      expect(MailClientService.hostMatchesSubject('smtp.example.com', subject), isFalse);
    });

    test('hostMatchesSubject supports wildcard CN', () {
      const subject = 'CN=*.example.com, OU=Ops';
      expect(MailClientService.hostMatchesSubject('imap.example.com', subject), isTrue);
      expect(MailClientService.hostMatchesSubject('example.com', subject), isFalse);
    });

    test('hostMatchesSubject falls back to subject contains host', () {
      const subject = 'O=Example Inc; Subject Alt: mail.internal.example.com';
      expect(MailClientService.hostMatchesSubject('mail.internal.example.com', subject), isTrue);
    });
  });
}
