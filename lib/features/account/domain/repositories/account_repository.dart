import '../models/account_connection_result.dart';
import '../models/mail_account_config.dart';
import '../models/mail_provider_preset.dart';
import '../../../../core/error/failures.dart';

/// Account repository interface
abstract class AccountRepository {
  /// Get all configured accounts
  Future<({Failure? left, List<MailAccountConfig>? right})> getAccounts();
  
  /// Get account by ID
  Future<({Failure? left, MailAccountConfig? right})> getAccount(String id);
  
  /// Add new account
  Future<({Failure? left, MailAccountConfig? right})> addAccount(MailAccountConfig config);
  
  /// Update existing account
  Future<({Failure? left, MailAccountConfig? right})> updateAccount(MailAccountConfig config);
  
  /// Delete account
  Future<({Failure? left, void right})> deleteAccount(String id);
  
  /// Test account connection
  Future<({Failure? left, AccountConnectionResult? right})> testConnection(MailAccountConfig config);
  
  /// Get available provider presets
  Future<({Failure? left, List<MailProviderPreset>? right})> getProviderPresets();
  
  /// Find preset by email domain
  Future<({Failure? left, MailProviderPreset? right})> findPresetByEmail(String email);
  
  /// Validate account configuration
  Future<({Failure? left, AccountValidationResult? right})> validateAccount(MailAccountConfig config);
  
  /// Get account capabilities
  Future<({Failure? left, AccountCapabilities? right})> getAccountCapabilities(String accountId);
  
  /// Set default account
  Future<({Failure? left, void right})> setDefaultAccount(String accountId);
  
  /// Get default account
  Future<({Failure? left, MailAccountConfig? right})> getDefaultAccount();
}

/// Account validation result
class AccountValidationResult {
  /// Creates an account validation result
  const AccountValidationResult({
    required this.isValid,
    this.errors = const [],
  });

  /// Whether the account configuration is valid
  final bool isValid;

  /// List of validation errors
  final List<String> errors;
}

/// Account capabilities
class AccountCapabilities {
  /// Creates account capabilities
  const AccountCapabilities({
    this.supportsIdle = false,
    this.supportsSort = false,
    this.supportsMove = false,
    this.supportsQuota = false,
    this.maxMessageSize,
  });

  /// Whether IDLE is supported
  final bool supportsIdle;

  /// Whether SORT is supported
  final bool supportsSort;

  /// Whether MOVE is supported
  final bool supportsMove;

  /// Whether QUOTA is supported
  final bool supportsQuota;

  /// Maximum message size in bytes
  final int? maxMessageSize;
}
