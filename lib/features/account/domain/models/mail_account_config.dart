import 'package:enough_mail/enough_mail.dart' as enough_mail;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_account_config.freezed.dart';
part 'mail_account_config.g.dart';

/// Mail account configuration model
@freezed

/// MailAccountConfig class
class MailAccountConfig with _$MailAccountConfig {
  const factory MailAccountConfig({
    required String id,
    required String name,
    required String email,
    required String password,
    required ImapConfig imapConfig,
    required SmtpConfig smtpConfig,
    @Default(false) bool allowInsecureSSL,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MailAccountConfig;

  factory MailAccountConfig.fromJson(Map<String, dynamic> json) =>
      _$MailAccountConfigFromJson(json);
}

/// IMAP configuration
@freezed

/// ImapConfig class
class ImapConfig with _$ImapConfig {
  const factory ImapConfig({
    required String host,
    required int port,
    required SocketType socketType,
    String? username,
    @Default(true) bool isSecure,
  }) = _ImapConfig;

  factory ImapConfig.fromJson(Map<String, dynamic> json) =>
      _$ImapConfigFromJson(json);
}

/// SMTP configuration
@freezed

/// SmtpConfig class
class SmtpConfig with _$SmtpConfig {
  const factory SmtpConfig({
    required String host,
    required int port,
    required SocketType socketType,
    String? username,
    String? clientDomain,
    @Default(true) bool isSecure,
  }) = _SmtpConfig;

  factory SmtpConfig.fromJson(Map<String, dynamic> json) =>
      _$SmtpConfigFromJson(json);
}

/// Socket type enum
enum SocketType {
  @JsonValue('plain')

  /// plain
  plain,
  @JsonValue('ssl')

  /// ssl
  ssl,
  @JsonValue('starttls')

  /// starttls
  starttls,
}

/// Extension for socket type conversion
extension LocalSocketTypeExtension on SocketType {
  /// Convert to enough_mail SocketType
  enough_mail.SocketType get enoughMailSocketType {
    switch (this) {
      case SocketType.plain:
        return enough_mail.SocketType.plain;
      case SocketType.ssl:
        return enough_mail.SocketType.ssl;
      case SocketType.starttls:
        return enough_mail.SocketType.starttls;
    }
  }

  /// Get display name
  String get displayName {
    switch (this) {
      case SocketType.plain:
        return 'Plain (No encryption)';
      case SocketType.ssl:
        return 'SSL/TLS';
      case SocketType.starttls:
        return 'STARTTLS';
    }
  }
}

/// Extension for mail account configuration
extension MailAccountConfigExtension on MailAccountConfig {
  /// Convert to enough_mail MailAccount
  enough_mail.MailAccount toMailAccount() {
    return enough_mail.MailAccount.fromManualSettings(
      name: name,
      email: email,
      incomingHost: imapConfig.host,
      outgoingHost: smtpConfig.host,
      password: password,
      incomingPort: imapConfig.port,
      outgoingPort: smtpConfig.port,
      incomingSocketType: imapConfig.socketType.enoughMailSocketType,
      outgoingSocketType: smtpConfig.socketType.enoughMailSocketType,
      userName: imapConfig.username ?? email,
      outgoingClientDomain: smtpConfig.clientDomain ?? 'localhost',
    );
  }

  /// Get account display name
  String get displayName => '$name ($email)';

  /// Check if account has insecure configuration
  bool get hasInsecureConfig {
    return allowInsecureSSL ||
        imapConfig.socketType == SocketType.plain ||
        smtpConfig.socketType == SocketType.plain;
  }
}
