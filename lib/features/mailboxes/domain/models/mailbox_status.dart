import 'package:freezed_annotation/freezed_annotation.dart';

part 'mailbox_status.freezed.dart';
part 'mailbox_status.g.dart';

/// Mailbox status model
@freezed

/// MailboxStatus class
class MailboxStatus with _$MailboxStatus {
  const factory MailboxStatus({
    required String path,
    required int messageCount,
    required int unreadCount,
    required int recentCount,
    int? uidNext,
    int? uidValidity,
    DateTime? lastSync,
    bool? isSelectable,
  }) = _MailboxStatus;

  factory MailboxStatus.fromJson(Map<String, dynamic> json) =>
      _$MailboxStatusFromJson(json);
}

/// Mailbox operation result
@freezed

/// MailboxOperationResult class
class MailboxOperationResult with _$MailboxOperationResult {
  const factory MailboxOperationResult({
    required bool success,
    String? message,
    // Note: Mailbox import would create circular dependency
    Map<String, dynamic>? mailboxData,
  }) = _MailboxOperationResult;

  factory MailboxOperationResult.fromJson(Map<String, dynamic> json) =>
      _$MailboxOperationResultFromJson(json);
}

/// Extension for mailbox status
extension MailboxStatusExtension on MailboxStatus {
  /// Check if mailbox has unread messages
  bool get hasUnread => unreadCount > 0;

  /// Check if mailbox is empty
  bool get isEmpty => messageCount == 0;

  /// Get unread percentage
  double get unreadPercentage {
    if (messageCount == 0) return 0;
    return (unreadCount / messageCount) * 100;
  }

  /// Check if sync is recent (within last hour)
  bool get isRecentlySync {
    if (lastSync == null) return false;
    return DateTime.now().difference(lastSync!).inHours < 1;
  }
}
