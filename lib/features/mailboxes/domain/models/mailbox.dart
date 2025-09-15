import 'package:enough_mail/enough_mail.dart' as enough_mail;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mailbox.freezed.dart';
part 'mailbox.g.dart';

/// Mailbox model representing an IMAP folder
@freezed
/// Mailbox class
class Mailbox with _$Mailbox {
  const factory Mailbox({
    required String id,
    required String name,
    required String path,
    required MailboxType type,
    @Default(0) int messageCount,
    @Default(0) int unreadCount,
    @Default(0) int recentCount,
    @Default(false) bool isSelectable,
    @Default(false) bool hasChildren,
    @Default(false) bool isSubscribed,
    List<MailboxFlag>? flags,
    String? parentPath,
    List<Mailbox>? children,
    DateTime? lastSync,
  }) = _Mailbox;

  factory Mailbox.fromJson(Map<String, dynamic> json) =>
      _$MailboxFromJson(json);

  factory Mailbox.fromEnoughMail(enough_mail.Mailbox mailbox) {
    return Mailbox(
      id: mailbox.path,
      name: mailbox.name,
      path: mailbox.path,
      type: _getMailboxType(mailbox),
      isSelectable: !mailbox.isNotSelectable,
      hasChildren: mailbox.hasChildren,
    );
  }
}

/// Mailbox type enumeration
enum MailboxType {
  @JsonValue('inbox')
  /// inbox
  inbox,
  @JsonValue('sent')
  /// sent
  sent,
  @JsonValue('drafts')
  /// drafts
  drafts,
  @JsonValue('trash')
  /// trash
  trash,
  @JsonValue('spam')
  /// spam
  spam,
  @JsonValue('archive')
  /// archive
  archive,
  @JsonValue('custom')
  /// custom
  custom,
  @JsonValue('unknown')
  /// unknown
  unknown,
}

/// Mailbox flags
enum MailboxFlag {
  @JsonValue('noselect')
  /// noselect
  noselect,
  @JsonValue('noinferiors')
  /// noinferiors
  noinferiors,
  @JsonValue('marked')
  /// marked
  marked,
  @JsonValue('unmarked')
  /// unmarked
  unmarked,
  @JsonValue('haschildren')
  /// haschildren
  haschildren,
  @JsonValue('hasnochildren')
  /// hasnochildren
  hasnochildren,
}

/// Extension for mailbox type
extension MailboxTypeExtension on MailboxType {
  /// Get display name for the mailbox type
  String get displayName {
    switch (this) {
      case MailboxType.inbox:
        return 'Inbox';
      case MailboxType.sent:
        return 'Sent';
      case MailboxType.drafts:
        return 'Drafts';
      case MailboxType.trash:
        return 'Trash';
      case MailboxType.spam:
        return 'Spam';
      case MailboxType.archive:
        return 'Archive';
      case MailboxType.custom:
        return 'Custom';
      case MailboxType.unknown:
        return 'Unknown';
    }
  }
  
  /// Get icon name for the mailbox type
  String get iconName {
    switch (this) {
      case MailboxType.inbox:
        return 'inbox';
      case MailboxType.sent:
        return 'send';
      case MailboxType.drafts:
        return 'draft';
      case MailboxType.trash:
        return 'delete';
      case MailboxType.spam:
        return 'spam';
      case MailboxType.archive:
        return 'archive';
      case MailboxType.custom:
        return 'folder';
      case MailboxType.unknown:
        return 'folder';
    }
  }
  
  /// Check if this is a system mailbox
  bool get isSystem {
    return this != MailboxType.custom && this != MailboxType.unknown;
  }
}

/// Extension for mailbox model
extension MailboxExtension on Mailbox {
  /// Get display name (use type display name for system folders)
  String get displayName {
    if (type.isSystem) {
      return type.displayName;
    }
    return name;
  }
  
  /// Check if mailbox has unread messages
  bool get hasUnread => unreadCount > 0;
  
  /// Check if mailbox is empty
  bool get isEmpty => messageCount == 0;
  
  /// Get unread count display string
  String get unreadCountDisplay {
    if (unreadCount == 0) return '';
    if (unreadCount > 999) return '999+';
    return unreadCount.toString();
  }
  
  /// Check if mailbox can be deleted
  bool get canDelete => type == MailboxType.custom;
  
  /// Check if mailbox can be renamed
  bool get canRename => type == MailboxType.custom;
  
  /// Get full hierarchy path
  String get hierarchyPath {
    if (parentPath == null) return name;
    return '$parentPath/$name';
  }
  
  /// Convert from enough_mail Mailbox
  static Mailbox fromEnoughMail(enough_mail.Mailbox enoughMailbox) {
    return Mailbox(
      id: enoughMailbox.path,
      name: enoughMailbox.name,
      path: enoughMailbox.path,
      type: _getMailboxType(enoughMailbox),
      messageCount: enoughMailbox.messagesExists ?? 0,
      unreadCount: enoughMailbox.messagesUnseen ?? 0,
      recentCount: enoughMailbox.messagesRecent ?? 0,
      isSelectable: !enoughMailbox.isNotSelectable,
      hasChildren: enoughMailbox.hasChildren,
      isSubscribed: enoughMailbox.hasFlag(enough_mail.MailboxFlag.subscribed),
      flags: _getMailboxFlags(enoughMailbox),
      parentPath: _getParentPath(enoughMailbox.path),
    );
  }
  
  /// Convert to enough_mail Mailbox
  enough_mail.Mailbox toEnoughMail() {
    final flags = <enough_mail.MailboxFlag>[];
    if (isSubscribed) {
      flags.add(enough_mail.MailboxFlag.subscribed);
    }
    
    final enoughMailbox = enough_mail.Mailbox(
      encodedName: name,
      encodedPath: path,
      flags: flags,
      pathSeparator: '/',
      messagesExists: messageCount,
      messagesUnseen: unreadCount,
      messagesRecent: recentCount,
    );
    
    return enoughMailbox;
  }
  
  /// Determine mailbox type from enough_mail Mailbox
  static MailboxType _getMailboxType(enough_mail.Mailbox mailbox) {
    final name = mailbox.name.toLowerCase();
    final path = mailbox.path.toLowerCase();
    
    // Check for common inbox patterns
    if (name == 'inbox' || path.contains('inbox')) {
      return MailboxType.inbox;
    }
    
    // Check for sent patterns
    if (name.contains('sent') || path.contains('sent') ||
        name.contains('outbox') || path.contains('outbox')) {
      return MailboxType.sent;
    }
    
    // Check for drafts patterns
    if (name.contains('draft') || path.contains('draft')) {
      return MailboxType.drafts;
    }
    
    // Check for trash patterns
    if (name.contains('trash') || path.contains('trash') ||
        name.contains('deleted') || path.contains('deleted') ||
        name.contains('bin') || path.contains('bin')) {
      return MailboxType.trash;
    }
    
    // Check for spam patterns
    if (name.contains('spam') || path.contains('spam') ||
        name.contains('junk') || path.contains('junk')) {
      return MailboxType.spam;
    }
    
    // Check for archive patterns
    if (name.contains('archive') || path.contains('archive')) {
      return MailboxType.archive;
    }
    
    return MailboxType.custom;
  }
  
  /// Get parent path from mailbox path
  static String? _getParentPath(String path) {
    final lastSeparatorIndex = path.lastIndexOf('/');
    if (lastSeparatorIndex <= 0) return null;
    return path.substring(0, lastSeparatorIndex);
  }
  
  /// Get mailbox flags from enough_mail Mailbox
  static List<MailboxFlag>? _getMailboxFlags(enough_mail.Mailbox mailbox) {
    final flags = <MailboxFlag>[];
    
    if (mailbox.isNotSelectable) flags.add(MailboxFlag.noselect);
    if (!mailbox.hasChildren) flags.add(MailboxFlag.hasnochildren);
    if (mailbox.hasChildren) flags.add(MailboxFlag.haschildren);
    if (mailbox.isMarked) flags.add(MailboxFlag.marked);
    if (!mailbox.isMarked) flags.add(MailboxFlag.unmarked);
    
    return flags.isNotEmpty ? flags : null;
  }
}


MailboxType _getMailboxType(enough_mail.Mailbox mailbox) {
  final name = mailbox.name.toLowerCase();
  final path = mailbox.path.toLowerCase();
  
  // Check for common inbox patterns
  if (name == 'inbox' || path.contains('inbox')) {
    return MailboxType.inbox;
  }
  
  // Check for sent patterns
  if (name.contains('sent') || path.contains('sent') ||
      name.contains('outbox') || path.contains('outbox')) {
    return MailboxType.sent;
  }
  
  // Check for drafts patterns
  if (name.contains('draft') || path.contains('draft')) {
    return MailboxType.drafts;
  }
  
  // Check for trash patterns
  if (name.contains('trash') || path.contains('trash') ||
      name.contains('deleted') || path.contains('deleted') ||
      name.contains('bin') || path.contains('bin')) {
    return MailboxType.trash;
  }
  
  // Check for spam patterns
  if (name.contains('spam') || path.contains('spam') ||
      name.contains('junk') || path.contains('junk')) {
    return MailboxType.spam;
  }
  
  // Check for archive patterns
  if (name.contains('archive') || path.contains('archive')) {
    return MailboxType.archive;
  }
  
  return MailboxType.custom;
}

