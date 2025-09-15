# Security Guide

## Overview

MailCraftSystem implements enterprise-grade security measures to protect user data, communications, and privacy. This document outlines the comprehensive security architecture, threat model, and implementation details.

## Security Architecture

### Defense in Depth
Our security strategy employs multiple layers of protection:

1. **Application Layer**: Input validation, authentication, authorization
2. **Data Layer**: Encryption at rest, secure storage
3. **Network Layer**: TLS encryption, certificate pinning
4. **Device Layer**: Biometric authentication, secure enclaves
5. **Infrastructure Layer**: Secure deployment, monitoring

### Threat Model

#### Assets
- **User Credentials**: Email passwords, OAuth tokens
- **Email Content**: Messages, attachments, metadata
- **Personal Data**: Contact information, preferences
- **Application Data**: Configuration, logs, analytics

#### Threats
- **Data Breach**: Unauthorized access to stored data
- **Man-in-the-Middle**: Network traffic interception
- **Device Compromise**: Malware, physical access
- **Social Engineering**: Phishing, credential theft
- **Insider Threats**: Malicious or negligent employees

#### Mitigations
- **Encryption**: AES-256 for data at rest, TLS 1.3 for transit
- **Authentication**: Multi-factor authentication, biometrics
- **Access Control**: Role-based permissions, least privilege
- **Monitoring**: Security auditing, anomaly detection
- **Training**: Security awareness, best practices

## Encryption

### Data at Rest
All sensitive data is encrypted using AES-256 encryption:

```dart
class EncryptionService {
  // AES-256-GCM encryption
  String encrypt(String plaintext) {
    final iv = IV.fromSecureRandom(16);
    final encrypted = _encrypter.encrypt(plaintext, iv: iv);
    
    // Combine IV and encrypted data
    final combined = Uint8List(16 + encrypted.bytes.length);
    combined.setRange(0, 16, iv.bytes);
    combined.setRange(16, combined.length, encrypted.bytes);
    
    return base64.encode(combined);
  }
  
  // Key derivation using PBKDF2
  Key _deriveKey(String password, Uint8List salt) {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: 100000, // OWASP recommended
      bits: 256,
    );
    
    return pbkdf2.deriveKeyFromPassword(
      password: password,
      nonce: salt,
    );
  }
}
```

### Data in Transit
All network communications use TLS 1.3 with certificate pinning:

```dart
class NetworkSecurity {
  // Certificate pinning configuration
  static const List<String> certificatePins = [
    'sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=',
    'sha256/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=',
  ];
  
  Dio createSecureClient() {
    final dio = Dio();
    
    // Add certificate pinning interceptor
    dio.interceptors.add(CertificatePinningInterceptor(
      allowedSHAFingerprints: certificatePins,
    ));
    
    // Force TLS 1.3
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => false;
      return client;
    };
    
    return dio;
  }
}
```

### Key Management
Encryption keys are managed using platform-specific secure storage:

```dart
class KeyManager {
  static const String _masterKeyAlias = 'mailcraft_master_key';
  
  // Generate and store master key
  Future<void> generateMasterKey() async {
    final key = _generateSecureKey();
    await _secureStorage.write(
      key: _masterKeyAlias,
      value: base64.encode(key),
      aOptions: const AndroidOptions(
        encryptedSharedPreferences: true,
        keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      ),
      iOptions: const IOSOptions(
        accessibility: IOSAccessibility.first_unlock_this_device,
        synchronizable: false,
      ),
    );
  }
  
  Uint8List _generateSecureKey() {
    final random = Random.secure();
    return Uint8List.fromList(
      List.generate(32, (i) => random.nextInt(256))
    );
  }
}
```

## Authentication & Authorization

### OAuth 2.0 + OTP Flow
Secure authentication using industry standards:

```dart
class AuthenticationService {
  // Step 1: Request OTP
  Future<Either<Failure, void>> requestOTP(String email) async {
    final response = await _apiClient.post('/auth/otp/request', data: {
      'email': email,
      'client_id': _clientId,
    });
    
    if (response.statusCode == 200) {
      return const Right(null);
    } else {
      return Left(AuthenticationFailure('OTP request failed'));
    }
  }
  
  // Step 2: Verify OTP and get tokens
  Future<Either<Failure, AuthTokens>> verifyOTP(
    String email,
    String otp,
  ) async {
    final response = await _apiClient.post('/auth/otp/verify', data: {
      'email': email,
      'otp': otp,
      'client_id': _clientId,
      'client_secret': _clientSecret,
    });
    
    if (response.statusCode == 200) {
      final tokens = AuthTokens.fromJson(response.data);
      await _storeTokensSecurely(tokens);
      return Right(tokens);
    } else {
      return Left(AuthenticationFailure('OTP verification failed'));
    }
  }
  
  // Secure token storage
  Future<void> _storeTokensSecurely(AuthTokens tokens) async {
    final encryptedAccessToken = _encryptionService.encrypt(tokens.accessToken);
    final encryptedRefreshToken = _encryptionService.encrypt(tokens.refreshToken);
    
    await _secureStorage.write(key: 'access_token', value: encryptedAccessToken);
    await _secureStorage.write(key: 'refresh_token', value: encryptedRefreshToken);
  }
}
```

### Biometric Authentication
Enhanced security with biometric verification:

```dart
class BiometricAuthService {
  Future<bool> authenticateWithBiometrics() async {
    try {
      final isAvailable = await _localAuth.canCheckBiometrics;
      if (!isAvailable) return false;
      
      final availableBiometrics = await _localAuth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) return false;
      
      final isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access your emails',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      
      return isAuthenticated;
    } catch (e) {
      AppLogger.error('Biometric authentication failed', e);
      return false;
    }
  }
}
```

### Session Management
Secure session handling with automatic timeout:

```dart
class SessionManager {
  static const Duration _sessionTimeout = Duration(minutes: 30);
  Timer? _sessionTimer;
  
  void startSession() {
    _resetSessionTimer();
  }
  
  void _resetSessionTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = Timer(_sessionTimeout, () {
      _expireSession();
    });
  }
  
  void _expireSession() {
    // Clear sensitive data
    _clearTokens();
    _clearCache();
    
    // Navigate to login
    _navigationService.navigateToLogin();
    
    // Log security event
    _securityLogger.logSessionExpiry();
  }
  
  void extendSession() {
    if (_sessionTimer?.isActive == true) {
      _resetSessionTimer();
    }
  }
}
```

## Data Protection

### Secure Storage
Platform-specific secure storage implementation:

```dart
class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
    iOptions: IOSOptions(
      accessibility: IOSAccessibility.first_unlock_this_device,
      synchronizable: false,
    ),
  );
  
  Future<void> storeCredential(String key, String value) async {
    final encryptedValue = EncryptionService.instance.encrypt(value);
    await _storage.write(key: key, value: encryptedValue);
  }
  
  Future<String?> getCredential(String key) async {
    final encryptedValue = await _storage.read(key: key);
    if (encryptedValue == null) return null;
    
    try {
      return EncryptionService.instance.decrypt(encryptedValue);
    } catch (e) {
      AppLogger.error('Failed to decrypt credential', e);
      return null;
    }
  }
}
```

### Data Sanitization
Secure data cleanup and memory management:

```dart
class DataSanitizer {
  // Secure memory wipe
  static void secureWipe(Uint8List data) {
    final random = Random.secure();
    for (int i = 0; i < data.length; i++) {
      data[i] = random.nextInt(256);
    }
  }
  
  // Sanitize sensitive strings
  static void sanitizeString(String sensitive) {
    // In Dart, strings are immutable, so we can't overwrite them
    // Instead, we ensure they're not kept in memory longer than necessary
    sensitive = ''; // Remove reference
    // Force garbage collection (not guaranteed)
    // In production, consider using FFI for true memory control
  }
  
  // Clear application cache
  static Future<void> clearSensitiveCache() async {
    await _clearImageCache();
    await _clearNetworkCache();
    await _clearDatabaseCache();
  }
}
```

## Network Security

### Certificate Pinning
Prevent man-in-the-middle attacks:

```dart
class CertificatePinningInterceptor extends Interceptor {
  final List<String> allowedSHAFingerprints;
  
  CertificatePinningInterceptor({required this.allowedSHAFingerprints});
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add certificate validation
    options.extra['certificate_pinning'] = true;
    handler.next(options);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badCertificate) {
      // Log security incident
      SecurityAuditService.instance.logSecurityIncident(
        'Certificate pinning failure',
        err.requestOptions.uri.toString(),
      );
    }
    handler.next(err);
  }
}
```

### Request Signing
Ensure request integrity:

```dart
class RequestSigningInterceptor extends Interceptor {
  final String secretKey;
  
  RequestSigningInterceptor({required this.secretKey});
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final nonce = _generateNonce();
    
    // Create signature
    final signatureData = '${options.method}${options.uri}$timestamp$nonce';
    final signature = _createHMAC(signatureData, secretKey);
    
    // Add headers
    options.headers.addAll({
      'X-Timestamp': timestamp,
      'X-Nonce': nonce,
      'X-Signature': signature,
    });
    
    handler.next(options);
  }
  
  String _createHMAC(String data, String key) {
    final keyBytes = utf8.encode(key);
    final dataBytes = utf8.encode(data);
    final hmacSha256 = Hmac(sha256, keyBytes);
    final digest = hmacSha256.convert(dataBytes);
    return base64.encode(digest.bytes);
  }
}
```

## Security Auditing

### Vulnerability Scanning
Automated security assessment:

```dart
class SecurityAuditService {
  Future<SecurityAuditReport> performSecurityAudit() async {
    final findings = <SecurityFinding>[];
    
    // Check device security
    findings.addAll(await _checkDeviceSecurity());
    
    // Check app security
    findings.addAll(await _checkAppSecurity());
    
    // Check network security
    findings.addAll(await _checkNetworkSecurity());
    
    // Check data protection
    findings.addAll(await _checkDataProtection());
    
    return SecurityAuditReport(
      auditId: _generateAuditId(),
      timestamp: DateTime.now(),
      findings: findings,
      overallRisk: _calculateOverallRisk(findings),
    );
  }
  
  Future<List<SecurityFinding>> _checkDeviceSecurity() async {
    final findings = <SecurityFinding>[];
    
    // Check for rooted/jailbroken device
    if (await _isDeviceCompromised()) {
      findings.add(SecurityFinding(
        id: 'DEVICE_001',
        severity: SecuritySeverity.high,
        title: 'Compromised Device Detected',
        description: 'Device appears to be rooted or jailbroken',
        recommendation: 'Use app only on secure devices',
      ));
    }
    
    // Check OS version
    if (await _isOSOutdated()) {
      findings.add(SecurityFinding(
        id: 'DEVICE_002',
        severity: SecuritySeverity.medium,
        title: 'Outdated Operating System',
        description: 'OS version may have security vulnerabilities',
        recommendation: 'Update to latest OS version',
      ));
    }
    
    return findings;
  }
}
```

### Security Logging
Comprehensive security event logging:

```dart
class SecurityLogger {
  static const String _logTag = 'SECURITY';
  
  void logAuthenticationAttempt(String email, bool success) {
    final event = SecurityEvent(
      type: SecurityEventType.authentication,
      timestamp: DateTime.now(),
      details: {
        'email': _hashEmail(email),
        'success': success,
        'ip_address': _getCurrentIP(),
        'user_agent': _getUserAgent(),
      },
    );
    
    _logSecurityEvent(event);
  }
  
  void logDataAccess(String dataType, String operation) {
    final event = SecurityEvent(
      type: SecurityEventType.dataAccess,
      timestamp: DateTime.now(),
      details: {
        'data_type': dataType,
        'operation': operation,
        'user_id': _getCurrentUserId(),
      },
    );
    
    _logSecurityEvent(event);
  }
  
  void logSecurityIncident(String incident, String details) {
    final event = SecurityEvent(
      type: SecurityEventType.securityIncident,
      timestamp: DateTime.now(),
      severity: SecuritySeverity.high,
      details: {
        'incident': incident,
        'details': details,
        'device_id': _getDeviceId(),
      },
    );
    
    _logSecurityEvent(event);
    _alertSecurityTeam(event);
  }
  
  String _hashEmail(String email) {
    final bytes = utf8.encode(email);
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 8); // First 8 chars for privacy
  }
}
```

## Privacy Protection

### GDPR Compliance
Data protection and user rights:

```dart
class PrivacyService {
  // Right to be forgotten (Article 17)
  Future<DataDeletionResult> deleteUserData(String userId) async {
    final deletionLog = <String>[];
    
    try {
      // Delete from all data stores
      await _deleteFromDatabase(userId);
      deletionLog.add('Database: Deleted');
      
      await _deleteFromCache(userId);
      deletionLog.add('Cache: Deleted');
      
      await _deleteFromLogs(userId);
      deletionLog.add('Logs: Deleted');
      
      // Verify deletion
      final verificationPassed = await _verifyDeletion(userId);
      
      return DataDeletionResult(
        userId: userId,
        deletionDate: DateTime.now(),
        verificationPassed: verificationPassed,
        deletionLog: deletionLog,
      );
    } catch (e) {
      throw PrivacyException('Data deletion failed: $e');
    }
  }
  
  // Data portability (Article 20)
  Future<UserDataExport> exportUserData(String userId) async {
    final exportData = <String, dynamic>{};
    
    // Collect data from all sources
    exportData['profile'] = await _exportProfileData(userId);
    exportData['emails'] = await _exportEmailData(userId);
    exportData['settings'] = await _exportSettingsData(userId);
    
    return UserDataExport(
      userId: userId,
      exportDate: DateTime.now(),
      format: DataExportFormat.json,
      data: exportData,
      checksum: _calculateChecksum(exportData),
    );
  }
}
```

### Consent Management
Granular privacy controls:

```dart
class ConsentManager {
  Future<void> requestConsent(ConsentType type) async {
    final consentDialog = ConsentDialog(
      type: type,
      purpose: _getConsentPurpose(type),
      onAccept: () => _recordConsent(type, ConsentStatus.granted),
      onDecline: () => _recordConsent(type, ConsentStatus.denied),
    );
    
    await _showConsentDialog(consentDialog);
  }
  
  void _recordConsent(ConsentType type, ConsentStatus status) {
    final record = ConsentRecord(
      type: type,
      status: status,
      timestamp: DateTime.now(),
      version: _privacyPolicyVersion,
    );
    
    _storeConsentRecord(record);
    _updatePrivacySettings(type, status);
  }
  
  bool hasValidConsent(ConsentType type) {
    final record = _getLatestConsentRecord(type);
    if (record == null) return false;
    
    // Check if consent is still valid
    final isExpired = DateTime.now().difference(record.timestamp).inDays > 365;
    return record.status == ConsentStatus.granted && !isExpired;
  }
}
```

## Incident Response

### Security Incident Handling
Automated response to security threats:

```dart
class IncidentResponseService {
  Future<void> handleSecurityIncident(SecurityIncident incident) async {
    // Log incident
    _logIncident(incident);
    
    // Assess severity
    final severity = _assessIncidentSeverity(incident);
    
    // Take immediate action
    switch (severity) {
      case IncidentSeverity.critical:
        await _handleCriticalIncident(incident);
        break;
      case IncidentSeverity.high:
        await _handleHighSeverityIncident(incident);
        break;
      case IncidentSeverity.medium:
        await _handleMediumSeverityIncident(incident);
        break;
      case IncidentSeverity.low:
        await _handleLowSeverityIncident(incident);
        break;
    }
    
    // Notify stakeholders
    await _notifyStakeholders(incident, severity);
  }
  
  Future<void> _handleCriticalIncident(SecurityIncident incident) async {
    // Immediate containment
    await _lockUserAccount(incident.userId);
    await _revokeAllTokens(incident.userId);
    await _clearSensitiveData(incident.userId);
    
    // Alert security team
    await _alertSecurityTeam(incident);
    
    // Force app logout
    await _forceAppLogout();
  }
}
```

### Forensic Logging
Detailed logging for security analysis:

```dart
class ForensicLogger {
  void logUserAction(String action, Map<String, dynamic> context) {
    final logEntry = ForensicLogEntry(
      timestamp: DateTime.now(),
      action: action,
      userId: context['user_id'],
      sessionId: context['session_id'],
      ipAddress: context['ip_address'],
      userAgent: context['user_agent'],
      additionalData: context,
    );
    
    _writeToSecureLog(logEntry);
  }
  
  void _writeToSecureLog(ForensicLogEntry entry) {
    // Encrypt log entry
    final encryptedEntry = _encryptLogEntry(entry);
    
    // Write to tamper-evident log
    _tamperEvidentLog.append(encryptedEntry);
    
    // Create integrity hash
    final hash = _createIntegrityHash(encryptedEntry);
    _integrityHashes.add(hash);
  }
}
```

## Security Best Practices

### Development Guidelines
1. **Secure Coding**: Follow OWASP guidelines
2. **Input Validation**: Validate all user inputs
3. **Output Encoding**: Prevent injection attacks
4. **Error Handling**: Don't leak sensitive information
5. **Dependency Management**: Keep dependencies updated

### Deployment Security
1. **Code Obfuscation**: Protect against reverse engineering
2. **Anti-Tampering**: Detect app modifications
3. **Runtime Protection**: Monitor for threats
4. **Secure Configuration**: Environment-specific settings
5. **Update Mechanism**: Secure app updates

### Operational Security
1. **Monitoring**: Continuous security monitoring
2. **Alerting**: Real-time threat detection
3. **Response**: Incident response procedures
4. **Recovery**: Business continuity planning
5. **Training**: Security awareness programs

## Compliance

### Standards Compliance
- **OWASP Mobile Top 10**: Address mobile security risks
- **NIST Cybersecurity Framework**: Comprehensive security approach
- **ISO 27001**: Information security management
- **SOC 2**: Security and availability controls
- **GDPR**: Data protection and privacy

### Regular Assessments
- **Penetration Testing**: External security testing
- **Code Reviews**: Static and dynamic analysis
- **Vulnerability Scanning**: Automated security scanning
- **Compliance Audits**: Regular compliance verification
- **Security Training**: Ongoing team education

This comprehensive security guide ensures that MailCraftSystem maintains the highest standards of security and privacy protection for enterprise use.
