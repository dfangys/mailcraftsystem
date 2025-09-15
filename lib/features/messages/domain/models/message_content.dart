import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

part 'message_content.freezed.dart';
part 'message_content.g.dart';

/// Message content model
@freezed

/// MessageContent class
class MessageContent with _$MessageContent {
  const factory MessageContent({
    required String textPlain,
    String? textHtml,
    List<MessageAttachment>? attachments,
    List<MessageAttachment>? inlineAttachments,
  }) = _MessageContent;

  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
}

/// Attachment data model
@freezed

/// AttachmentData class
class AttachmentData with _$AttachmentData {
  const factory AttachmentData({
    required String name,
    required String mimeType,
    required List<int> data,
    int? size,
  }) = _AttachmentData;

  factory AttachmentData.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDataFromJson(json);
}

/// Message search criteria
@freezed

/// MessageSearchCriteria class
class MessageSearchCriteria with _$MessageSearchCriteria {
  const factory MessageSearchCriteria({
    String? query,
    String? from,
    String? to,
    String? subject,
    String? body,
    DateTime? since,
    DateTime? before,
    bool? isRead,
    bool? isFlagged,
    bool? hasAttachments,
    MessagePriority? priority,
  }) = _MessageSearchCriteria;

  factory MessageSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$MessageSearchCriteriaFromJson(json);
}

/// Message sort order
enum MessageSortOrder {
  @JsonValue('date_desc')

  /// dateDescending
  dateDescending,
  @JsonValue('date_asc')

  /// dateAscending
  dateAscending,
  @JsonValue('subject_asc')

  /// subjectAscending
  subjectAscending,
  @JsonValue('subject_desc')

  /// subjectDescending
  subjectDescending,
  @JsonValue('from_asc')

  /// fromAscending
  fromAscending,
  @JsonValue('from_desc')

  /// fromDescending
  fromDescending,
  @JsonValue('size_asc')

  /// sizeAscending
  sizeAscending,
  @JsonValue('size_desc')

  /// sizeDescending
  sizeDescending,
}

/// Extension for message sort order
extension MessageSortOrderExtension on MessageSortOrder {
  /// Get display name
  String get displayName {
    switch (this) {
      case MessageSortOrder.dateDescending:
        return 'Date (Newest First)';
      case MessageSortOrder.dateAscending:
        return 'Date (Oldest First)';
      case MessageSortOrder.subjectAscending:
        return 'Subject (A-Z)';
      case MessageSortOrder.subjectDescending:
        return 'Subject (Z-A)';
      case MessageSortOrder.fromAscending:
        return 'From (A-Z)';
      case MessageSortOrder.fromDescending:
        return 'From (Z-A)';
      case MessageSortOrder.sizeAscending:
        return 'Size (Smallest First)';
      case MessageSortOrder.sizeDescending:
        return 'Size (Largest First)';
    }
  }

  /// Check if this is a date sort
  bool get isDateSort {
    return this == MessageSortOrder.dateAscending ||
        this == MessageSortOrder.dateDescending;
  }

  /// Check if this is ascending order
  bool get isAscending {
    return this == MessageSortOrder.dateAscending ||
        this == MessageSortOrder.subjectAscending ||
        this == MessageSortOrder.fromAscending ||
        this == MessageSortOrder.sizeAscending;
  }
}

/// Extension for message search criteria
extension MessageSearchCriteriaExtension on MessageSearchCriteria {
  /// Check if criteria is empty
  bool get isEmpty {
    return query == null &&
        from == null &&
        to == null &&
        subject == null &&
        body == null &&
        since == null &&
        before == null &&
        isRead == null &&
        isFlagged == null &&
        hasAttachments == null &&
        priority == null;
  }

  /// Get search summary
  String get searchSummary {
    final parts = <String>[];

    if (query?.isNotEmpty ?? false) parts.add('Text: "$query"');
    if (from?.isNotEmpty ?? false) parts.add('From: "$from"');
    if (to?.isNotEmpty ?? false) parts.add('To: "$to"');
    if (subject?.isNotEmpty ?? false) parts.add('Subject: "$subject"');
    if (isRead != null) parts.add(isRead! ? 'Read' : 'Unread');
    if (isFlagged ?? false) parts.add('Flagged');
    if (hasAttachments ?? false) parts.add('Has Attachments');
    if (priority != null) parts.add('Priority: ${priority!.displayName}');

    return parts.join(', ');
  }
}
