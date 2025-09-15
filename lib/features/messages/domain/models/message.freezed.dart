// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  String get mailboxPath => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  MessageAddress? get from => throw _privateConstructorUsedError;
  List<MessageAddress>? get to => throw _privateConstructorUsedError;
  List<MessageAddress>? get cc => throw _privateConstructorUsedError;
  List<MessageAddress>? get bcc => throw _privateConstructorUsedError;
  List<MessageAddress>? get replyTo => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get isFlagged => throw _privateConstructorUsedError;
  bool get isAnswered => throw _privateConstructorUsedError;
  bool get isDraft => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  bool get isRecent => throw _privateConstructorUsedError;
  MessagePriority? get priority => throw _privateConstructorUsedError;
  String? get textPlain => throw _privateConstructorUsedError;
  String? get textHtml => throw _privateConstructorUsedError;
  List<MessageAttachment>? get attachments =>
      throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  List<String>? get flags => throw _privateConstructorUsedError;
  String? get inReplyTo => throw _privateConstructorUsedError;
  List<String>? get references => throw _privateConstructorUsedError;
  DateTime? get receivedAt => throw _privateConstructorUsedError;
  String? get preview => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String id,
      int uid,
      String mailboxPath,
      String? messageId,
      String? subject,
      MessageAddress? from,
      List<MessageAddress>? to,
      List<MessageAddress>? cc,
      List<MessageAddress>? bcc,
      List<MessageAddress>? replyTo,
      DateTime? date,
      bool isRead,
      bool isFlagged,
      bool isAnswered,
      bool isDraft,
      bool isDeleted,
      bool isRecent,
      MessagePriority? priority,
      String? textPlain,
      String? textHtml,
      List<MessageAttachment>? attachments,
      int? size,
      List<String>? flags,
      String? inReplyTo,
      List<String>? references,
      DateTime? receivedAt,
      String? preview});

  $MessageAddressCopyWith<$Res>? get from;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? mailboxPath = null,
    Object? messageId = freezed,
    Object? subject = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? cc = freezed,
    Object? bcc = freezed,
    Object? replyTo = freezed,
    Object? date = freezed,
    Object? isRead = null,
    Object? isFlagged = null,
    Object? isAnswered = null,
    Object? isDraft = null,
    Object? isDeleted = null,
    Object? isRecent = null,
    Object? priority = freezed,
    Object? textPlain = freezed,
    Object? textHtml = freezed,
    Object? attachments = freezed,
    Object? size = freezed,
    Object? flags = freezed,
    Object? inReplyTo = freezed,
    Object? references = freezed,
    Object? receivedAt = freezed,
    Object? preview = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      mailboxPath: null == mailboxPath
          ? _value.mailboxPath
          : mailboxPath // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as MessageAddress?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      cc: freezed == cc
          ? _value.cc
          : cc // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      bcc: freezed == bcc
          ? _value.bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecent: null == isRecent
          ? _value.isRecent
          : isRecent // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
      textPlain: freezed == textPlain
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String?,
      textHtml: freezed == textHtml
          ? _value.textHtml
          : textHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<MessageAttachment>?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: freezed == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inReplyTo: freezed == inReplyTo
          ? _value.inReplyTo
          : inReplyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      references: freezed == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preview: freezed == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageAddressCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $MessageAddressCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int uid,
      String mailboxPath,
      String? messageId,
      String? subject,
      MessageAddress? from,
      List<MessageAddress>? to,
      List<MessageAddress>? cc,
      List<MessageAddress>? bcc,
      List<MessageAddress>? replyTo,
      DateTime? date,
      bool isRead,
      bool isFlagged,
      bool isAnswered,
      bool isDraft,
      bool isDeleted,
      bool isRecent,
      MessagePriority? priority,
      String? textPlain,
      String? textHtml,
      List<MessageAttachment>? attachments,
      int? size,
      List<String>? flags,
      String? inReplyTo,
      List<String>? references,
      DateTime? receivedAt,
      String? preview});

  @override
  $MessageAddressCopyWith<$Res>? get from;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? mailboxPath = null,
    Object? messageId = freezed,
    Object? subject = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? cc = freezed,
    Object? bcc = freezed,
    Object? replyTo = freezed,
    Object? date = freezed,
    Object? isRead = null,
    Object? isFlagged = null,
    Object? isAnswered = null,
    Object? isDraft = null,
    Object? isDeleted = null,
    Object? isRecent = null,
    Object? priority = freezed,
    Object? textPlain = freezed,
    Object? textHtml = freezed,
    Object? attachments = freezed,
    Object? size = freezed,
    Object? flags = freezed,
    Object? inReplyTo = freezed,
    Object? references = freezed,
    Object? receivedAt = freezed,
    Object? preview = freezed,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      mailboxPath: null == mailboxPath
          ? _value.mailboxPath
          : mailboxPath // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as MessageAddress?,
      to: freezed == to
          ? _value._to
          : to // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      cc: freezed == cc
          ? _value._cc
          : cc // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      bcc: freezed == bcc
          ? _value._bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      replyTo: freezed == replyTo
          ? _value._replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as List<MessageAddress>?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecent: null == isRecent
          ? _value.isRecent
          : isRecent // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
      textPlain: freezed == textPlain
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String?,
      textHtml: freezed == textHtml
          ? _value.textHtml
          : textHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<MessageAttachment>?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: freezed == flags
          ? _value._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inReplyTo: freezed == inReplyTo
          ? _value.inReplyTo
          : inReplyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      references: freezed == references
          ? _value._references
          : references // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preview: freezed == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {required this.id,
      required this.uid,
      required this.mailboxPath,
      this.messageId,
      this.subject,
      this.from,
      final List<MessageAddress>? to,
      final List<MessageAddress>? cc,
      final List<MessageAddress>? bcc,
      final List<MessageAddress>? replyTo,
      this.date,
      this.isRead = false,
      this.isFlagged = false,
      this.isAnswered = false,
      this.isDraft = false,
      this.isDeleted = false,
      this.isRecent = false,
      this.priority,
      this.textPlain,
      this.textHtml,
      final List<MessageAttachment>? attachments,
      this.size,
      final List<String>? flags,
      this.inReplyTo,
      final List<String>? references,
      this.receivedAt,
      this.preview})
      : _to = to,
        _cc = cc,
        _bcc = bcc,
        _replyTo = replyTo,
        _attachments = attachments,
        _flags = flags,
        _references = references;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final int uid;
  @override
  final String mailboxPath;
  @override
  final String? messageId;
  @override
  final String? subject;
  @override
  final MessageAddress? from;
  final List<MessageAddress>? _to;
  @override
  List<MessageAddress>? get to {
    final value = _to;
    if (value == null) return null;
    if (_to is EqualUnmodifiableListView) return _to;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MessageAddress>? _cc;
  @override
  List<MessageAddress>? get cc {
    final value = _cc;
    if (value == null) return null;
    if (_cc is EqualUnmodifiableListView) return _cc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MessageAddress>? _bcc;
  @override
  List<MessageAddress>? get bcc {
    final value = _bcc;
    if (value == null) return null;
    if (_bcc is EqualUnmodifiableListView) return _bcc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MessageAddress>? _replyTo;
  @override
  List<MessageAddress>? get replyTo {
    final value = _replyTo;
    if (value == null) return null;
    if (_replyTo is EqualUnmodifiableListView) return _replyTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? date;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final bool isFlagged;
  @override
  @JsonKey()
  final bool isAnswered;
  @override
  @JsonKey()
  final bool isDraft;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  final bool isRecent;
  @override
  final MessagePriority? priority;
  @override
  final String? textPlain;
  @override
  final String? textHtml;
  final List<MessageAttachment>? _attachments;
  @override
  List<MessageAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? size;
  final List<String>? _flags;
  @override
  List<String>? get flags {
    final value = _flags;
    if (value == null) return null;
    if (_flags is EqualUnmodifiableListView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? inReplyTo;
  final List<String>? _references;
  @override
  List<String>? get references {
    final value = _references;
    if (value == null) return null;
    if (_references is EqualUnmodifiableListView) return _references;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? receivedAt;
  @override
  final String? preview;

  @override
  String toString() {
    return 'Message(id: $id, uid: $uid, mailboxPath: $mailboxPath, messageId: $messageId, subject: $subject, from: $from, to: $to, cc: $cc, bcc: $bcc, replyTo: $replyTo, date: $date, isRead: $isRead, isFlagged: $isFlagged, isAnswered: $isAnswered, isDraft: $isDraft, isDeleted: $isDeleted, isRecent: $isRecent, priority: $priority, textPlain: $textPlain, textHtml: $textHtml, attachments: $attachments, size: $size, flags: $flags, inReplyTo: $inReplyTo, references: $references, receivedAt: $receivedAt, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.mailboxPath, mailboxPath) ||
                other.mailboxPath == mailboxPath) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.from, from) || other.from == from) &&
            const DeepCollectionEquality().equals(other._to, _to) &&
            const DeepCollectionEquality().equals(other._cc, _cc) &&
            const DeepCollectionEquality().equals(other._bcc, _bcc) &&
            const DeepCollectionEquality().equals(other._replyTo, _replyTo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isRecent, isRecent) ||
                other.isRecent == isRecent) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.textPlain, textPlain) ||
                other.textPlain == textPlain) &&
            (identical(other.textHtml, textHtml) ||
                other.textHtml == textHtml) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.inReplyTo, inReplyTo) ||
                other.inReplyTo == inReplyTo) &&
            const DeepCollectionEquality()
                .equals(other._references, _references) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.preview, preview) || other.preview == preview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uid,
        mailboxPath,
        messageId,
        subject,
        from,
        const DeepCollectionEquality().hash(_to),
        const DeepCollectionEquality().hash(_cc),
        const DeepCollectionEquality().hash(_bcc),
        const DeepCollectionEquality().hash(_replyTo),
        date,
        isRead,
        isFlagged,
        isAnswered,
        isDraft,
        isDeleted,
        isRecent,
        priority,
        textPlain,
        textHtml,
        const DeepCollectionEquality().hash(_attachments),
        size,
        const DeepCollectionEquality().hash(_flags),
        inReplyTo,
        const DeepCollectionEquality().hash(_references),
        receivedAt,
        preview
      ]);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String id,
      required final int uid,
      required final String mailboxPath,
      final String? messageId,
      final String? subject,
      final MessageAddress? from,
      final List<MessageAddress>? to,
      final List<MessageAddress>? cc,
      final List<MessageAddress>? bcc,
      final List<MessageAddress>? replyTo,
      final DateTime? date,
      final bool isRead,
      final bool isFlagged,
      final bool isAnswered,
      final bool isDraft,
      final bool isDeleted,
      final bool isRecent,
      final MessagePriority? priority,
      final String? textPlain,
      final String? textHtml,
      final List<MessageAttachment>? attachments,
      final int? size,
      final List<String>? flags,
      final String? inReplyTo,
      final List<String>? references,
      final DateTime? receivedAt,
      final String? preview}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  int get uid;
  @override
  String get mailboxPath;
  @override
  String? get messageId;
  @override
  String? get subject;
  @override
  MessageAddress? get from;
  @override
  List<MessageAddress>? get to;
  @override
  List<MessageAddress>? get cc;
  @override
  List<MessageAddress>? get bcc;
  @override
  List<MessageAddress>? get replyTo;
  @override
  DateTime? get date;
  @override
  bool get isRead;
  @override
  bool get isFlagged;
  @override
  bool get isAnswered;
  @override
  bool get isDraft;
  @override
  bool get isDeleted;
  @override
  bool get isRecent;
  @override
  MessagePriority? get priority;
  @override
  String? get textPlain;
  @override
  String? get textHtml;
  @override
  List<MessageAttachment>? get attachments;
  @override
  int? get size;
  @override
  List<String>? get flags;
  @override
  String? get inReplyTo;
  @override
  List<String>? get references;
  @override
  DateTime? get receivedAt;
  @override
  String? get preview;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageAddress _$MessageAddressFromJson(Map<String, dynamic> json) {
  return _MessageAddress.fromJson(json);
}

/// @nodoc
mixin _$MessageAddress {
  String? get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this MessageAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageAddressCopyWith<MessageAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageAddressCopyWith<$Res> {
  factory $MessageAddressCopyWith(
          MessageAddress value, $Res Function(MessageAddress) then) =
      _$MessageAddressCopyWithImpl<$Res, MessageAddress>;
  @useResult
  $Res call({String? name, String email});
}

/// @nodoc
class _$MessageAddressCopyWithImpl<$Res, $Val extends MessageAddress>
    implements $MessageAddressCopyWith<$Res> {
  _$MessageAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageAddressImplCopyWith<$Res>
    implements $MessageAddressCopyWith<$Res> {
  factory _$$MessageAddressImplCopyWith(_$MessageAddressImpl value,
          $Res Function(_$MessageAddressImpl) then) =
      __$$MessageAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String email});
}

/// @nodoc
class __$$MessageAddressImplCopyWithImpl<$Res>
    extends _$MessageAddressCopyWithImpl<$Res, _$MessageAddressImpl>
    implements _$$MessageAddressImplCopyWith<$Res> {
  __$$MessageAddressImplCopyWithImpl(
      _$MessageAddressImpl _value, $Res Function(_$MessageAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = null,
  }) {
    return _then(_$MessageAddressImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageAddressImpl implements _MessageAddress {
  const _$MessageAddressImpl({this.name, required this.email});

  factory _$MessageAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageAddressImplFromJson(json);

  @override
  final String? name;
  @override
  final String email;

  @override
  String toString() {
    return 'MessageAddress(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageAddressImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of MessageAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageAddressImplCopyWith<_$MessageAddressImpl> get copyWith =>
      __$$MessageAddressImplCopyWithImpl<_$MessageAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageAddressImplToJson(
      this,
    );
  }
}

abstract class _MessageAddress implements MessageAddress {
  const factory _MessageAddress(
      {final String? name, required final String email}) = _$MessageAddressImpl;

  factory _MessageAddress.fromJson(Map<String, dynamic> json) =
      _$MessageAddressImpl.fromJson;

  @override
  String? get name;
  @override
  String get email;

  /// Create a copy of MessageAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageAddressImplCopyWith<_$MessageAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageAttachment _$MessageAttachmentFromJson(Map<String, dynamic> json) {
  return _MessageAttachment.fromJson(json);
}

/// @nodoc
mixin _$MessageAttachment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  bool get isInline => throw _privateConstructorUsedError;
  String? get contentId => throw _privateConstructorUsedError;
  String? get disposition => throw _privateConstructorUsedError;

  /// Serializes this MessageAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageAttachmentCopyWith<MessageAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageAttachmentCopyWith<$Res> {
  factory $MessageAttachmentCopyWith(
          MessageAttachment value, $Res Function(MessageAttachment) then) =
      _$MessageAttachmentCopyWithImpl<$Res, MessageAttachment>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? mimeType,
      int? size,
      bool isInline,
      String? contentId,
      String? disposition});
}

/// @nodoc
class _$MessageAttachmentCopyWithImpl<$Res, $Val extends MessageAttachment>
    implements $MessageAttachmentCopyWith<$Res> {
  _$MessageAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mimeType = freezed,
    Object? size = freezed,
    Object? isInline = null,
    Object? contentId = freezed,
    Object? disposition = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      isInline: null == isInline
          ? _value.isInline
          : isInline // ignore: cast_nullable_to_non_nullable
              as bool,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      disposition: freezed == disposition
          ? _value.disposition
          : disposition // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageAttachmentImplCopyWith<$Res>
    implements $MessageAttachmentCopyWith<$Res> {
  factory _$$MessageAttachmentImplCopyWith(_$MessageAttachmentImpl value,
          $Res Function(_$MessageAttachmentImpl) then) =
      __$$MessageAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? mimeType,
      int? size,
      bool isInline,
      String? contentId,
      String? disposition});
}

/// @nodoc
class __$$MessageAttachmentImplCopyWithImpl<$Res>
    extends _$MessageAttachmentCopyWithImpl<$Res, _$MessageAttachmentImpl>
    implements _$$MessageAttachmentImplCopyWith<$Res> {
  __$$MessageAttachmentImplCopyWithImpl(_$MessageAttachmentImpl _value,
      $Res Function(_$MessageAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mimeType = freezed,
    Object? size = freezed,
    Object? isInline = null,
    Object? contentId = freezed,
    Object? disposition = freezed,
  }) {
    return _then(_$MessageAttachmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      isInline: null == isInline
          ? _value.isInline
          : isInline // ignore: cast_nullable_to_non_nullable
              as bool,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      disposition: freezed == disposition
          ? _value.disposition
          : disposition // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageAttachmentImpl implements _MessageAttachment {
  const _$MessageAttachmentImpl(
      {required this.id,
      required this.name,
      this.mimeType,
      this.size,
      this.isInline = false,
      this.contentId,
      this.disposition});

  factory _$MessageAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageAttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? mimeType;
  @override
  final int? size;
  @override
  @JsonKey()
  final bool isInline;
  @override
  final String? contentId;
  @override
  final String? disposition;

  @override
  String toString() {
    return 'MessageAttachment(id: $id, name: $name, mimeType: $mimeType, size: $size, isInline: $isInline, contentId: $contentId, disposition: $disposition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageAttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.isInline, isInline) ||
                other.isInline == isInline) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.disposition, disposition) ||
                other.disposition == disposition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, mimeType, size, isInline, contentId, disposition);

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageAttachmentImplCopyWith<_$MessageAttachmentImpl> get copyWith =>
      __$$MessageAttachmentImplCopyWithImpl<_$MessageAttachmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageAttachmentImplToJson(
      this,
    );
  }
}

abstract class _MessageAttachment implements MessageAttachment {
  const factory _MessageAttachment(
      {required final String id,
      required final String name,
      final String? mimeType,
      final int? size,
      final bool isInline,
      final String? contentId,
      final String? disposition}) = _$MessageAttachmentImpl;

  factory _MessageAttachment.fromJson(Map<String, dynamic> json) =
      _$MessageAttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get mimeType;
  @override
  int? get size;
  @override
  bool get isInline;
  @override
  String? get contentId;
  @override
  String? get disposition;

  /// Create a copy of MessageAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageAttachmentImplCopyWith<_$MessageAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
