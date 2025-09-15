import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/compose/domain/models/compose_message.dart';
import 'package:mailcraftsystem/features/compose/domain/models/compose_validation.dart';

/// Compose repository interface
abstract class ComposeRepository {
  /// Send a composed message
  Future<Either<Failure, void>> sendMessage(ComposeMessage message);

  /// Save message as draft
  Future<Either<Failure, void>> saveDraft(ComposeMessage message);

  /// Get all drafts for an account
  Future<Either<Failure, List<ComposeMessage>>> getDrafts(String accountId);

  /// Get a specific draft by ID
  Future<Either<Failure, ComposeMessage>> getDraft(String id);

  /// Delete a draft
  Future<Either<Failure, void>> deleteDraft(String id);

  /// Schedule a message for later sending
  Future<Either<Failure, void>> scheduleMessage(
    ComposeMessage message,
    DateTime scheduledAt,
  );

  /// Get scheduled messages
  Future<Either<Failure, List<ComposeMessage>>> getScheduledMessages(
      String accountId,);

  /// Cancel a scheduled message
  Future<Either<Failure, void>> cancelScheduledMessage(String id);

  /// Upload attachment
  Future<Either<Failure, String>> uploadAttachment(
    String accountId,
    String filePath,
    String fileName,
    String? mimeType,
  );

  /// Remove attachment
  Future<Either<Failure, void>> removeAttachment(String attachmentId);

  /// Validate message before sending
  Future<Either<Failure, MessageValidationResult>> validateMessage(
    ComposeMessage message,
  );

  /// Get message size estimate
  Future<Either<Failure, int>> getMessageSizeEstimate(
    ComposeMessage message,
  );

  /// Check if recipient addresses are valid
  Future<Either<Failure, List<String>>> validateAddresses(
    List<String> addresses,
  );

  /// Get auto-complete suggestions for addresses
  Future<Either<Failure, List<String>>> getAddressSuggestions(
    String query,
    String accountId,
  );

  /// Import contacts for auto-complete
  Future<Either<Failure, void>> importContacts(
    String accountId,
    List<dynamic> contacts,
  );
}

