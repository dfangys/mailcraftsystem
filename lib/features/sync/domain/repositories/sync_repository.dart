import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/sync/domain/models/sync_availability.dart';
import 'package:mailcraftsystem/features/sync/domain/models/sync_status.dart';

/// Sync repository interface
abstract class SyncRepository {
  /// Start sync for an account
  Future<({Failure? left, [^}]* right})> startSync(String accountId);
  
  /// Stop sync for an account
  Future<({Failure? left, [^}]* right})> stopSync(String accountId);
  
  /// Pause sync for an account
  Future<({Failure? left, [^}]* right})> pauseSync(String accountId);
  
  /// Resume sync for an account
  Future<({Failure? left, [^}]* right})> resumeSync(String accountId);
  
  /// Get sync status for an account
  Future<({Failure? left, [^}]* right})> getSyncStatus(String accountId);
  
  /// Get sync configuration for an account
  Future<({Failure? left, [^}]* right})> getSyncConfiguration(String accountId);
  
  /// Update sync configuration for an account
  Future<({Failure? left, [^}]* right})> updateSyncConfiguration(
    String accountId,
    SyncConfiguration configuration,
  );
  
  /// Get sync history for an account
  Future<({Failure? left, [^}]* right})>> getSyncHistory(
    String accountId, {
    int? limit,
    DateTime? since,
  });
  
  /// Force sync specific mailbox
  Future<({Failure? left, [^}]* right})> syncMailbox(
    String accountId,
    String mailboxPath,
  );
  
  /// Get last sync result for an account
  Future<({Failure? left, [^}]* right})> getLastSyncResult(String accountId);
  
  /// Check if sync is available (network, permissions, etc.)
  Future<({Failure? left, [^}]* right})> checkSyncAvailability(String accountId);
  
  /// Estimate sync time and data usage
  Future<({Failure? left, [^}]* right})> estimateSync(String accountId);
  
  /// Get sync statistics
  Future<({Failure? left, [^}]* right})> getSyncStatistics(String accountId);
  
  /// Reset sync state (clear cache, restart)
  Future<({Failure? left, [^}]* right})> resetSync(String accountId);
  
  /// Stream of sync status updates
  Stream<SyncStatus> watchSyncStatus(String accountId);
  
  /// Stream of sync progress updates
  Stream<SyncProgress> watchSyncProgress(String accountId);
}
