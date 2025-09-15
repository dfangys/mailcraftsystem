import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import 'package:mailcraftsystem/core/logging/logger.dart';

/// Enterprise-grade encryption service for sensitive data
class EncryptionService {
  static const String _keyPrefix = 'mailcraft_';
  static const int _keyLength = 32; // 256-bit key
  static const int _ivLength = 16; // 128-bit IV
  
  late final Encrypter _encrypter;
  late final Key _key;
  
  EncryptionService._();
  
  static EncryptionService? _instance;
  
  /// Get singleton instance
  static EncryptionService get instance {
    _instance ??= EncryptionService._();
    return _instance!;
  }
  
  /// Initialize encryption service with master key
  Future<void> initialize(String masterPassword) async {
    try {
      // Derive key from master password using PBKDF2
      final salt = utf8.encode('${_keyPrefix}salt');
      final pbkdf2 = Pbkdf2(
        macAlgorithm: Hmac.sha256(),
        iterations: 100000, // OWASP recommended minimum
        bits: _keyLength * 8,
      );
      
      final keyBytes = await pbkdf2.deriveKey(
        secretKey: SecretKey(utf8.encode(masterPassword)),
        nonce: salt,
      );
      
      _key = Key(Uint8List.fromList(await keyBytes.extractBytes()));
      _encrypter = Encrypter(AES(_key));
      
      AppLogger.info('Encryption service initialized successfully');
    } catch (e) {
      AppLogger.error('Failed to initialize encryption service', e);
      rethrow;
    }
  }
  
  /// Encrypt sensitive data
  String encrypt(String plaintext) {
    try {
      final iv = IV.fromSecureRandom(_ivLength);
      final encrypted = _encrypter.encrypt(plaintext, iv: iv);
      
      // Combine IV and encrypted data
      final combined = Uint8List(_ivLength + encrypted.bytes.length);
      combined.setRange(0, _ivLength, iv.bytes);
      combined.setRange(_ivLength, combined.length, encrypted.bytes);
      
      return base64.encode(combined);
    } catch (e) {
      AppLogger.error('Encryption failed', e);
      throw EncryptionException('Failed to encrypt data');
    }
  }
  
  /// Decrypt sensitive data
  String decrypt(String encryptedData) {
    try {
      final combined = base64.decode(encryptedData);
      
      if (combined.length < _ivLength) {
        throw EncryptionException('Invalid encrypted data format');
      }
      
      final iv = IV(combined.sublist(0, _ivLength));
      final encryptedBytes = combined.sublist(_ivLength);
      
      final encrypted = Encrypted(encryptedBytes);
      return _encrypter.decrypt(encrypted, iv: iv);
    } catch (e) {
      AppLogger.error('Decryption failed', e);
      throw EncryptionException('Failed to decrypt data');
    }
  }
  
  /// Generate secure random password
  String generateSecurePassword({
    int length = 16,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
  }) {
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    
    String chars = '';
    if (includeUppercase) chars += uppercase;
    if (includeLowercase) chars += lowercase;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;
    
    if (chars.isEmpty) {
      throw ArgumentError('At least one character type must be included');
    }
    
    final random = Random.secure();
    final password = List.generate(
      length,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
    
    return password;
  }
  
  /// Hash password with salt
  String hashPassword(String password, String salt) {
    final bytes = utf8.encode(password + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  /// Generate secure salt
  String generateSalt({int length = 32}) {
    final random = Random.secure();
    final bytes = List.generate(length, (i) => random.nextInt(256));
    return base64.encode(bytes);
  }
  
  /// Verify password against hash
  bool verifyPassword(String password, String hash, String salt) {
    final computedHash = hashPassword(password, salt);
    return computedHash == hash;
  }
  
  /// Generate HMAC for data integrity
  String generateHmac(String data, String secret) {
    final key = utf8.encode(secret);
    final bytes = utf8.encode(data);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }
  
  /// Verify HMAC
  bool verifyHmac(String data, String hmac, String secret) {
    final computedHmac = generateHmac(data, secret);
    return computedHmac == hmac;
  }
  
  /// Secure data wipe (overwrite memory)
  void secureWipe(Uint8List data) {
    final random = Random.secure();
    for (int i = 0; i < data.length; i++) {
      data[i] = random.nextInt(256);
    }
  }
  
  /// Check password strength
  PasswordStrength checkPasswordStrength(String password) {
    int score = 0;
    final checks = <String>[];
    
    // Length check
    if (password.length >= 8) {
      score += 1;
      checks.add('Minimum length');
    }
    if (password.length >= 12) {
      score += 1;
      checks.add('Good length');
    }
    
    // Character variety checks
    if (RegExp(r'[a-z]').hasMatch(password)) {
      score += 1;
      checks.add('Lowercase letters');
    }
    if (RegExp(r'[A-Z]').hasMatch(password)) {
      score += 1;
      checks.add('Uppercase letters');
    }
    if (RegExp(r'[0-9]').hasMatch(password)) {
      score += 1;
      checks.add('Numbers');
    }
    if (RegExp(r'[!@#\$%^&*()_+\-=\[\]{}|;:,.<>?]').hasMatch(password)) {
      score += 1;
      checks.add('Special characters');
    }
    
    // Common patterns check
    if (!_hasCommonPatterns(password)) {
      score += 1;
      checks.add('No common patterns');
    }
    
    PasswordStrengthLevel level;
    if (score < 3) {
      level = PasswordStrengthLevel.weak;
    } else if (score < 5) {
      level = PasswordStrengthLevel.medium;
    } else if (score < 7) {
      level = PasswordStrengthLevel.strong;
    } else {
      level = PasswordStrengthLevel.veryStrong;
    }
    
    return PasswordStrength(
      level: level,
      score: score,
      maxScore: 7,
      checks: checks,
    );
  }
  
  /// Check for common password patterns
  bool _hasCommonPatterns(String password) {
    final commonPatterns = [
      RegExp(r'123'),
      RegExp(r'abc', caseSensitive: false),
      RegExp(r'password', caseSensitive: false),
      RegExp(r'qwerty', caseSensitive: false),
      RegExp(r'(.)\1{2,}'), // Repeated characters
    ];
    
    return commonPatterns.any((pattern) => pattern.hasMatch(password));
  }
}

/// Password strength result
class PasswordStrength {
  const PasswordStrength({
    required this.level,
    required this.score,
    required this.maxScore,
    required this.checks,
  });
  
  final PasswordStrengthLevel level;
  final int score;
  final int maxScore;
  final List<String> checks;
  
  /// Get strength percentage
  double get percentage => (score / maxScore) * 100;
  
  /// Get strength description
  String get description => level.description;
  
  /// Get strength color
  String get color => level.color;
}

/// Password strength levels
enum PasswordStrengthLevel {
  weak,
  medium,
  strong,
  veryStrong,
}

/// Extension for password strength level
extension PasswordStrengthLevelExtension on PasswordStrengthLevel {
  /// Get description
  String get description {
    switch (this) {
      case PasswordStrengthLevel.weak:
        return 'Weak';
      case PasswordStrengthLevel.medium:
        return 'Medium';
      case PasswordStrengthLevel.strong:
        return 'Strong';
      case PasswordStrengthLevel.veryStrong:
        return 'Very Strong';
    }
  }
  
  /// Get color representation
  String get color {
    switch (this) {
      case PasswordStrengthLevel.weak:
        return 'red';
      case PasswordStrengthLevel.medium:
        return 'orange';
      case PasswordStrengthLevel.strong:
        return 'blue';
      case PasswordStrengthLevel.veryStrong:
        return 'green';
    }
  }
}

/// Custom encryption exception
class EncryptionException implements Exception {
  const EncryptionException(this.message);
  
  final String message;
  
  @override
  String toString() => 'EncryptionException: $message';
}
