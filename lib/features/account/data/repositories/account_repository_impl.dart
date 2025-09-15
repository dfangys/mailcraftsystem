import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/account/data/datasources/account_local_storage.dart';
import 'package:mailcraftsystem/features/account/data/gateways/mail_client_factory.dart';
import 'package:mailcraftsystem/features/account/domain/models/account_connection_result.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_provider_preset.dart';
import 'package:mailcraftsystem/features/account/domain/repositories/account_repository.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Account repository implementation
class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({
    required AccountLocalStorage localStorage,
  }) : _localStorage = localStorage;
  
  final AccountLocalStorage _localStorage;
  
  @override
  Future<Either<Failure, List<MailAccountConfig>>> getAccounts() async {
    try {
      final accounts = await _localStorage.getAccounts();
      AppLogger.info('Retrieved ${accounts.length} accounts from storage');
      return (left: null, right: accounts);
    } catch (e) {
      AppLogger.error('Failed to get accounts', e);
      return (
        left: Failure.storage(message: 'Failed to retrieve accounts: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, MailAccountConfig?>> getAccount(String id) async {
    try {
      final account = await _localStorage.getAccount(id);
      return (left: null, right: account);
    } catch (e) {
      AppLogger.error('Failed to get account $id', e);
      return (
        left: Failure.storage(message: 'Failed to retrieve account: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, MailAccountConfig>> addAccount(MailAccountConfig config) async {
    try {
      // Validate account first
      final validationResult = await validateAccount(config);
      if (validationResult.isLeft) {
        return (left: validationResult.left!, right: null);
      }
      
      if (!validationResult.right!.isValid) {
        return (
          left: Failure.validation(
            message: 'Account validation failed',
            fieldErrors: validationResult.right!.fieldErrors,
          ),
          right: null,
        );
      }
      
      // Add timestamps
      final accountWithTimestamps = config.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      await _localStorage.addAccount(accountWithTimestamps);
      
      AppLogger.info('Added new account: ${config.displayName}');
      return (left: null, right: accountWithTimestamps);
    } catch (e) {
      AppLogger.error('Failed to add account', e);
      return (
        left: Failure.storage(message: 'Failed to add account: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, MailAccountConfig>> updateAccount(MailAccountConfig config) async {
    try {
      // Validate account first
      final validationResult = await validateAccount(config);
      if (validationResult.isLeft) {
        return (left: validationResult.left!, right: null);
      }
      
      if (!validationResult.right!.isValid) {
        return (
          left: Failure.validation(
            message: 'Account validation failed',
            fieldErrors: validationResult.right!.fieldErrors,
          ),
          right: null,
        );
      }
      
      // Add update timestamp
      final updatedAccount = config.copyWith(updatedAt: DateTime.now());
      
      final success = await _localStorage.updateAccount(updatedAccount);
      if (!success) {
        return (
          left: const Failure.storage(message: 'Account not found'),
          right: null,
        );
      }
      
      AppLogger.info('Updated account: ${config.displayName}');
      return (left: null, right: updatedAccount);
    } catch (e) {
      AppLogger.error('Failed to update account', e);
      return (
        left: Failure.storage(message: 'Failed to update account: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteAccount(String id) async {
    try {
      final success = await _localStorage.deleteAccount(id);
      if (!success) {
        return (
          left: const Failure.storage(message: 'Account not found'),
          right: null,
        );
      }
      
      AppLogger.info('Deleted account: $id');
      return (left: null, right: null);
    } catch (e) {
      AppLogger.error('Failed to delete account', e);
      return (
        left: Failure.storage(message: 'Failed to delete account: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, AccountConnectionResult>> testConnection(
    MailAccountConfig config,
  ) async {
    try {
      AppLogger.info('Testing connection for account: ${config.displayName}');
      
      final result = await MailClientFactory.testFullConnection(config);
      
      final connectionResult = AccountConnectionResult(
        imapConnected: result.imapResult.success,
        smtpConnected: result.smtpResult.success,
        imapError: result.imapResult.error,
        smtpError: result.smtpResult.error,
        capabilities: result.imapResult.success
            ? AccountCapabilities(
                supportsIdle: result.imapResult.supportsIdle,
                supportsMove: result.imapResult.supportsMove,
                supportsSort: result.imapResult.supportsSort,
                supportsSearch: result.imapResult.supportsSearch,
                supportsQuota: result.imapResult.supportsQuota,
                supportsUidPlus: result.imapResult.supportsUidPlus,
                supportedExtensions: result.imapResult.capabilities,
              )
            : null,
      );
      
      return (left: null, right: connectionResult);
    } catch (e) {
      AppLogger.error('Connection test failed', e);
      return (
        left: Failure.mail(message: 'Connection test failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, List<MailProviderPreset>>> getProviderPresets() async {
    try {
      final presets = MailProviderPresets.getActivePresets();
      return (left: null, right: presets);
    } catch (e) {
      AppLogger.error('Failed to get provider presets', e);
      return (
        left: Failure.unknown(message: 'Failed to get provider presets: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, MailProviderPreset?>> findPresetByEmail(String email) async {
    try {
      final preset = MailProviderPresets.findByEmail(email);
      return (left: null, right: preset);
    } catch (e) {
      AppLogger.error('Failed to find preset by email', e);
      return (
        left: Failure.unknown(message: 'Failed to find preset: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, AccountValidationResult>> validateAccount(
    MailAccountConfig config,
  ) async {
    try {
      final fieldErrors = <String, String>{};
      final warnings = <String>[];
      
      // Validate email
      if (config.email.isEmpty) {
        fieldErrors['email'] = 'Email is required';
      } else if (!_isValidEmail(config.email)) {
        fieldErrors['email'] = 'Invalid email format';
      }
      
      // Validate password
      if (config.password.isEmpty) {
        fieldErrors['password'] = 'Password is required';
      }
      
      // Validate IMAP configuration
      if (config.imapConfig.host.isEmpty) {
        fieldErrors['imapHost'] = 'IMAP host is required';
      }
      
      if (config.imapConfig.port <= 0 || config.imapConfig.port > 65535) {
        fieldErrors['imapPort'] = 'Invalid IMAP port';
      }
      
      // Validate SMTP configuration
      if (config.smtpConfig.host.isEmpty) {
        fieldErrors['smtpHost'] = 'SMTP host is required';
      }
      
      if (config.smtpConfig.port <= 0 || config.smtpConfig.port > 65535) {
        fieldErrors['smtpPort'] = 'Invalid SMTP port';
      }
      
      // Check for insecure configurations
      if (config.hasInsecureConfig) {
        warnings.add('This configuration uses insecure connections');
      }
      
      final result = AccountValidationResult(
        isValid: fieldErrors.isEmpty,
        fieldErrors: fieldErrors.isNotEmpty ? fieldErrors : null,
        warnings: warnings.isNotEmpty ? warnings : null,
      );
      
      return (left: null, right: result);
    } catch (e) {
      AppLogger.error('Account validation failed', e);
      return (
        left: Failure.unknown(message: 'Validation failed: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, AccountCapabilities>> getAccountCapabilities(String accountId) async {
    try {
      final account = await _localStorage.getAccount(accountId);
      if (account == null) {
        return (
          left: const Failure.storage(message: 'Account not found'),
          right: null,
        );
      }
      
      // Test IMAP connection to get capabilities
      final imapResult = await MailClientFactory.testImapConnection(account);
      
      if (!imapResult.success) {
        return (
          left: Failure.mail(message: 'Failed to get capabilities: ${imapResult.error}'),
          right: null,
        );
      }
      
      final capabilities = AccountCapabilities(
        supportsIdle: imapResult.supportsIdle,
        supportsMove: imapResult.supportsMove,
        supportsSort: imapResult.supportsSort,
        supportsSearch: imapResult.supportsSearch,
        supportsQuota: imapResult.supportsQuota,
        supportsUidPlus: imapResult.supportsUidPlus,
        supportedExtensions: imapResult.capabilities,
      );
      
      return (left: null, right: capabilities);
    } catch (e) {
      AppLogger.error('Failed to get account capabilities', e);
      return (
        left: Failure.mail(message: 'Failed to get capabilities: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> setDefaultAccount(String accountId) async {
    try {
      // Check if account exists
      final account = await _localStorage.getAccount(accountId);
      if (account == null) {
        return (
          left: const Failure.storage(message: 'Account not found'),
          right: null,
        );
      }
      
      await _localStorage.setDefaultAccountId(accountId);
      AppLogger.info('Set default account: ${account.displayName}');
      return (left: null, right: null);
    } catch (e) {
      AppLogger.error('Failed to set default account', e);
      return (
        left: Failure.storage(message: 'Failed to set default account: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  @override
  Future<Either<Failure, MailAccountConfig?>> getDefaultAccount() async {
    try {
      final account = await _localStorage.getDefaultAccount();
      return (left: null, right: account);
    } catch (e) {
      AppLogger.error('Failed to get default account', e);
      return (
        left: Failure.storage(message: 'Failed to get default account: ${e.toString()}'),
        right: null,
      );
    }
  }
  
  /// Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
