import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/core/logging/logger.dart';
import 'package:mailcraftsystem/features/account/data/datasources/account_local_storage.dart';
import 'package:mailcraftsystem/features/account/domain/models/account_connection_result.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_account_config.dart';
import 'package:mailcraftsystem/features/account/domain/models/mail_provider_preset.dart';
import 'package:mailcraftsystem/features/account/domain/repositories/account_repository.dart';

/// Implementation of account repository
class AccountRepositoryImpl implements AccountRepository {
  /// Creates account repository implementation
  const AccountRepositoryImpl({
    required this.localStorage,
  });

  /// Local storage service
  final AccountLocalStorage localStorage;

  @override
  Future<Either<Failure, AccountConnectionResult>> testConnection(
    MailAccountConfig config,
  ) async {
    try {
      AppLogger.info('Testing connection for ${config.email}');

      // Simulate connection test
      await Future.delayed(const Duration(seconds: 2));

      // Mock successful connection
      return const Right(
        AccountConnectionResult(
          isSuccess: true,
          details: 'Connection successful',
          capabilities: ['IMAP', 'SMTP'],
        ),
      );
    } catch (e, stackTrace) {
      AppLogger.error('Connection test failed', e, stackTrace);
      return Left(Failure.network(message: 'Connection test failed: $e'));
    }
  }

  @override
  Future<Either<Failure, MailAccountConfig>> addAccount(
    MailAccountConfig config,
  ) async {
    try {
      await localStorage.addAccount(config);
      AppLogger.info('Account added successfully for ${config.email}');
      return Right(config);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to add account', e, stackTrace);
      return Left(Failure.storage(message: 'Failed to add account: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MailAccountConfig>>> getAccounts() async {
    try {
      final accounts = await localStorage.getAccounts();
      return Right(accounts);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get accounts', e, stackTrace);
      return Left(Failure.storage(message: 'Failed to get accounts: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String accountId) async {
    try {
      await localStorage.deleteAccount(accountId);
      AppLogger.info('Account deleted successfully: $accountId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete account', e, stackTrace);
      return Left(Failure.storage(message: 'Failed to delete account: $e'));
    }
  }

  @override
  Future<Either<Failure, MailAccountConfig>> getAccount(
      String accountId) async {
    try {
      final account = await localStorage.getAccount(accountId);
      if (account != null) {
        return Right(account);
      }
      return Left(Failure.notFound(message: 'Account not found'));
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get account', e, stackTrace);
      return Left(Failure.storage(message: 'Failed to get account: $e'));
    }
  }

  @override
  Future<Either<Failure, MailAccountConfig>> updateAccount(
    MailAccountConfig config,
  ) async {
    try {
      await localStorage.updateAccount(config);
      AppLogger.info('Account updated successfully for ${config.email}');
      return Right(config);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update account', e, stackTrace);
      return Left(Failure.storage(message: 'Failed to update account: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MailProviderPreset>>> getProviderPresets() async {
    try {
      // Return built-in presets
      final presets = [
        const MailProviderPreset(
          id: 'gmail',
          name: 'gmail',
          displayName: 'Gmail',
          domains: ['gmail.com'],
          imapConfig: ImapConfig(
            host: 'imap.gmail.com',
            port: 993,
            socketType: SocketType.ssl,
          ),
          smtpConfig: SmtpConfig(
            host: 'smtp.gmail.com',
            port: 587,
            socketType: SocketType.starttls,
          ),
        ),
        const MailProviderPreset(
          id: 'outlook',
          name: 'outlook',
          displayName: 'Outlook',
          domains: ['outlook.com', 'hotmail.com'],
          imapConfig: ImapConfig(
            host: 'outlook.office365.com',
            port: 993,
            socketType: SocketType.ssl,
          ),
          smtpConfig: SmtpConfig(
            host: 'smtp-mail.outlook.com',
            port: 587,
            socketType: SocketType.starttls,
          ),
        ),
      ];
      return Right(presets);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get provider presets', e, stackTrace);
      return Left(
          Failure.unknown(message: 'Failed to get provider presets: $e'));
    }
  }

  @override
  Future<Either<Failure, MailProviderPreset>> findPresetByEmail(
      String email) async {
    try {
      final domain = email.split('@').last;
      final presetsResult = await getProviderPresets();

      return presetsResult.fold(
        (failure) => Left(failure),
        (presets) {
          try {
            final preset = presets.firstWhere(
              (p) => p.domains.contains(domain),
            );
            return Right(preset);
          } catch (e) {
            return Left(const Failure.unknown(
                message: 'No preset found for email domain'));
          }
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to find preset for email', e, stackTrace);
      return Left(
          const Failure.unknown(message: 'No preset found for email domain'));
    }
  }

  @override
  Future<Either<Failure, AccountValidationResult>> validateAccount(
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

      return Right(result);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to validate account', e, stackTrace);
      return Left(Failure.validation(message: 'Validation failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AccountCapabilities>> getAccountCapabilities(
    String accountId,
  ) async {
    try {
      // Mock capabilities
      const capabilities = AccountCapabilities(
        supportsIdle: true,
        supportsSort: true,
        supportsMove: true,
        maxMessageSize: 25 * 1024 * 1024, // 25MB
      );

      return const Right(capabilities);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get account capabilities', e, stackTrace);
      return Left(Failure.unknown(message: 'Failed to get capabilities: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultAccount(String accountId) async {
    try {
      await localStorage.setDefaultAccount(accountId);
      AppLogger.info('Default account set: $accountId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to set default account', e, stackTrace);
      return Left(
          Failure.storage(message: 'Failed to set default account: $e'));
    }
  }

  @override
  Future<Either<Failure, MailAccountConfig>> getDefaultAccount() async {
    try {
      final account = await localStorage.getDefaultAccount();
      if (account != null) {
        return Right(account);
      }
      return Left(Failure.notFound(message: 'No default account found'));
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get default account', e, stackTrace);
      return Left(
          Failure.storage(message: 'Failed to get default account: $e'));
    }
  }
}
