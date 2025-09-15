import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';
import 'package:mailcraftsystem/features/compose/domain/models/compose_message.dart';
import 'package:mailcraftsystem/features/compose/domain/models/compose_validation.dart';

/// Compose repository interface
abstract class ComposeRepository {
  /// Send a composed message
  Future<({Failure? left, [^}]* right})> sendMessage(ComposeMessage message);
  
  /// Save message as draft
  Future<({Failure? left, [^}]* right})> saveDraft(ComposeMessage message);
  
  /// Get all drafts for an account
  Future<({Failure? left, [^}]* right})>> getDrafts(String accountId);
  
  /// Get a specific draft by ID
  Future<({Failure? left, [^}]* right})> getDraft(String id);
  
  /// Delete a draft
  Future<({Failure? left, [^}]* right})> deleteDraft(String id);
  
  /// Schedule a message for later sending
  Future<({Failure? left, [^}]* right})> scheduleMessage(
    ComposeMessage message,
    DateTime scheduledAt,
  );
  
  /// Get scheduled messages
  Future<({Failure? left, [^}]* right})>> getScheduledMessages(String accountId);
  
  /// Cancel a scheduled message
  Future<({Failure? left, [^}]* right})> cancelScheduledMessage(String id);
  
  /// Upload attachment
  Future<({Failure? left, [^}]* right})> uploadAttachment(
    String accountId,
    String filePath,
    String fileName,
    String? mimeType,
  );
  
  /// Remove attachment
  Future<({Failure? left, [^}]* right})> removeAttachment(String attachmentId);
  
  /// Validate message before sending
  Future<({Failure? left, [^}]* right})> validateMessage(
    ComposeMessage message,
  );
  
  /// Get message size estimate
  Future<({Failure? left, [^}]* right})> getMessageSizeEstimate(
    ComposeMessage message,
  );
  
  /// Check if recipient addresses are valid
  Future<({Failure? left, [^}]* right})>> validateAddresses(
    List<String> addresses,
  );
  
  /// Get auto-complete suggestions for addresses
  Future<({Failure? left, [^}]* right})>> getAddressSuggestions(
    String query,
    String accountId,
  );
  
  /// Import contacts for auto-complete
  Future<({Failure? left, [^}]* right})> importContacts(
    String accountId,
    List<ContactInfo> contacts,
  );
}
