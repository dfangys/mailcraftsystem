import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/account/domain/models/account_connection_result.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_provider_preset.dart';

/// Account repository interface
abstract class AccountRepository {
  /// Get all configured accounts
  Future<Either<Failure, List<MailAccountConfig>>> getAccounts();

  /// Get account by ID
  Future<Either<Failure, MailAccountConfig>> getAccount(String id);

  /// Add new account
  Future<Either<Failure, MailAccountConfig>> addAccount(MailAccountConfig config);

  /// Update existing account
  Future<Either<Failure, MailAccountConfig>> updateAccount(MailAccountConfig config);

  /// Delete account
  Future<Either<Failure, void>> deleteAccount(String id);

  /// Test account connection
  Future<Either<Failure, AccountConnectionResult>> testConnection(
      MailAccountConfig config,);

  /// Get available provider presets
  Future<Either<Failure, List<MailProviderPreset>>> getProviderPresets();

  /// Find preset by email domain
  Future<Either<Failure, MailProviderPreset>> findPresetByEmail(String email);

  /// Validate account configuration
  Future<Either<Failure, AccountValidationResult>> validateAccount(
      MailAccountConfig config,);

  /// Get account capabilities
  Future<Either<Failure, AccountCapabilities>> getAccountCapabilities(
      String accountId,);

  /// Set default account
  Future<Either<Failure, void>> setDefaultAccount(String accountId);

  /// Get default account
  Future<Either<Failure, MailAccountConfig>> getDefaultAccount();
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

