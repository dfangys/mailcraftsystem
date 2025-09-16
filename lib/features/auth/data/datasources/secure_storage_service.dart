import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';

/// Secure storage service for auth tokens
class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _mailEmailKey = 'mail_email';
  static const String _mailPasswordKey = 'mail_password';

  /// Store auth token securely
  Future<void> storeToken(AuthToken token) async {
    await _storage.write(
      key: _tokenKey,
      value: jsonEncode(token.toJson()),
    );

    if (token.refreshToken != null) {
      await _storage.write(
        key: _refreshTokenKey,
        value: token.refreshToken,
      );
    }
  }

  /// Get stored auth token
  Future<AuthToken?> getToken() async {
    final tokenJson = await _storage.read(key: _tokenKey);
    if (tokenJson == null) return null;

    try {
      final tokenMap = jsonDecode(tokenJson) as Map<String, dynamic>;
      return AuthToken.fromJson(tokenMap);
    } catch (e) {
      // If token is corrupted, clear it
      await clearToken();
      return null;
    }
  }

  /// Get stored refresh token
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  /// Clear stored tokens
  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  /// Persist IMAP/SMTP email/password for restoring MailClient after restart
  Future<void> storeMailCredentials(String email, String password) async {
    await _storage.write(key: _mailEmailKey, value: email);
    await _storage.write(key: _mailPasswordKey, value: password);
  }

  /// Retrieve stored IMAP/SMTP credentials
  Future<MailCredentials?> getMailCredentials() async {
    final email = await _storage.read(key: _mailEmailKey);
    final password = await _storage.read(key: _mailPasswordKey);
    if (email == null || password == null) return null;
    return MailCredentials(email: email, password: password);
  }

  /// Clear stored mail credentials
  Future<void> clearMailCredentials() async {
    await _storage.delete(key: _mailEmailKey);
    await _storage.delete(key: _mailPasswordKey);
  }

  /// Check if token exists
  Future<bool> hasToken() async {
    final token = await _storage.read(key: _tokenKey);
    return token != null;
  }

  /// Clear all stored data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

/// Simple mail credentials value object
class MailCredentials {
  const MailCredentials({required this.email, required this.password});

  final String email;
  final String password;
}
