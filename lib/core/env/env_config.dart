import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment configuration utility
class EnvConfig {
  /// API base URL
  static String get apiBase => dotenv.env['API_BASE'] ?? 'https://chase.com.ly';
  
  /// IMAP host
  static String get imapHost => dotenv.env['IMAP_HOST'] ?? 'wbmail.wahdabank.com.ly';
  
  /// IMAP port
  static int get imapPort => int.tryParse(dotenv.env['IMAP_PORT'] ?? '43245') ?? 43245;
  
  /// IMAP socket type
  static String get imapSocket => dotenv.env['IMAP_SOCKET'] ?? 'ssl';
  
  /// SMTP host
  static String get smtpHost => dotenv.env['SMTP_HOST'] ?? 'wbmail.wahdabank.com.ly';
  
  /// SMTP port
  static int get smtpPort => int.tryParse(dotenv.env['SMTP_PORT'] ?? '43244') ?? 43244;
  
  /// SMTP socket type
  static String get smtpSocket => dotenv.env['SMTP_SOCKET'] ?? 'plain';
  
  /// Allow insecure SSL
  static bool get allowInsecureSSL => 
      dotenv.env['ALLOW_INSECURE_SSL']?.toLowerCase() == 'true';
}
