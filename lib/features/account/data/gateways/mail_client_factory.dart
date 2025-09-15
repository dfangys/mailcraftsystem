import 'dart:io';

import 'package:enough_mail/enough_mail.dart' as enough_mail;
import 'package:flutter/foundation.dart';

import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';

/// Factory for creating mail clients with proper configuration
class MailClientFactory {
  /// Create a mail client from account configuration
  static enough_mail.MailClient createClient(
    MailAccountConfig config, {
    bool enableLogging = kDebugMode,
  }) {
    final mailAccount = config.toMailAccount();
    
    return enough_mail.MailClient(
      /// mailAccount
      mailAccount,
      isLogEnabled: enableLogging,
      onBadCertificate: config.allowInsecureSSL ? _allowBadCertificate : null,
      logName: 'MailClient-${config.name}',
    );
  }
  
  /// Create a client for connection testing
  static enough_mail.MailClient createTestClient(
    MailAccountConfig config, {
    bool enableLogging = kDebugMode,
  }) {
    return createClient(
      /// config
      config,
      enableLogging: enableLogging,
    );
  }
  
  /// Test IMAP connection
  static Future<ImapConnectionResult> testImapConnection(
    MailAccountConfig config,
  ) async {
    final client = createTestClient(config);
    
    try {
      AppLogger.info('Testing IMAP connection to ${config.imapConfig.host}:${config.imapConfig.port}');
      
      await client.connect();
      
      // Get capabilities
      final imapClient = client.lowLevelIncomingMailClient as enough_mail.ImapClient;
      final capabilities = imapClient.serverInfo.capabilities;
      
      final capabilityNames = capabilities?.map((c) => c.name).toList() ?? [];
      AppLogger.info('IMAP connection successful. Capabilities: ${capabilityNames.join(', ')}');
      
      await client.disconnect();
      
      return ImapConnectionResult(
        success: true,
        capabilities: capabilityNames,
      );
    } catch (e) {
      AppLogger.error('IMAP connection failed', e);
      
      try {
        await client.disconnect();
      } catch (_) {
        // Ignore disconnect errors
      }
      
      return ImapConnectionResult(
        success: false,
        error: e.toString(),
      );
    }
  }
  
  /// Test SMTP connection
  static Future<SmtpConnectionResult> testSmtpConnection(
    MailAccountConfig config,
  ) async {
    try {
      AppLogger.info('Testing SMTP connection to ${config.smtpConfig.host}:${config.smtpConfig.port}');
      
      final smtpClient = enough_mail.SmtpClient(
        config.smtpConfig.host,
        isLogEnabled: kDebugMode,
        onBadCertificate: config.allowInsecureSSL ? _allowBadCertificate : null,
      );
      
      await smtpClient.connectToServer(
        config.smtpConfig.host,
        config.smtpConfig.port,
        isSecure: config.smtpConfig.socketType == SocketType.ssl,
      );
      
      await smtpClient.ehlo();
      
      // Test authentication
      await smtpClient.authenticate(
        config.email,
        config.password,
      );
      
      AppLogger.info('SMTP connection and authentication successful');
      
      await smtpClient.quit();
      
      return const SmtpConnectionResult(success: true);
    } catch (e) {
      AppLogger.error('SMTP connection failed', e);
      
      return SmtpConnectionResult(
        success: false,
        error: e.toString(),
      );
    }
  }
  
  /// Test full account connection (both IMAP and SMTP)
  static Future<FullConnectionResult> testFullConnection(
    MailAccountConfig config,
  ) async {
    AppLogger.info('Testing full connection for account: ${config.displayName}');
    
    final imapResult = await testImapConnection(config);
    final smtpResult = await testSmtpConnection(config);
    
    return FullConnectionResult(
      imapResult: imapResult,
      smtpResult: smtpResult,
    );
  }
  
  /// Allow bad certificates for insecure SSL
  static bool _allowBadCertificate(X509Certificate certificate) {
    AppLogger.warning(
      'Allowing bad certificate for insecure SSL connection: ${certificate.subject}',
    );
    return true;
  }
}

/// IMAP connection test result
class ImapConnectionResult {
  const ImapConnectionResult({
    required this.success,
    this.capabilities = const [],
    this.error,
  });
  
  final bool success;
  final List<String> capabilities;
  final String? error;
  
  /// Check if IDLE is supported
  bool get supportsIdle => capabilities.contains('IDLE');
  
  /// Check if MOVE is supported
  bool get supportsMove => capabilities.contains('MOVE');
  
  /// Check if SORT is supported
  bool get supportsSort => capabilities.contains('SORT');
  
  /// Check if SEARCH is supported
  bool get supportsSearch => capabilities.contains('SEARCH');
  
  /// Check if QUOTA is supported
  bool get supportsQuota => capabilities.contains('QUOTA');
  
  /// Check if UIDPLUS is supported
  bool get supportsUidPlus => capabilities.contains('UIDPLUS');
}

/// SMTP connection test result
class SmtpConnectionResult {
  const SmtpConnectionResult({
    required this.success,
    this.error,
  });
  
  final bool success;
  final String? error;
}

/// Full connection test result
class FullConnectionResult {
  const FullConnectionResult({
    required this.imapResult,
    required this.smtpResult,
  });
  
  final ImapConnectionResult imapResult;
  final SmtpConnectionResult smtpResult;
  
  /// Check if both connections are successful
  bool get isFullyConnected => imapResult.success && smtpResult.success;
  
  /// Get connection status summary
  String get statusSummary {
    if (isFullyConnected) return 'All connections successful';
    if (imapResult.success && !smtpResult.success) return 'IMAP connected, SMTP failed';
    if (!imapResult.success && smtpResult.success) return 'SMTP connected, IMAP failed';
    return 'All connections failed';
  }
  
  /// Get error messages
  List<String> get errorMessages {
    final errors = <String>[];
    if (imapResult.error != null) errors.add('IMAP: ${imapResult.error}');
    if (smtpResult.error != null) errors.add('SMTP: ${smtpResult.error}');
    return errors;
  }
}
