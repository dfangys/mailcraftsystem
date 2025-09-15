import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';

part 'mail_provider_preset.freezed.dart';
part 'mail_provider_preset.g.dart';

/// Mail provider preset model
@freezed
/// MailProviderPreset class
class MailProviderPreset with _$MailProviderPreset {
  const factory MailProviderPreset({
    required String id,
    required String name,
    required String displayName,
    required List<String> domains,
    required ImapConfig imapConfig,
    required SmtpConfig smtpConfig,
    String? description,
    String? logoUrl,
    @Default(false) bool requiresInsecureSSL,
    @Default(true) bool isActive,
  }) = _MailProviderPreset;

  factory MailProviderPreset.fromJson(Map<String, dynamic> json) =>
      _$MailProviderPresetFromJson(json);
}

/// Extension for mail provider preset
extension MailProviderPresetExtension on MailProviderPreset {
  /// Check if email domain matches this preset
  bool matchesDomain(String email) {
    final emailDomain = email.split('@').last.toLowerCase();
    return domains.any((domain) => domain.toLowerCase() == emailDomain);
  }
  
  /// Create mail account config from preset
  MailAccountConfig createAccountConfig({
    required String email,
    required String password,
    String? accountName,
  }) {
    return MailAccountConfig(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: accountName ?? displayName,
      email: email,
      password: password,
      imapConfig: imapConfig.copyWith(username: email),
      smtpConfig: smtpConfig.copyWith(username: email),
      allowInsecureSSL: requiresInsecureSSL,
      createdAt: DateTime.now(),
    );
  }
}

/// Built-in mail provider presets
class MailProviderPresets {
  static const List<MailProviderPreset> builtInPresets = [
    // Wahda Bank preset (from specifications)
    MailProviderPreset(
      id: 'wahda_bank',
      name: 'wahda_bank',
      displayName: 'Wahda Bank',
      domains: ['wahdabank.com.ly'],
      description: 'Wahda Bank Libya email configuration',
      imapConfig: ImapConfig(
        host: 'wbmail.wahdabank.com.ly',
        port: 43245,
        socketType: SocketType.ssl,
      ),
      smtpConfig: SmtpConfig(
        host: 'wbmail.wahdabank.com.ly',
        port: 43244,
        socketType: SocketType.plain,
        clientDomain: 'wahdabank.com.ly',
      ),
      requiresInsecureSSL: true,
    ),
    
    // Gmail preset
    MailProviderPreset(
      id: 'gmail',
      name: 'gmail',
      displayName: 'Gmail',
      domains: ['gmail.com', 'googlemail.com'],
      description: 'Google Gmail configuration',
      imapConfig: ImapConfig(
        host: 'imap.gmail.com',
        port: 993,
        socketType: SocketType.ssl,
      ),
      smtpConfig: SmtpConfig(
        host: 'smtp.gmail.com',
        port: 587,
        socketType: SocketType.starttls,
      ),
    ),
    
    // Outlook preset
    MailProviderPreset(
      id: 'outlook',
      name: 'outlook',
      displayName: 'Outlook.com',
      domains: ['outlook.com', 'hotmail.com', 'live.com'],
      description: 'Microsoft Outlook configuration',
      imapConfig: ImapConfig(
        host: 'outlook.office365.com',
        port: 993,
        socketType: SocketType.ssl,
      ),
      smtpConfig: SmtpConfig(
        host: 'smtp-mail.outlook.com',
        port: 587,
        socketType: SocketType.starttls,
      ),
    ),
    
    // Yahoo preset
    MailProviderPreset(
      id: 'yahoo',
      name: 'yahoo',
      displayName: 'Yahoo Mail',
      domains: ['yahoo.com', 'yahoo.co.uk', 'yahoo.ca'],
      description: 'Yahoo Mail configuration',
      imapConfig: ImapConfig(
        host: 'imap.mail.yahoo.com',
        port: 993,
        socketType: SocketType.ssl,
      ),
      smtpConfig: SmtpConfig(
        host: 'smtp.mail.yahoo.com',
        port: 587,
        socketType: SocketType.starttls,
      ),
    ),
  ];
  
  /// Find preset by email domain
  static MailProviderPreset? findByEmail(String email) {
    return builtInPresets.cast<MailProviderPreset?>().firstWhere(
      (preset) => preset?.matchesDomain(email) ?? false,
      orElse: () => null,
    );
  }
  
  /// Get all active presets
  static List<MailProviderPreset> getActivePresets() {
    return builtInPresets.where((preset) => preset.isActive).toList();
  }
}
