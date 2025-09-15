import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:enough_mail/enough_mail.dart' as enough_mail;

import '../../domain/models/mail_account_config.dart';
import '../../domain/models/mail_provider_preset.dart';
import '../../domain/repositories/account_repository.dart';
import '../widgets/advanced_settings_panel.dart';
import '../../../../core/error/failures.dart';

part 'account_controller.freezed.dart';

/// Account state model
@freezed
class AccountState with _$AccountState {
  /// Creates an account state
  const factory AccountState({
    @Default(false) bool isLoading,
    @Default(false) bool isConnected,
    @Default(false) bool isSetupComplete,
    String? selectedProvider,
    MailAccountConfig? accountConfig,
    Map<String, String>? connectionDetails,
    String? error,
  }) = _AccountState;
}

/// Account controller provider
final accountControllerProvider = StateNotifierProvider<AccountController, AccountState>(
  (ref) => AccountController(
    accountRepository: ref.read(accountRepositoryProvider),
  ),
);

/// Account controller
class AccountController extends StateNotifier<AccountState> {
  /// Creates an account controller
  AccountController({
    required AccountRepository accountRepository,
  })  : _accountRepository = accountRepository,
        super(const AccountState());

  final AccountRepository _accountRepository;

  /// Provider presets
  static const Map<String, Map<String, dynamic>> _providerPresets = {
    'gmail': {
      'imapHost': 'imap.gmail.com',
      'imapPort': 993,
      'imapSocketType': 'ssl',
      'smtpHost': 'smtp.gmail.com',
      'smtpPort': 587,
      'smtpSocketType': 'starttls',
    },
    'outlook': {
      'imapHost': 'outlook.office365.com',
      'imapPort': 993,
      'imapSocketType': 'ssl',
      'smtpHost': 'smtp.office365.com',
      'smtpPort': 587,
      'smtpSocketType': 'starttls',
    },
    'yahoo': {
      'imapHost': 'imap.mail.yahoo.com',
      'imapPort': 993,
      'imapSocketType': 'ssl',
      'smtpHost': 'smtp.mail.yahoo.com',
      'smtpPort': 587,
      'smtpSocketType': 'starttls',
    },
    'wahda': {
      'imapHost': 'wbmail.wahdabank.com.ly',
      'imapPort': 43245,
      'imapSocketType': 'ssl',
      'smtpHost': 'wbmail.wahdabank.com.ly',
      'smtpPort': 43244,
      'smtpSocketType': 'plain',
      'allowInsecureSsl': true, // Wahda Bank may need insecure SSL
    },
  };

  /// Select email provider
  void selectProvider(String providerId) {
    state = state.copyWith(
      selectedProvider: providerId,
      error: null,
    );
  }

  /// Update email and detect provider
  void updateEmailAndDetectProvider(String email) {
    if (email.isEmpty) return;

    final domain = email.split('@').last.toLowerCase();
    String? detectedProvider;

    // Auto-detect provider based on email domain
    if (domain.contains('gmail.com')) {
      detectedProvider = 'gmail';
    } else if (domain.contains('outlook.com') || 
               domain.contains('hotmail.com') || 
               domain.contains('live.com')) {
      detectedProvider = 'outlook';
    } else if (domain.contains('yahoo.com')) {
      detectedProvider = 'yahoo';
    } else if (domain.contains('wahdabank.com.ly')) {
      detectedProvider = 'wahda';
    }

    if (detectedProvider != null && state.selectedProvider != 'manual') {
      state = state.copyWith(selectedProvider: detectedProvider);
    }
  }

  /// Update advanced settings
  void updateAdvancedSettings(AdvancedSettings settings) {
    // Store advanced settings for later use
    // This would typically update the account config
  }

  /// Setup email account
  Future<void> setupAccount({
    required String email,
    required String password,
    required String displayName,
    String? imapHost,
    int? imapPort,
    String? smtpHost,
    int? smtpPort,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Get provider preset or use manual settings
      final preset = state.selectedProvider != null && state.selectedProvider != 'manual'
          ? _providerPresets[state.selectedProvider!]
          : null;

      // Create account configuration
      final accountConfig = MailAccountConfig(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: displayName,
        email: email,
        password: password,
        imapConfig: ImapConfig(
          host: imapHost ?? (preset?['imapHost'] as String?) ?? '',
          port: imapPort ?? (preset?['imapPort'] as int?) ?? 993,
          socketType: _parseSocketTypeToLocal(preset?['imapSocketType'] as String? ?? 'ssl'),
        ),
        smtpConfig: SmtpConfig(
          host: smtpHost ?? (preset?['smtpHost'] as String?) ?? '',
          port: smtpPort ?? (preset?['smtpPort'] as int?) ?? 587,
          socketType: _parseSocketTypeToLocal(preset?['smtpSocketType'] as String? ?? 'starttls'),
        ),
        allowInsecureSSL: (preset?['allowInsecureSsl'] as bool?) ?? false,
      );

      // Test connection
      final result = await _accountRepository.testConnection(accountConfig);
      
      if (result.left != null) {
        state = state.copyWith(
          isLoading: false,
          error: result.left!.message,
        );
      } else if (result.right != null) {
        final connectionResult = result.right!;
        if (connectionResult.isSuccess) {
          // Save account configuration
          await _accountRepository.addAccount(accountConfig);
          
          state = state.copyWith(
            isLoading: false,
            isConnected: true,
            isSetupComplete: true,
            accountConfig: accountConfig,
            connectionDetails: connectionResult.details != null 
                ? {'status': connectionResult.details!} 
                : null,
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            error: connectionResult.errorMessage ?? 'Connection failed',
          );
        }
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Reset account setup
  void resetSetup() {
    state = const AccountState();
  }

  /// Parse socket type from string to local SocketType
  SocketType _parseSocketTypeToLocal(String socketType) {
    switch (socketType.toLowerCase()) {
      case 'ssl':
        return SocketType.ssl;
      case 'starttls':
        return SocketType.starttls;
      case 'plain':
        return SocketType.plain;
      default:
        return SocketType.ssl;
    }
  }
}

/// Mock account repository provider
final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  // This would be replaced with actual implementation
  return MockAccountRepository();
});

/// Mock account repository implementation
class MockAccountRepository implements AccountRepository {
  @override
  Future<({Failure? left, AccountConnectionResult? right})> testConnection(
    MailAccountConfig config,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulate connection test
    if (config.email.isEmpty || config.password.isEmpty) {
      return (left: Failure.validation(message: 'Email and password are required'), right: null);
    }

    if (config.imapConfig.host.isEmpty || config.smtpConfig.host.isEmpty) {
      return (left: Failure.validation(message: 'Server configuration is incomplete'), right: null);
    }

    // Simulate successful connection
    return (
      left: null,
      right: AccountConnectionResult(
        isSuccess: true,
        details: {
          'IMAP Server': '${config.imapConfig.host}:${config.imapConfig.port}',
          'SMTP Server': '${config.smtpConfig.host}:${config.smtpConfig.port}',
          'Security': config.allowInsecureSSL ? 'Insecure SSL' : 'Secure SSL/TLS',
          'Capabilities': 'IDLE, SORT, MOVE, QUOTA',
        },
      ),
    );
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> addAccount(MailAccountConfig config) async {
    // Simulate saving to secure storage
    await Future.delayed(const Duration(milliseconds: 500));
    return (left: null, right: config);
  }

  @override
  Future<({Failure? left, List<MailAccountConfig>? right})> getAccounts() async {
    // Return empty list for now
    return (left: null, right: <MailAccountConfig>[]);
  }

  @override
  Future<({Failure? left, void right})> deleteAccount(String accountId) async {
    return (left: null, right: null);
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> getAccount(String accountId) async {
    return (left: Failure.validation(message: 'Account not found'), right: null);
  }

  @override
  Future<({Failure? left, MailProviderPreset? right})> findPresetByEmail(String email) async {
    return (left: Failure.validation(message: 'No preset found'), right: null);
  }

  @override
  Future<({Failure? left, AccountCapabilities? right})> getAccountCapabilities(String accountId) async {
    return (left: null, right: const AccountCapabilities());
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> updateAccount(MailAccountConfig config) async {
    return (left: null, right: config);
  }

  @override
  Future<({Failure? left, List<MailProviderPreset>? right})> getProviderPresets() async {
    return (left: null, right: <MailProviderPreset>[]);
  }

  @override
  Future<({Failure? left, AccountValidationResult? right})> validateAccount(MailAccountConfig config) async {
    return (left: null, right: const AccountValidationResult(isValid: true));
  }

  @override
  Future<({Failure? left, void right})> setDefaultAccount(String accountId) async {
    return (left: null, right: null);
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> getDefaultAccount() async {
    return (left: Failure.validation(message: 'No default account'), right: null);
  }
}

// Using Failure from core/error/failures.dart

/// Account connection result
class AccountConnectionResult {
  /// Creates an account connection result
  const AccountConnectionResult({
    required this.isSuccess,
    this.details,
    this.errorMessage,
  });

  /// Whether the connection was successful
  final bool isSuccess;

  /// Connection details
  final Map<String, String>? details;

  /// Error message if connection failed
  final String? errorMessage;
}
