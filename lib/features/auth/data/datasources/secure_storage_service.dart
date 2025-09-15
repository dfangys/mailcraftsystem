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
  
  /// Store auth token securely
  Future<void> storeToken(AuthToken token) async {
    await _storage.write(
      key: _tokenKey,
      value: jsonEncode(token.toJson()),
    );
    
    if (token.refreshToken != null) {
      await _storage.write(
        key: _refreshTokenKey,
        value: token.refreshToken!,
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
    return await _storage.read(key: _refreshTokenKey);
  }
  
  /// Clear stored tokens
  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
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
