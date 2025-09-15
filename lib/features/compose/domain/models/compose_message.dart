import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mailcraftsystem/features/messages/domain/models/message.dart';

part 'compose_message.freezed.dart';
part 'compose_message.g.dart';

/// Compose message model for drafting emails
@freezed
/// ComposeMessage class
class ComposeMessage with _$ComposeMessage {
  const factory ComposeMessage({
    required String accountId, String? id,
    List<MessageAddress>? to,
    List<MessageAddress>? cc,
    List<MessageAddress>? bcc,
    String? subject,
    String? textContent,
    String? htmlContent,
    List<ComposeAttachment>? attachments,
    MessagePriority? priority,
    @Default(false) bool requestReadReceipt,
    @Default(false) bool requestDeliveryReceipt,
    ComposeType? composeType,
    String? originalMessageId,
    DateTime? createdAt,
    DateTime? lastModified,
    @Default(false) bool isDraft,
    @Default(false) bool isScheduled,
    DateTime? scheduledAt,
  }) = _ComposeMessage;

  factory ComposeMessage.fromJson(Map<String, dynamic> json) =>
      _$ComposeMessageFromJson(json);
}

/// Compose attachment model
@freezed
/// ComposeAttachment class
class ComposeAttachment with _$ComposeAttachment {
  const factory ComposeAttachment({
    required String id,
    required String name,
    required String path,
    String? mimeType,
    int? size,
    @Default(false) bool isInline,
    String? contentId,
    AttachmentSource? source,
  }) = _ComposeAttachment;

  factory ComposeAttachment.fromJson(Map<String, dynamic> json) =>
      _$ComposeAttachmentFromJson(json);
}

/// Compose type enumeration
enum ComposeType {
  @JsonValue('new')
  /// newMessage
  newMessage,
  @JsonValue('reply')
  /// reply
  reply,
  @JsonValue('reply_all')
  /// replyAll
  replyAll,
  @JsonValue('forward')
  /// forward
  forward,
}

/// Attachment source enumeration
enum AttachmentSource {
  @JsonValue('file')
  /// file
  file,
  @JsonValue('camera')
  /// camera
  camera,
  @JsonValue('gallery')
  /// gallery
  gallery,
  @JsonValue('cloud')
  /// cloud
  cloud,
}

/// Extension for compose type
extension ComposeTypeExtension on ComposeType {
  /// Get display name
  String get displayName {
    switch (this) {
      case ComposeType.newMessage:
        return 'New Message';
      case ComposeType.reply:
        return 'Reply';
      case ComposeType.replyAll:
        return 'Reply All';
      case ComposeType.forward:
        return 'Forward';
    }
  }
  
  /// Get subject prefix
  String get subjectPrefix {
    switch (this) {
      case ComposeType.newMessage:
        return '';
      case ComposeType.reply:
      case ComposeType.replyAll:
        return 'Re: ';
      case ComposeType.forward:
        return 'Fwd: ';
    }
  }
}

/// Extension for attachment source
extension AttachmentSourceExtension on AttachmentSource {
  /// Get display name
  String get displayName {
    switch (this) {
      case AttachmentSource.file:
        return 'File';
      case AttachmentSource.camera:
        return 'Camera';
      case AttachmentSource.gallery:
        return 'Gallery';
      case AttachmentSource.cloud:
        return 'Cloud Storage';
    }
  }
  
  /// Get icon name
  String get iconName {
    switch (this) {
      case AttachmentSource.file:
        return 'file';
      case AttachmentSource.camera:
        return 'camera';
      case AttachmentSource.gallery:
        return 'image';
      case AttachmentSource.cloud:
        return 'cloud';
    }
  }
}

/// Extension for compose attachment
extension ComposeAttachmentExtension on ComposeAttachment {
  /// Check if attachment is an image
  bool get isImage {
    if (mimeType == null) return false;
    return mimeType!.startsWith('image/');
  }
  
  /// Check if attachment is a document
  bool get isDocument {
    if (mimeType == null) return false;
    return mimeType!.startsWith('application/') ||
           mimeType!.startsWith('text/');
  }
  
  /// Get file extension from name
  String? get fileExtension {
    final lastDot = name.lastIndexOf('.');
    if (lastDot == -1) return null;
    return name.substring(lastDot + 1).toLowerCase();
  }
  
  /// Get formatted size string
  String get formattedSize {
    if (size == null) return 'Unknown size';
    
    const units = ['B', 'KB', 'MB', 'GB'];
    var fileSize = size!.toDouble();
    var unitIndex = 0;
    
    while (fileSize >= 1024 && unitIndex < units.length - 1) {
      fileSize /= 1024;
      unitIndex++;
    }
    
    return '${fileSize.toStringAsFixed(1)} ${units[unitIndex]}';
  }
}

/// Extension for compose message
extension ComposeMessageExtension on ComposeMessage {
  /// Check if message has recipients
  bool get hasRecipients {
    return (to?.isNotEmpty ?? false) ||
           (cc?.isNotEmpty ?? false) ||
           (bcc?.isNotEmpty ?? false);
  }
  
  /// Get total recipient count
  int get recipientCount {
    return (to?.length ?? 0) + (cc?.length ?? 0) + (bcc?.length ?? 0);
  }
  
  /// Check if message has content
  bool get hasContent {
    return (textContent?.isNotEmpty ?? false) ||
           (htmlContent?.isNotEmpty ?? false);
  }
  
  /// Check if message has attachments
  bool get hasAttachments => attachments?.isNotEmpty ?? false;
  
  /// Get attachment count
  int get attachmentCount => attachments?.length ?? 0;
  
  /// Get total attachment size
  int get totalAttachmentSize {
    if (attachments == null) return 0;
    return attachments!.fold(0, (sum, attachment) => sum + (attachment.size ?? 0));
  }
  
  /// Get formatted total attachment size
  String get formattedTotalAttachmentSize {
    final totalSize = totalAttachmentSize;
    if (totalSize == 0) return '0 B';
    
    const units = ['B', 'KB', 'MB', 'GB'];
    var fileSize = totalSize.toDouble();
    var unitIndex = 0;
    
    while (fileSize >= 1024 && unitIndex < units.length - 1) {
      fileSize /= 1024;
      unitIndex++;
    }
    
    return '${fileSize.toStringAsFixed(1)} ${units[unitIndex]}';
  }
  
  /// Check if message is ready to send
  bool get isReadyToSend {
    return hasRecipients && 
           (hasContent || hasAttachments) &&
           (subject?.isNotEmpty ?? false);
  }
  
  /// Get validation errors
  List<String> get validationErrors {
    final errors = <String>[];
    
    if (!hasRecipients) {
      errors.add('At least one recipient is required');
    }
    
    if (subject?.isEmpty ?? false) {
      errors.add('Subject is required');
    }
    
    if (!hasContent && !hasAttachments) {
      errors.add('Message content or attachments are required');
    }
    
    return errors;
  }
  
  /// Create a new message
  static ComposeMessage newMessage({
    required String accountId,
  }) {
    return ComposeMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      accountId: accountId,
      composeType: ComposeType.newMessage,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
    );
  }
  
  /// Create a reply message
  static ComposeMessage reply({
    required String accountId,
    required Message originalMessage,
    bool replyAll = false,
  }) {
    final to = <MessageAddress>[];
    final cc = <MessageAddress>[];
    
    // Add original sender to 'to'
    if (originalMessage.from != null) {
      to.add(originalMessage.from!);
    }
    
    // If reply all, add original recipients to 'cc'
    if (replyAll) {
      if (originalMessage.to != null) {
        cc.addAll(originalMessage.to!);
      }
      if (originalMessage.cc != null) {
        cc.addAll(originalMessage.cc!);
      }
    }
    
    // Remove duplicates and self
    // TODO: Implement self-removal logic based on account email
    
    final subject = originalMessage.subject?.startsWith('Re: ') ?? false
        ? originalMessage.subject
        : 'Re: ${originalMessage.subject ?? ''}';
    
    return ComposeMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      accountId: accountId,
      to: to.isNotEmpty ? to : null,
      cc: cc.isNotEmpty ? cc : null,
      subject: subject,
      composeType: replyAll ? ComposeType.replyAll : ComposeType.reply,
      originalMessageId: originalMessage.id,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
    );
  }
  
  /// Create a forward message
  static ComposeMessage forward({
    required String accountId,
    required Message originalMessage,
  }) {
    final subject = originalMessage.subject?.startsWith('Fwd: ') ?? false
        ? originalMessage.subject
        : 'Fwd: ${originalMessage.subject ?? ''}';
    
    // Include original message content
    final forwardedContent = _buildForwardedContent(originalMessage);
    
    return ComposeMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      accountId: accountId,
      subject: subject,
      textContent: forwardedContent,
      composeType: ComposeType.forward,
      originalMessageId: originalMessage.id,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
    );
  }
  
  /// Build forwarded message content
  static String _buildForwardedContent(Message originalMessage) {
    final buffer = StringBuffer();
    
    buffer.writeln('\n\n---------- Forwarded message ----------');
    buffer.writeln('From: ${originalMessage.from?.formatted ?? 'Unknown'}');
    buffer.writeln('Date: ${originalMessage.formattedDate}');
    buffer.writeln('Subject: ${originalMessage.subject ?? '(No Subject)'}');
    
    if (originalMessage.to?.isNotEmpty ?? false) {
      buffer.writeln('To: ${originalMessage.to!.map((a) => a.formatted).join(', ')}');
    }
    
    if (originalMessage.cc?.isNotEmpty ?? false) {
      buffer.writeln('Cc: ${originalMessage.cc!.map((a) => a.formatted).join(', ')}');
    }
    
    buffer.writeln();
    buffer.writeln(originalMessage.textPlain ?? originalMessage.previewText);
    
    return buffer.toString();
  }
}
