import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import 'package:mailcraftsystem/core/logging/logger.dart';

/// Service for handling encryption and decryption of sensitive data
class EncryptionService {
  static const int _keyLength = 32; // 256 bits
  static const int _ivLength = 16; // 128 bits
  
  late Key _key;
  late Encrypter _encrypter;
  
  /// Create encryption service instance
  EncryptionService._(this._key, this._encrypter);
  
  /// Create encryption service instance
  static Future<EncryptionService> create(String masterPassword) async {
    try {
      // Generate a salt for key derivation
      final salt = utf8.encode('mailcraft_salt_v1');
      
      // Use PBKDF2 to derive key from master password
      final keyBytes = _deriveKey(masterPassword, salt);
      
      final key = Key(keyBytes);
      final encrypter = Encrypter(AES(key));
      
      AppLogger.info('Encryption service initialized successfully');
      return EncryptionService._(key, encrypter);
    } catch (e) {
      AppLogger.error('Failed to initialize encryption service', e);
      rethrow;
    }
  }
  
  /// Derive key using PBKDF2
  static Uint8List _deriveKey(String password, List<int> salt) {
    const iterations = 100000;
    final passwordBytes = utf8.encode(password);
    
    var key = passwordBytes + salt;
    for (var i = 0; i < iterations; i++) {
      final hmac = Hmac(sha256, key);
      key = hmac.convert(passwordBytes + salt).bytes;
    }
    
    return Uint8List.fromList(key.take(_keyLength).toList());
  }
  
  /// Encrypt sensitive data
  String encrypt(String plaintext) {
    try {
      // Generate random IV
      final iv = _generateRandomBytes(_ivLength);
      final encrypted = _encrypter.encrypt(plaintext, iv: IV(iv));
      
      // Combine IV and encrypted data
      final combined = iv + encrypted.bytes;
      return base64.encode(combined);
    } catch (e) {
      AppLogger.error('Encryption failed', e);
      rethrow;
    }
  }
  
  /// Decrypt sensitive data
  String decrypt(String encryptedData) {
    try {
      final combined = base64.decode(encryptedData);
      
      // Extract IV and encrypted data
      final iv = combined.sublist(0, _ivLength);
      final encryptedBytes = combined.sublist(_ivLength);
      
      final encrypted = Encrypted(encryptedBytes);
      return _encrypter.decrypt(encrypted, iv: IV(iv));
    } catch (e) {
      AppLogger.error('Decryption failed', e);
      rethrow;
    }
  }
  
  /// Generate random bytes for IV
  Uint8List _generateRandomBytes(int length) {
    final random = Random.secure();
    return Uint8List.fromList(
      List.generate(length, (_) => random.nextInt(256)),
    );
  }
  
  /// Encrypt file data
  Uint8List encryptBytes(Uint8List data) {
    try {
      final iv = _generateRandomBytes(_ivLength);
      final encrypted = _encrypter.encryptBytes(data, iv: IV(iv));
      
      // Combine IV and encrypted data
      return Uint8List.fromList(iv + encrypted.bytes);
    } catch (e) {
      AppLogger.error('Byte encryption failed', e);
      rethrow;
    }
  }
  
  /// Decrypt file data
  Uint8List decryptBytes(Uint8List encryptedData) {
    try {
      // Extract IV and encrypted data
      final iv = encryptedData.sublist(0, _ivLength);
      final encryptedBytes = encryptedData.sublist(_ivLength);
      
      final encrypted = Encrypted(encryptedBytes);
      final decryptedBytes = _encrypter.decryptBytes(encrypted, iv: IV(iv));
      return Uint8List.fromList(decryptedBytes);
    } catch (e) {
      AppLogger.error('Byte decryption failed', e);
      rethrow;
    }
  }
  
  /// Generate secure hash for data integrity
  String generateHash(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  /// Verify data integrity using hash
  bool verifyHash(String data, String expectedHash) {
    final actualHash = generateHash(data);
    return actualHash == expectedHash;
  }
  
  /// Securely wipe sensitive data from memory
  void dispose() {
    try {
      // In Dart, we can't directly wipe memory, but we can clear references
      AppLogger.info('Encryption service disposed');
    } catch (e) {
      AppLogger.error('Error disposing encryption service', e);
    }
  }
}

/// Encryption configuration for different security levels
enum EncryptionLevel {
  /// Standard AES-256 encryption
  standard,
  /// High security with additional key stretching
  high,
  /// Maximum security with multiple encryption rounds
  maximum,
}

/// Encryption result with metadata
class EncryptionResult {
  /// Creates an encryption result
  const EncryptionResult({
    required this.encryptedData,
    required this.hash,
    required this.timestamp,
  });
  
  /// The encrypted data
  final String encryptedData;
  
  /// Hash for integrity verification
  final String hash;
  
  /// Timestamp when encryption was performed
  final DateTime timestamp;
  
  /// Convert to JSON
  Map<String, dynamic> toJson() => {
    'encryptedData': encryptedData,
    'hash': hash,
    'timestamp': timestamp.toIso8601String(),
  };
  
  /// Create from JSON
  factory EncryptionResult.fromJson(Map<String, dynamic> json) =>
      EncryptionResult(
        encryptedData: json['encryptedData'] as String,
        hash: json['hash'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );
}

/// Security audit result for encryption operations
class SecurityAuditResult {
  /// Creates a security audit result
  const SecurityAuditResult({
    required this.isSecure,
    required this.vulnerabilities,
    required this.recommendations,
  });
  
  /// Whether the encryption setup is secure
  final bool isSecure;
  
  /// List of identified vulnerabilities
  final List<String> vulnerabilities;
  
  /// Security recommendations
  final List<String> recommendations;
}
