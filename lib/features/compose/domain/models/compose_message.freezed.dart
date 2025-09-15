// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compose_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComposeMessage _$ComposeMessageFromJson(Map<String, dynamic> json) {
  return _ComposeMessage.fromJson(json);
}

/// @nodoc
mixin _$ComposeMessage {
  String get accountId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  List<MessageAddress>? get to => throw _privateConstructorUsedError;
  List<MessageAddress>? get cc => throw _privateConstructorUsedError;
  List<MessageAddress>? get bcc => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get textContent => throw _privateConstructorUsedError;
  String? get htmlContent => throw _privateConstructorUsedError;
  List<ComposeAttachment>? get attachments =>
      throw _privateConstructorUsedError;
  MessagePriority? get priority => throw _privateConstructorUsedError;
  bool get requestReadReceipt => throw _privateConstructorUsedError;
  bool get requestDeliveryReceipt => throw _privateConstructorUsedError;
  ComposeType? get composeType => throw _privateConstructorUsedError;
  String? get originalMessageId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastModified => throw _privateConstructorUsedError;
  bool get isDraft => throw _privateConstructorUsedError;
  bool get isScheduled => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;

  /// Serializes this ComposeMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComposeMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComposeMessageCopyWith<ComposeMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposeMessageCopyWith<$Res> {
  factory $ComposeMessageCopyWith(
          ComposeMessage value, $Res Function(ComposeMessage) then) =
      _$ComposeMessageCopyWithImpl<$Res, ComposeMessage>;
  @useResult
  $Res call(
      {String accountId,
      String? id,
      List<MessageAddress>? to,
      List<MessageAddress>? cc,
      List<MessageAddress>? bcc,
      String? subject,
      String? textContent,
      String? htmlContent,
      List<ComposeAttachment>? attachments,
      MessagePriority? priority,
      bool requestReadReceipt,
      bool requestDeliveryReceipt,
      ComposeType? composeType,
      String? originalMessageId,
      DateTime? createdAt,
      DateTime? lastModified,
      bool isDraft,
      bool isScheduled,
      DateTime? scheduledAt});
}

/// @nodoc
class _$ComposeMessageCopyWithImpl<$Res, $Val extends ComposeMessage>
    implements $ComposeMessageCopyWith<$Res> {
  _$ComposeMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComposeMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? id = freezed,
    Object? to = freezed,
    Object? cc = freezed,
    Object? bcc = freezed,
    Object? subject = freezed,
    Object? textContent = freezed,
    Object? htmlContent = freezed,
    Object? attachments = freezed,
    Object? priority = freezed,
    Object? requestReadReceipt = null,
    Object? requestDeliveryReceipt = null,
    Object? composeType = freezed,
    Object? originalMessageId = freezed,
    Object? createdAt = freezed,
    Object? lastModified = freezed,
    Object? isDraft = null,
    Object? isScheduled = null,
    Object? scheduledAt = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      textContent: freezed == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlContent: freezed == htmlContent
          ? _value.htmlContent
          : htmlContent // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ComposeAttachment>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
      requestReadReceipt: null == requestReadReceipt
          ? _value.requestReadReceipt
          : requestReadReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      requestDeliveryReceipt: null == requestDeliveryReceipt
          ? _value.requestDeliveryReceipt
          : requestDeliveryReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      composeType: freezed == composeType
          ? _value.composeType
          : composeType // ignore: cast_nullable_to_non_nullable
              as ComposeType?,
      originalMessageId: freezed == originalMessageId
          ? _value.originalMessageId
          : originalMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      isScheduled: null == isScheduled
          ? _value.isScheduled
          : isScheduled // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComposeMessageImplCopyWith<$Res>
    implements $ComposeMessageCopyWith<$Res> {
  factory _$$ComposeMessageImplCopyWith(_$ComposeMessageImpl value,
          $Res Function(_$ComposeMessageImpl) then) =
      __$$ComposeMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      String? id,
      List<MessageAddress>? to,
      List<MessageAddress>? cc,
      List<MessageAddress>? bcc,
      String? subject,
      String? textContent,
      String? htmlContent,
      List<ComposeAttachment>? attachments,
      MessagePriority? priority,
      bool requestReadReceipt,
      bool requestDeliveryReceipt,
      ComposeType? composeType,
      String? originalMessageId,
      DateTime? createdAt,
      DateTime? lastModified,
      bool isDraft,
      bool isScheduled,
      DateTime? scheduledAt});
}

/// @nodoc
class __$$ComposeMessageImplCopyWithImpl<$Res>
    extends _$ComposeMessageCopyWithImpl<$Res, _$ComposeMessageImpl>
    implements _$$ComposeMessageImplCopyWith<$Res> {
  __$$ComposeMessageImplCopyWithImpl(
      _$ComposeMessageImpl _value, $Res Function(_$ComposeMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComposeMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? id = freezed,
    Object? to = freezed,
    Object? cc = freezed,
    Object? bcc = freezed,
    Object? subject = freezed,
    Object? textContent = freezed,
    Object? htmlContent = freezed,
    Object? attachments = freezed,
    Object? priority = freezed,
    Object? requestReadReceipt = null,
    Object? requestDeliveryReceipt = null,
    Object? composeType = freezed,
    Object? originalMessageId = freezed,
    Object? createdAt = freezed,
    Object? lastModified = freezed,
    Object? isDraft = null,
    Object? isScheduled = null,
    Object? scheduledAt = freezed,
  }) {
    return _then(_$ComposeMessageImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      textContent: freezed == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlContent: freezed == htmlContent
          ? _value.htmlContent
          : htmlContent // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ComposeAttachment>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
      requestReadReceipt: null == requestReadReceipt
          ? _value.requestReadReceipt
          : requestReadReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      requestDeliveryReceipt: null == requestDeliveryReceipt
          ? _value.requestDeliveryReceipt
          : requestDeliveryReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      composeType: freezed == composeType
          ? _value.composeType
          : composeType // ignore: cast_nullable_to_non_nullable
              as ComposeType?,
      originalMessageId: freezed == originalMessageId
          ? _value.originalMessageId
          : originalMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      isScheduled: null == isScheduled
          ? _value.isScheduled
          : isScheduled // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComposeMessageImpl implements _ComposeMessage {
  const _$ComposeMessageImpl(
      {required this.accountId,
      this.id,
      final List<MessageAddress>? to,
      final List<MessageAddress>? cc,
      final List<MessageAddress>? bcc,
      this.subject,
      this.textContent,
      this.htmlContent,
      final List<ComposeAttachment>? attachments,
      this.priority,
      this.requestReadReceipt = false,
      this.requestDeliveryReceipt = false,
      this.composeType,
      this.originalMessageId,
      this.createdAt,
      this.lastModified,
      this.isDraft = false,
      this.isScheduled = false,
      this.scheduledAt})
      : _to = to,
        _cc = cc,
        _bcc = bcc,
        _attachments = attachments;

  factory _$ComposeMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComposeMessageImplFromJson(json);

  @override
  final String accountId;
  @override
  final String? id;
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

  @override
  final String? subject;
  @override
  final String? textContent;
  @override
  final String? htmlContent;
  final List<ComposeAttachment>? _attachments;
  @override
  List<ComposeAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MessagePriority? priority;
  @override
  @JsonKey()
  final bool requestReadReceipt;
  @override
  @JsonKey()
  final bool requestDeliveryReceipt;
  @override
  final ComposeType? composeType;
  @override
  final String? originalMessageId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastModified;
  @override
  @JsonKey()
  final bool isDraft;
  @override
  @JsonKey()
  final bool isScheduled;
  @override
  final DateTime? scheduledAt;

  @override
  String toString() {
    return 'ComposeMessage(accountId: $accountId, id: $id, to: $to, cc: $cc, bcc: $bcc, subject: $subject, textContent: $textContent, htmlContent: $htmlContent, attachments: $attachments, priority: $priority, requestReadReceipt: $requestReadReceipt, requestDeliveryReceipt: $requestDeliveryReceipt, composeType: $composeType, originalMessageId: $originalMessageId, createdAt: $createdAt, lastModified: $lastModified, isDraft: $isDraft, isScheduled: $isScheduled, scheduledAt: $scheduledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComposeMessageImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._to, _to) &&
            const DeepCollectionEquality().equals(other._cc, _cc) &&
            const DeepCollectionEquality().equals(other._bcc, _bcc) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.textContent, textContent) ||
                other.textContent == textContent) &&
            (identical(other.htmlContent, htmlContent) ||
                other.htmlContent == htmlContent) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.requestReadReceipt, requestReadReceipt) ||
                other.requestReadReceipt == requestReadReceipt) &&
            (identical(other.requestDeliveryReceipt, requestDeliveryReceipt) ||
                other.requestDeliveryReceipt == requestDeliveryReceipt) &&
            (identical(other.composeType, composeType) ||
                other.composeType == composeType) &&
            (identical(other.originalMessageId, originalMessageId) ||
                other.originalMessageId == originalMessageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.isScheduled, isScheduled) ||
                other.isScheduled == isScheduled) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        accountId,
        id,
        const DeepCollectionEquality().hash(_to),
        const DeepCollectionEquality().hash(_cc),
        const DeepCollectionEquality().hash(_bcc),
        subject,
        textContent,
        htmlContent,
        const DeepCollectionEquality().hash(_attachments),
        priority,
        requestReadReceipt,
        requestDeliveryReceipt,
        composeType,
        originalMessageId,
        createdAt,
        lastModified,
        isDraft,
        isScheduled,
        scheduledAt
      ]);

  /// Create a copy of ComposeMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComposeMessageImplCopyWith<_$ComposeMessageImpl> get copyWith =>
      __$$ComposeMessageImplCopyWithImpl<_$ComposeMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComposeMessageImplToJson(
      this,
    );
  }
}

abstract class _ComposeMessage implements ComposeMessage {
  const factory _ComposeMessage(
      {required final String accountId,
      final String? id,
      final List<MessageAddress>? to,
      final List<MessageAddress>? cc,
      final List<MessageAddress>? bcc,
      final String? subject,
      final String? textContent,
      final String? htmlContent,
      final List<ComposeAttachment>? attachments,
      final MessagePriority? priority,
      final bool requestReadReceipt,
      final bool requestDeliveryReceipt,
      final ComposeType? composeType,
      final String? originalMessageId,
      final DateTime? createdAt,
      final DateTime? lastModified,
      final bool isDraft,
      final bool isScheduled,
      final DateTime? scheduledAt}) = _$ComposeMessageImpl;

  factory _ComposeMessage.fromJson(Map<String, dynamic> json) =
      _$ComposeMessageImpl.fromJson;

  @override
  String get accountId;
  @override
  String? get id;
  @override
  List<MessageAddress>? get to;
  @override
  List<MessageAddress>? get cc;
  @override
  List<MessageAddress>? get bcc;
  @override
  String? get subject;
  @override
  String? get textContent;
  @override
  String? get htmlContent;
  @override
  List<ComposeAttachment>? get attachments;
  @override
  MessagePriority? get priority;
  @override
  bool get requestReadReceipt;
  @override
  bool get requestDeliveryReceipt;
  @override
  ComposeType? get composeType;
  @override
  String? get originalMessageId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastModified;
  @override
  bool get isDraft;
  @override
  bool get isScheduled;
  @override
  DateTime? get scheduledAt;

  /// Create a copy of ComposeMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComposeMessageImplCopyWith<_$ComposeMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComposeAttachment _$ComposeAttachmentFromJson(Map<String, dynamic> json) {
  return _ComposeAttachment.fromJson(json);
}

/// @nodoc
mixin _$ComposeAttachment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  bool get isInline => throw _privateConstructorUsedError;
  String? get contentId => throw _privateConstructorUsedError;
  AttachmentSource? get source => throw _privateConstructorUsedError;

  /// Serializes this ComposeAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComposeAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComposeAttachmentCopyWith<ComposeAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposeAttachmentCopyWith<$Res> {
  factory $ComposeAttachmentCopyWith(
          ComposeAttachment value, $Res Function(ComposeAttachment) then) =
      _$ComposeAttachmentCopyWithImpl<$Res, ComposeAttachment>;
  @useResult
  $Res call(
      {String id,
      String name,
      String path,
      String? mimeType,
      int? size,
      bool isInline,
      String? contentId,
      AttachmentSource? source});
}

/// @nodoc
class _$ComposeAttachmentCopyWithImpl<$Res, $Val extends ComposeAttachment>
    implements $ComposeAttachmentCopyWith<$Res> {
  _$ComposeAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComposeAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? mimeType = freezed,
    Object? size = freezed,
    Object? isInline = null,
    Object? contentId = freezed,
    Object? source = freezed,
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
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
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
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AttachmentSource?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComposeAttachmentImplCopyWith<$Res>
    implements $ComposeAttachmentCopyWith<$Res> {
  factory _$$ComposeAttachmentImplCopyWith(_$ComposeAttachmentImpl value,
          $Res Function(_$ComposeAttachmentImpl) then) =
      __$$ComposeAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String path,
      String? mimeType,
      int? size,
      bool isInline,
      String? contentId,
      AttachmentSource? source});
}

/// @nodoc
class __$$ComposeAttachmentImplCopyWithImpl<$Res>
    extends _$ComposeAttachmentCopyWithImpl<$Res, _$ComposeAttachmentImpl>
    implements _$$ComposeAttachmentImplCopyWith<$Res> {
  __$$ComposeAttachmentImplCopyWithImpl(_$ComposeAttachmentImpl _value,
      $Res Function(_$ComposeAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComposeAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? mimeType = freezed,
    Object? size = freezed,
    Object? isInline = null,
    Object? contentId = freezed,
    Object? source = freezed,
  }) {
    return _then(_$ComposeAttachmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
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
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AttachmentSource?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComposeAttachmentImpl implements _ComposeAttachment {
  const _$ComposeAttachmentImpl(
      {required this.id,
      required this.name,
      required this.path,
      this.mimeType,
      this.size,
      this.isInline = false,
      this.contentId,
      this.source});

  factory _$ComposeAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComposeAttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;
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
  final AttachmentSource? source;

  @override
  String toString() {
    return 'ComposeAttachment(id: $id, name: $name, path: $path, mimeType: $mimeType, size: $size, isInline: $isInline, contentId: $contentId, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComposeAttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.isInline, isInline) ||
                other.isInline == isInline) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, path, mimeType, size, isInline, contentId, source);

  /// Create a copy of ComposeAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComposeAttachmentImplCopyWith<_$ComposeAttachmentImpl> get copyWith =>
      __$$ComposeAttachmentImplCopyWithImpl<_$ComposeAttachmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComposeAttachmentImplToJson(
      this,
    );
  }
}

abstract class _ComposeAttachment implements ComposeAttachment {
  const factory _ComposeAttachment(
      {required final String id,
      required final String name,
      required final String path,
      final String? mimeType,
      final int? size,
      final bool isInline,
      final String? contentId,
      final AttachmentSource? source}) = _$ComposeAttachmentImpl;

  factory _ComposeAttachment.fromJson(Map<String, dynamic> json) =
      _$ComposeAttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
  @override
  String? get mimeType;
  @override
  int? get size;
  @override
  bool get isInline;
  @override
  String? get contentId;
  @override
  AttachmentSource? get source;

  /// Create a copy of ComposeAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComposeAttachmentImplCopyWith<_$ComposeAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
