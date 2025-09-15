import 'package:enough_mail/enough_mail.dart' as enough_mail;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// Email message model
@freezed
/// Message class
class Message with _$Message {
  const factory Message({
    required String id,
    required int uid,
    required String mailboxPath,
    String? messageId,
    String? subject,
    MessageAddress? from,
    List<MessageAddress>? to,
    List<MessageAddress>? cc,
    List<MessageAddress>? bcc,
    List<MessageAddress>? replyTo,
    DateTime? date,
    @Default(false) bool isRead,
    @Default(false) bool isFlagged,
    @Default(false) bool isAnswered,
    @Default(false) bool isDraft,
    @Default(false) bool isDeleted,
    @Default(false) bool isRecent,
    MessagePriority? priority,
    String? textPlain,
    String? textHtml,
    List<MessageAttachment>? attachments,
    int? size,
    List<String>? flags,
    String? inReplyTo,
    List<String>? references,
    DateTime? receivedAt,
    String? preview,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

/// Message address model
@freezed
/// MessageAddress class
class MessageAddress with _$MessageAddress {
  const factory MessageAddress({
    String? name,
    required String email,
  }) = _MessageAddress;

  factory MessageAddress.fromJson(Map<String, dynamic> json) =>
      _$MessageAddressFromJson(json);
}

/// Message attachment model
@freezed
/// MessageAttachment class
class MessageAttachment with _$MessageAttachment {
  const factory MessageAttachment({
    required String id,
    required String name,
    String? mimeType,
    int? size,
    @Default(false) bool isInline,
    String? contentId,
    String? disposition,
  }) = _MessageAttachment;

  factory MessageAttachment.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachmentFromJson(json);
}

/// Message priority enumeration
enum MessagePriority {
  @JsonValue('highest')
  /// highest
  highest,
  @JsonValue('high')
  /// high
  high,
  @JsonValue('normal')
  /// normal
  normal,
  @JsonValue('low')
  /// low
  low,
  @JsonValue('lowest')
  /// lowest
  lowest,
}

/// Extension for message address
extension MessageAddressExtension on MessageAddress {
  /// Get display name (name if available, otherwise email)
  String get displayName => name?.isNotEmpty == true ? name! : email;
  
  /// Get formatted address string
  String get formatted {
    if (name?.isNotEmpty == true) {
      return '$name <$email>';
    }
    return email;
  }
  
  /// Convert from enough_mail MailAddress
  static MessageAddress fromEnoughMail(enough_mail.MailAddress address) {
    return MessageAddress(
      name: address.personalName,
      email: address.email,
    );
  }
  
  /// Convert to enough_mail MailAddress
  enough_mail.MailAddress toEnoughMail() {
    return enough_mail.MailAddress(name, email);
  }
}

/// Extension for message attachment
extension MessageAttachmentExtension on MessageAttachment {
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
    double fileSize = size!.toDouble();
    int unitIndex = 0;
    
    while (fileSize >= 1024 && unitIndex < units.length - 1) {
      fileSize /= 1024;
      unitIndex++;
    }
    
    return '${fileSize.toStringAsFixed(1)} ${units[unitIndex]}';
  }
}

/// Extension for message priority
extension MessagePriorityExtension on MessagePriority {
  /// Get display name
  String get displayName {
    switch (this) {
      case MessagePriority.highest:
        return 'Highest';
      case MessagePriority.high:
        return 'High';
      case MessagePriority.normal:
        return 'Normal';
      case MessagePriority.low:
        return 'Low';
      case MessagePriority.lowest:
        return 'Lowest';
    }
  }
  
  /// Get priority level (1-5, where 1 is highest)
  int get level {
    switch (this) {
      case MessagePriority.highest:
        return 1;
      case MessagePriority.high:
        return 2;
      case MessagePriority.normal:
        return 3;
      case MessagePriority.low:
        return 4;
      case MessagePriority.lowest:
        return 5;
    }
  }
}

/// Extension for message model
extension MessageExtension on Message {
  /// Get sender display name
  String get senderName => from?.displayName ?? 'Unknown Sender';
  
  /// Get sender email
  String get senderEmail => from?.email ?? '';
  
  /// Get subject or default
  String get displaySubject => subject?.isNotEmpty == true ? subject! : '(No Subject)';
  
  /// Check if message has attachments
  bool get hasAttachments => attachments?.isNotEmpty == true;
  
  /// Get attachment count
  int get attachmentCount => attachments?.length ?? 0;
  
  /// Check if message is today
  bool get isToday {
    if (date == null) return false;
    final now = DateTime.now();
    return date!.year == now.year &&
           date!.month == now.month &&
           date!.day == now.day;
  }
  
  /// Check if message is from this week
  bool get isThisWeek {
    if (date == null) return false;
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    return date!.isAfter(weekStart);
  }
  
  /// Get formatted date string
  String get formattedDate {
    if (date == null) return '';
    
    final now = DateTime.now();
    final messageDate = date!;
    
    if (isToday) {
      return '${messageDate.hour.toString().padLeft(2, '0')}:${messageDate.minute.toString().padLeft(2, '0')}';
    }
    
    if (isThisWeek) {
      const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return weekdays[messageDate.weekday - 1];
    }
    
    return '${messageDate.day}/${messageDate.month}/${messageDate.year}';
  }
  
  /// Get message preview text
  String get previewText {
    if (preview?.isNotEmpty == true) return preview!;
    if (textPlain?.isNotEmpty == true) {
      return textPlain!.replaceAll(RegExp(r'\s+'), ' ').trim();
    }
    if (textHtml?.isNotEmpty == true) {
      // Simple HTML stripping for preview
      return textHtml!
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim();
    }
    return '';
  }
  
  /// Get truncated preview text
  String getTruncatedPreview(int maxLength) {
    final preview = previewText;
    if (preview.length <= maxLength) return preview;
    return '${preview.substring(0, maxLength)}...';
  }
  
  /// Convert from enough_mail MimeMessage
  static Message fromEnoughMail(
    enough_mail.MimeMessage mimeMessage,
    String mailboxPath,
  ) {
    return Message(
      id: '${mimeMessage.uid}-$mailboxPath',
      uid: mimeMessage.uid ?? 0,
      mailboxPath: mailboxPath,
      messageId: mimeMessage.decodeHeaderMailAddressValue('message-id')?.first.email,
      subject: mimeMessage.decodeSubject(),
      from: mimeMessage.from?.isNotEmpty == true
          ? MessageAddress.fromEnoughMail(mimeMessage.from!.first)
          : null,
      to: mimeMessage.to?.map(MessageAddress.fromEnoughMail).toList(),
      cc: mimeMessage.cc?.map(MessageAddress.fromEnoughMail).toList(),
      bcc: mimeMessage.bcc?.map(MessageAddress.fromEnoughMail).toList(),
      replyTo: mimeMessage.replyTo?.map(MessageAddress.fromEnoughMail).toList(),
      date: mimeMessage.decodeDate(),
      isRead: mimeMessage.isSeen,
      isFlagged: mimeMessage.isFlagged,
      isAnswered: mimeMessage.isAnswered,
      isDraft: mimeMessage.isDraft,
      isDeleted: mimeMessage.isDeleted,
      isRecent: mimeMessage.isRecent,
      priority: _getPriorityFromMime(mimeMessage),
      textPlain: mimeMessage.decodeTextPlainPart(),
      textHtml: mimeMessage.decodeTextHtmlPart(),
      attachments: _getAttachmentsFromMime(mimeMessage),
      size: mimeMessage.size,
      flags: mimeMessage.flags?.map((f) => f.name).toList(),
      inReplyTo: mimeMessage.decodeHeaderValue('in-reply-to'),
      references: mimeMessage.decodeHeaderValue('references')?.split(' '),
      receivedAt: DateTime.now(),
    );
  }
  
  /// Get priority from MIME message
  static MessagePriority? _getPriorityFromMime(enough_mail.MimeMessage message) {
    final priority = message.decodeHeaderValue('x-priority') ??
                    message.decodeHeaderValue('priority');
    
    if (priority == null) return MessagePriority.normal;
    
    switch (priority.toLowerCase()) {
      case '1':
      case 'highest':
        return MessagePriority.highest;
      case '2':
      case 'high':
        return MessagePriority.high;
      case '3':
      case 'normal':
        return MessagePriority.normal;
      case '4':
      case 'low':
        return MessagePriority.low;
      case '5':
      case 'lowest':
        return MessagePriority.lowest;
      default:
        return MessagePriority.normal;
    }
  }
  
  /// Get attachments from MIME message
  static List<MessageAttachment>? _getAttachmentsFromMime(
    enough_mail.MimeMessage message,
  ) {
    final attachments = <MessageAttachment>[];
    
    message.findContentInfo().forEach((contentInfo) {
      if (contentInfo.isAttachment) {
        attachments.add(
          MessageAttachment(
            id: contentInfo.fetchId ?? '',
            name: contentInfo.fileName ?? 'attachment',
            mimeType: contentInfo.contentType?.mediaType.text,
            size: contentInfo.size,
            isInline: contentInfo.disposition == enough_mail.ContentDisposition.inline,
            contentId: contentInfo.cid,
            disposition: contentInfo.disposition?.name,
          ),
        );
      }
    });
    
    return attachments.isNotEmpty ? attachments : null;
  }
}
