import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/sync/domain/models/sync_availability.dart';
import 'package:mailcraftsystem/features/sync/domain/models/sync_status.dart';

/// Sync repository interface
abstract class SyncRepository {
  /// Start sync for an account
  Future<Either<Failure, void>> startSync(String accountId);

  /// Stop sync for an account
  Future<Either<Failure, void>> stopSync(String accountId);

  /// Pause sync for an account
  Future<Either<Failure, void>> pauseSync(String accountId);

  /// Resume sync for an account
  Future<Either<Failure, void>> resumeSync(String accountId);

  /// Get sync status for an account
  Future<Either<Failure, SyncStatus>> getSyncStatus(String accountId);

  /// Get sync configuration for an account
  Future<Either<Failure, dynamic>> getSyncConfiguration(String accountId);

  /// Update sync configuration for an account
  Future<Either<Failure, void>> updateSyncConfiguration(
    String accountId,
    dynamic configuration,
  );

  /// Get sync history for an account
  Future<Either<Failure, List<dynamic>>> getSyncHistory(
    String accountId, {
    int? limit,
    DateTime? since,
  });

  /// Force sync specific mailbox
  Future<Either<Failure, void>> syncMailbox(
    String accountId,
    String mailboxPath,
  );

  /// Get last sync result for an account
  Future<Either<Failure, dynamic>> getLastSyncResult(String accountId);

  /// Check if sync is available (network, permissions, etc.)
  Future<Either<Failure, SyncAvailability>> checkSyncAvailability(
    String accountId,
  );

  /// Estimate sync time and data usage
  Future<Either<Failure, dynamic>> estimateSync(String accountId);

  /// Get sync statistics
  Future<Either<Failure, dynamic>> getSyncStatistics(String accountId);

  /// Reset sync state (clear cache, restart)
  Future<Either<Failure, void>> resetSync(String accountId);

  /// Stream of sync status updates
  Stream<SyncStatus> watchSyncStatus(String accountId);

  /// Stream of sync progress updates
  Stream<dynamic> watchSyncProgress(String accountId);
}
