import '../../domain/models/mail_account_config.dart';
import '../../domain/models/account_connection_result.dart';
import '../../domain/models/mail_provider_preset.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_local_storage.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/logging/logger.dart';

/// Implementation of account repository
class AccountRepositoryImpl implements AccountRepository {
  /// Creates account repository implementation
  const AccountRepositoryImpl({
    required this.localStorage,
  });

  /// Local storage service
  final AccountLocalStorage localStorage;

  @override
  Future<({Failure? left, AccountConnectionResult? right})> testConnection(
    MailAccountConfig config,
  ) async {
    try {
      AppLogger.info('Testing connection for ${config.email}');
      
      // Simulate connection test
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock successful connection
      return (
        left: null,
        right: AccountConnectionResult(
          isSuccess: true,
          details: 'Connection successful',
          capabilities: ['IMAP', 'SMTP'],
        ),
      );
    } catch (e, stackTrace) {
      AppLogger.error('Connection test failed', e, stackTrace);
      return (
        left: Failure.network(message: 'Connection test failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> addAccount(
    MailAccountConfig config,
  ) async {
    try {
      await localStorage.addAccount(config);
      AppLogger.info('Account added successfully for ${config.email}');
      return (left: null, right: config);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to add account', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to add account: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, List<MailAccountConfig>? right})> getAccounts() async {
    try {
      final accounts = await localStorage.getAccounts();
      return (left: null, right: accounts);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get accounts', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to get accounts: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, void right})> deleteAccount(String accountId) async {
    try {
      await localStorage.deleteAccount(accountId);
      AppLogger.info('Account deleted successfully: $accountId');
      return (left: null, right: null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete account', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to delete account: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> getAccount(String accountId) async {
    try {
      final account = await localStorage.getAccount(accountId);
      return (left: null, right: account);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get account', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to get account: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> updateAccount(
    MailAccountConfig config,
  ) async {
    try {
      await localStorage.updateAccount(config);
      AppLogger.info('Account updated successfully for ${config.email}');
      return (left: null, right: config);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update account', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to update account: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, List<MailProviderPreset>? right})> getProviderPresets() async {
    try {
      // Return mock presets
      final presets = [
        MailProviderPreset(
          id: 'gmail',
          name: 'Gmail',
          domains: ['gmail.com'],
          imapHost: 'imap.gmail.com',
          imapPort: 993,
          smtpHost: 'smtp.gmail.com',
          smtpPort: 587,
        ),
        MailProviderPreset(
          id: 'outlook',
          name: 'Outlook',
          domains: ['outlook.com', 'hotmail.com'],
          imapHost: 'outlook.office365.com',
          imapPort: 993,
          smtpHost: 'smtp-mail.outlook.com',
          smtpPort: 587,
        ),
      ];
      return (left: null, right: presets);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get provider presets', e, stackTrace);
      return (
        left: Failure.unknown(message: 'Failed to get provider presets: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, MailProviderPreset? right})> findPresetByEmail(String email) async {
    try {
      final domain = email.split('@').last;
      final presets = await getProviderPresets();
      
      if (presets.left != null) {
        return (left: presets.left, right: null);
      }
      
      final preset = presets.right?.firstWhere(
        (p) => p.domains.contains(domain),
        orElse: () => throw Exception('No preset found'),
      );
      
      return (left: null, right: preset);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to find preset for email', e, stackTrace);
      return (
        left: Failure.unknown(message: 'No preset found for email domain'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, AccountValidationResult? right})> validateAccount(
    MailAccountConfig config,
  ) async {
    try {
      final errors = <String>[];
      
      if (config.email.isEmpty) errors.add('Email is required');
      if (config.name.isEmpty) errors.add('Name is required');
      
      final result = AccountValidationResult(
        isValid: errors.isEmpty,
        errors: errors,
      );
      
      return (left: null, right: result);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to validate account', e, stackTrace);
      return (
        left: Failure.validation(message: 'Validation failed: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, AccountCapabilities? right})> getAccountCapabilities(
    String accountId,
  ) async {
    try {
      // Mock capabilities
      const capabilities = AccountCapabilities(
        supportsIdle: true,
        supportsSort: true,
        supportsMove: true,
        supportsQuota: false,
        maxMessageSize: 25 * 1024 * 1024, // 25MB
      );
      
      return (left: null, right: capabilities);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get account capabilities', e, stackTrace);
      return (
        left: Failure.unknown(message: 'Failed to get capabilities: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, void right})> setDefaultAccount(String accountId) async {
    try {
      await localStorage.setDefaultAccount(accountId);
      AppLogger.info('Default account set: $accountId');
      return (left: null, right: null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to set default account', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to set default account: $e'),
        right: null,
      );
    }
  }

  @override
  Future<({Failure? left, MailAccountConfig? right})> getDefaultAccount() async {
    try {
      final account = await localStorage.getDefaultAccount();
      return (left: null, right: account);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get default account', e, stackTrace);
      return (
        left: Failure.storage(message: 'Failed to get default account: $e'),
        right: null,
      );
    }
  }
}
