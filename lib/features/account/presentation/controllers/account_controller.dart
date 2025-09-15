import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/account/domain/models/account_connection_result.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_provider_preset.dart';
import 'package:mailcraftsystem/features/account/domain/repositories/account_repository.dart';
import 'package:mailcraftsystem/features/account/presentation/widgets/advanced_settings_panel.dart';

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
    String? connectionDetails,
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
      
      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (connectionResult) async {
          if (connectionResult.isSuccess) {
            // Save account configuration
            await _accountRepository.addAccount(accountConfig);
            
            state = state.copyWith(
              isLoading: false,
              isConnected: true,
              isSetupComplete: true,
              accountConfig: accountConfig,
              connectionDetails: connectionResult.details,
            );
          } else {
            state = state.copyWith(
              isLoading: false,
              error: connectionResult.errorMessage ?? 'Connection failed',
            );
          }
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: $e',
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
  Future<Either<Failure, AccountConnectionResult>> testConnection(
    MailAccountConfig config,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulate connection test
    if (config.email.isEmpty || config.password.isEmpty) {
      return const Left(Failure.validation(message: 'Email and password are required'));
    }

    if (config.imapConfig.host.isEmpty || config.smtpConfig.host.isEmpty) {
      return const Left(Failure.validation(message: 'Server configuration is incomplete'));
    }

    // Simulate successful connection
    final detailsMap = {
      'IMAP Server': '${config.imapConfig.host}:${config.imapConfig.port}',
      'SMTP Server': '${config.smtpConfig.host}:${config.smtpConfig.port}',
      'Security': config.allowInsecureSSL ? 'Insecure SSL' : 'Secure SSL/TLS',
      'Capabilities': 'IDLE, SORT, MOVE, QUOTA',
    };
    return Right(
      AccountConnectionResult(
        isSuccess: true,
        details: detailsMap.entries.map((e) => '${e.key}: ${e.value}').join('\n'),
      ),
    );
  }

  @override
  Future<Either<Failure, MailAccountConfig>> addAccount(MailAccountConfig config) async {
    // Simulate saving to secure storage
    await Future.delayed(const Duration(milliseconds: 500));
    return Right(config);
  }

  @override
  Future<Either<Failure, List<MailAccountConfig>>> getAccounts() async {
    // Return empty list for now
    return const Right(<MailAccountConfig>[]);
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String accountId) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, MailAccountConfig>> getAccount(String accountId) async {
    return const Left(Failure.validation(message: 'Account not found'));
  }

  @override
  Future<Either<Failure, MailProviderPreset>> findPresetByEmail(String email) async {
    return const Left(Failure.validation(message: 'No preset found'));
  }

  @override
  Future<Either<Failure, AccountCapabilities>> getAccountCapabilities(String accountId) async {
    return const Right(AccountCapabilities(supportsMove: true, supportsSort: true));
  }

  @override
  Future<Either<Failure, MailAccountConfig>> updateAccount(MailAccountConfig config) async {
    return Right(config);
  }

  @override
  Future<Either<Failure, List<MailProviderPreset>>> getProviderPresets() async {
    return const Right(<MailProviderPreset>[]);
  }

  @override
  Future<Either<Failure, AccountValidationResult>> validateAccount(MailAccountConfig config) async {
    return const Right(AccountValidationResult(isValid: true));
  }

  @override
  Future<Either<Failure, void>> setDefaultAccount(String accountId) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, MailAccountConfig>> getDefaultAccount() async {
    return const Left(Failure.validation(message: 'No default account'));
  }
}

