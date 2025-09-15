import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/mail_account_config.dart';
import '../../domain/repositories/account_repository.dart';
import '../widgets/advanced_settings_panel.dart';

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
        displayName: displayName,
        email: email,
        password: password,
        imapHost: imapHost ?? preset?['imapHost'] ?? '',
        imapPort: imapPort ?? preset?['imapPort'] ?? 993,
        imapSocketType: preset?['imapSocketType'] ?? 'ssl',
        smtpHost: smtpHost ?? preset?['smtpHost'] ?? '',
        smtpPort: smtpPort ?? preset?['smtpPort'] ?? 587,
        smtpSocketType: preset?['smtpSocketType'] ?? 'starttls',
        allowInsecureSsl: preset?['allowInsecureSsl'] ?? false,
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
        (connectionResult) {
          if (connectionResult.isSuccess) {
            // Save account configuration
            _accountRepository.saveAccount(accountConfig);
            
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
      return Left(Failure('Email and password are required'));
    }

    if (config.imapHost.isEmpty || config.smtpHost.isEmpty) {
      return Left(Failure('Server configuration is incomplete'));
    }

    // Simulate successful connection
    return Right(AccountConnectionResult(
      isSuccess: true,
      details: {
        'IMAP Server': '${config.imapHost}:${config.imapPort}',
        'SMTP Server': '${config.smtpHost}:${config.smtpPort}',
        'Security': config.allowInsecureSsl ? 'Insecure SSL' : 'Secure SSL/TLS',
        'Capabilities': 'IDLE, SORT, MOVE, QUOTA',
      },
    ));
  }

  @override
  Future<Either<Failure, void>> saveAccount(MailAccountConfig config) async {
    // Simulate saving to secure storage
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<MailAccountConfig>>> getAccounts() async {
    // Return empty list for now
    return const Right([]);
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String accountId) async {
    return const Right(null);
  }
}

/// Either type for error handling
abstract class Either<L, R> {
  /// Fold the either
  T fold<T>(T Function(L) left, T Function(R) right);
}

/// Left side of Either
class Left<L, R> extends Either<L, R> {
  /// Creates a left
  const Left(this.value);

  /// The left value
  final L value;

  @override
  T fold<T>(T Function(L) left, T Function(R) right) => left(value);
}

/// Right side of Either
class Right<L, R> extends Either<L, R> {
  /// Creates a right
  const Right(this.value);

  /// The right value
  final R value;

  @override
  T fold<T>(T Function(L) left, T Function(R) right) => right(value);
}

/// Failure class
class Failure {
  /// Creates a failure
  const Failure(this.message);

  /// Error message
  final String message;
}
