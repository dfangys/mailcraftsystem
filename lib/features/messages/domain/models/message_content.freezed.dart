// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageContent _$MessageContentFromJson(Map<String, dynamic> json) {
  return _MessageContent.fromJson(json);
}

/// @nodoc
mixin _$MessageContent {
  String get textPlain => throw _privateConstructorUsedError;
  String? get textHtml => throw _privateConstructorUsedError;
  List<MessageAttachment>? get attachments =>
      throw _privateConstructorUsedError;
  List<MessageAttachment>? get inlineAttachments =>
      throw _privateConstructorUsedError;

  /// Serializes this MessageContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageContentCopyWith<MessageContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContentCopyWith<$Res> {
  factory $MessageContentCopyWith(
          MessageContent value, $Res Function(MessageContent) then) =
      _$MessageContentCopyWithImpl<$Res, MessageContent>;
  @useResult
  $Res call(
      {String textPlain,
      String? textHtml,
      List<MessageAttachment>? attachments,
      List<MessageAttachment>? inlineAttachments});
}

/// @nodoc
class _$MessageContentCopyWithImpl<$Res, $Val extends MessageContent>
    implements $MessageContentCopyWith<$Res> {
  _$MessageContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textPlain = null,
    Object? textHtml = freezed,
    Object? attachments = freezed,
    Object? inlineAttachments = freezed,
  }) {
    return _then(_value.copyWith(
      textPlain: null == textPlain
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String,
      textHtml: freezed == textHtml
          ? _value.textHtml
          : textHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<MessageAttachment>?,
      inlineAttachments: freezed == inlineAttachments
          ? _value.inlineAttachments
          : inlineAttachments // ignore: cast_nullable_to_non_nullable
              as List<MessageAttachment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageContentImplCopyWith<$Res>
    implements $MessageContentCopyWith<$Res> {
  factory _$$MessageContentImplCopyWith(_$MessageContentImpl value,
          $Res Function(_$MessageContentImpl) then) =
      __$$MessageContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String textPlain,
      String? textHtml,
      List<MessageAttachment>? attachments,
      List<MessageAttachment>? inlineAttachments});
}

/// @nodoc
class __$$MessageContentImplCopyWithImpl<$Res>
    extends _$MessageContentCopyWithImpl<$Res, _$MessageContentImpl>
    implements _$$MessageContentImplCopyWith<$Res> {
  __$$MessageContentImplCopyWithImpl(
      _$MessageContentImpl _value, $Res Function(_$MessageContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textPlain = null,
    Object? textHtml = freezed,
    Object? attachments = freezed,
    Object? inlineAttachments = freezed,
  }) {
    return _then(_$MessageContentImpl(
      textPlain: null == textPlain
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String,
      textHtml: freezed == textHtml
          ? _value.textHtml
          : textHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<MessageAttachment>?,
      inlineAttachments: freezed == inlineAttachments
          ? _value._inlineAttachments
          : inlineAttachments // ignore: cast_nullable_to_non_nullable
              as List<MessageAttachment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageContentImpl implements _MessageContent {
  const _$MessageContentImpl(
      {required this.textPlain,
      this.textHtml,
      final List<MessageAttachment>? attachments,
      final List<MessageAttachment>? inlineAttachments})
      : _attachments = attachments,
        _inlineAttachments = inlineAttachments;

  factory _$MessageContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageContentImplFromJson(json);

  @override
  final String textPlain;
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

  final List<MessageAttachment>? _inlineAttachments;
  @override
  List<MessageAttachment>? get inlineAttachments {
    final value = _inlineAttachments;
    if (value == null) return null;
    if (_inlineAttachments is EqualUnmodifiableListView)
      return _inlineAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MessageContent(textPlain: $textPlain, textHtml: $textHtml, attachments: $attachments, inlineAttachments: $inlineAttachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageContentImpl &&
            (identical(other.textPlain, textPlain) ||
                other.textPlain == textPlain) &&
            (identical(other.textHtml, textHtml) ||
                other.textHtml == textHtml) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality()
                .equals(other._inlineAttachments, _inlineAttachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      textPlain,
      textHtml,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_inlineAttachments));

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageContentImplCopyWith<_$MessageContentImpl> get copyWith =>
      __$$MessageContentImplCopyWithImpl<_$MessageContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageContentImplToJson(
      this,
    );
  }
}

abstract class _MessageContent implements MessageContent {
  const factory _MessageContent(
      {required final String textPlain,
      final String? textHtml,
      final List<MessageAttachment>? attachments,
      final List<MessageAttachment>? inlineAttachments}) = _$MessageContentImpl;

  factory _MessageContent.fromJson(Map<String, dynamic> json) =
      _$MessageContentImpl.fromJson;

  @override
  String get textPlain;
  @override
  String? get textHtml;
  @override
  List<MessageAttachment>? get attachments;
  @override
  List<MessageAttachment>? get inlineAttachments;

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageContentImplCopyWith<_$MessageContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttachmentData _$AttachmentDataFromJson(Map<String, dynamic> json) {
  return _AttachmentData.fromJson(json);
}

/// @nodoc
mixin _$AttachmentData {
  String get name => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  List<int> get data => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  /// Serializes this AttachmentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttachmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentDataCopyWith<AttachmentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentDataCopyWith<$Res> {
  factory $AttachmentDataCopyWith(
          AttachmentData value, $Res Function(AttachmentData) then) =
      _$AttachmentDataCopyWithImpl<$Res, AttachmentData>;
  @useResult
  $Res call({String name, String mimeType, List<int> data, int? size});
}

/// @nodoc
class _$AttachmentDataCopyWithImpl<$Res, $Val extends AttachmentData>
    implements $AttachmentDataCopyWith<$Res> {
  _$AttachmentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mimeType = null,
    Object? data = null,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttachmentDataImplCopyWith<$Res>
    implements $AttachmentDataCopyWith<$Res> {
  factory _$$AttachmentDataImplCopyWith(_$AttachmentDataImpl value,
          $Res Function(_$AttachmentDataImpl) then) =
      __$$AttachmentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String mimeType, List<int> data, int? size});
}

/// @nodoc
class __$$AttachmentDataImplCopyWithImpl<$Res>
    extends _$AttachmentDataCopyWithImpl<$Res, _$AttachmentDataImpl>
    implements _$$AttachmentDataImplCopyWith<$Res> {
  __$$AttachmentDataImplCopyWithImpl(
      _$AttachmentDataImpl _value, $Res Function(_$AttachmentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mimeType = null,
    Object? data = null,
    Object? size = freezed,
  }) {
    return _then(_$AttachmentDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentDataImpl implements _AttachmentData {
  const _$AttachmentDataImpl(
      {required this.name,
      required this.mimeType,
      required final List<int> data,
      this.size})
      : _data = data;

  factory _$AttachmentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentDataImplFromJson(json);

  @override
  final String name;
  @override
  final String mimeType;
  final List<int> _data;
  @override
  List<int> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? size;

  @override
  String toString() {
    return 'AttachmentData(name: $name, mimeType: $mimeType, data: $data, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mimeType,
      const DeepCollectionEquality().hash(_data), size);

  /// Create a copy of AttachmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentDataImplCopyWith<_$AttachmentDataImpl> get copyWith =>
      __$$AttachmentDataImplCopyWithImpl<_$AttachmentDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentDataImplToJson(
      this,
    );
  }
}

abstract class _AttachmentData implements AttachmentData {
  const factory _AttachmentData(
      {required final String name,
      required final String mimeType,
      required final List<int> data,
      final int? size}) = _$AttachmentDataImpl;

  factory _AttachmentData.fromJson(Map<String, dynamic> json) =
      _$AttachmentDataImpl.fromJson;

  @override
  String get name;
  @override
  String get mimeType;
  @override
  List<int> get data;
  @override
  int? get size;

  /// Create a copy of AttachmentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentDataImplCopyWith<_$AttachmentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageSearchCriteria _$MessageSearchCriteriaFromJson(
    Map<String, dynamic> json) {
  return _MessageSearchCriteria.fromJson(json);
}

/// @nodoc
mixin _$MessageSearchCriteria {
  String? get query => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  DateTime? get since => throw _privateConstructorUsedError;
  DateTime? get before => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  bool? get isFlagged => throw _privateConstructorUsedError;
  bool? get hasAttachments => throw _privateConstructorUsedError;
  MessagePriority? get priority => throw _privateConstructorUsedError;

  /// Serializes this MessageSearchCriteria to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageSearchCriteriaCopyWith<MessageSearchCriteria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageSearchCriteriaCopyWith<$Res> {
  factory $MessageSearchCriteriaCopyWith(MessageSearchCriteria value,
          $Res Function(MessageSearchCriteria) then) =
      _$MessageSearchCriteriaCopyWithImpl<$Res, MessageSearchCriteria>;
  @useResult
  $Res call(
      {String? query,
      String? from,
      String? to,
      String? subject,
      String? body,
      DateTime? since,
      DateTime? before,
      bool? isRead,
      bool? isFlagged,
      bool? hasAttachments,
      MessagePriority? priority});
}

/// @nodoc
class _$MessageSearchCriteriaCopyWithImpl<$Res,
        $Val extends MessageSearchCriteria>
    implements $MessageSearchCriteriaCopyWith<$Res> {
  _$MessageSearchCriteriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? since = freezed,
    Object? before = freezed,
    Object? isRead = freezed,
    Object? isFlagged = freezed,
    Object? hasAttachments = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      since: freezed == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      before: freezed == before
          ? _value.before
          : before // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFlagged: freezed == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAttachments: freezed == hasAttachments
          ? _value.hasAttachments
          : hasAttachments // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageSearchCriteriaImplCopyWith<$Res>
    implements $MessageSearchCriteriaCopyWith<$Res> {
  factory _$$MessageSearchCriteriaImplCopyWith(
          _$MessageSearchCriteriaImpl value,
          $Res Function(_$MessageSearchCriteriaImpl) then) =
      __$$MessageSearchCriteriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      String? from,
      String? to,
      String? subject,
      String? body,
      DateTime? since,
      DateTime? before,
      bool? isRead,
      bool? isFlagged,
      bool? hasAttachments,
      MessagePriority? priority});
}

/// @nodoc
class __$$MessageSearchCriteriaImplCopyWithImpl<$Res>
    extends _$MessageSearchCriteriaCopyWithImpl<$Res,
        _$MessageSearchCriteriaImpl>
    implements _$$MessageSearchCriteriaImplCopyWith<$Res> {
  __$$MessageSearchCriteriaImplCopyWithImpl(_$MessageSearchCriteriaImpl _value,
      $Res Function(_$MessageSearchCriteriaImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? since = freezed,
    Object? before = freezed,
    Object? isRead = freezed,
    Object? isFlagged = freezed,
    Object? hasAttachments = freezed,
    Object? priority = freezed,
  }) {
    return _then(_$MessageSearchCriteriaImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      since: freezed == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      before: freezed == before
          ? _value.before
          : before // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFlagged: freezed == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAttachments: freezed == hasAttachments
          ? _value.hasAttachments
          : hasAttachments // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageSearchCriteriaImpl implements _MessageSearchCriteria {
  const _$MessageSearchCriteriaImpl(
      {this.query,
      this.from,
      this.to,
      this.subject,
      this.body,
      this.since,
      this.before,
      this.isRead,
      this.isFlagged,
      this.hasAttachments,
      this.priority});

  factory _$MessageSearchCriteriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageSearchCriteriaImplFromJson(json);

  @override
  final String? query;
  @override
  final String? from;
  @override
  final String? to;
  @override
  final String? subject;
  @override
  final String? body;
  @override
  final DateTime? since;
  @override
  final DateTime? before;
  @override
  final bool? isRead;
  @override
  final bool? isFlagged;
  @override
  final bool? hasAttachments;
  @override
  final MessagePriority? priority;

  @override
  String toString() {
    return 'MessageSearchCriteria(query: $query, from: $from, to: $to, subject: $subject, body: $body, since: $since, before: $before, isRead: $isRead, isFlagged: $isFlagged, hasAttachments: $hasAttachments, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSearchCriteriaImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.since, since) || other.since == since) &&
            (identical(other.before, before) || other.before == before) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged) &&
            (identical(other.hasAttachments, hasAttachments) ||
                other.hasAttachments == hasAttachments) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, from, to, subject, body,
      since, before, isRead, isFlagged, hasAttachments, priority);

  /// Create a copy of MessageSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSearchCriteriaImplCopyWith<_$MessageSearchCriteriaImpl>
      get copyWith => __$$MessageSearchCriteriaImplCopyWithImpl<
          _$MessageSearchCriteriaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageSearchCriteriaImplToJson(
      this,
    );
  }
}

abstract class _MessageSearchCriteria implements MessageSearchCriteria {
  const factory _MessageSearchCriteria(
      {final String? query,
      final String? from,
      final String? to,
      final String? subject,
      final String? body,
      final DateTime? since,
      final DateTime? before,
      final bool? isRead,
      final bool? isFlagged,
      final bool? hasAttachments,
      final MessagePriority? priority}) = _$MessageSearchCriteriaImpl;

  factory _MessageSearchCriteria.fromJson(Map<String, dynamic> json) =
      _$MessageSearchCriteriaImpl.fromJson;

  @override
  String? get query;
  @override
  String? get from;
  @override
  String? get to;
  @override
  String? get subject;
  @override
  String? get body;
  @override
  DateTime? get since;
  @override
  DateTime? get before;
  @override
  bool? get isRead;
  @override
  bool? get isFlagged;
  @override
  bool? get hasAttachments;
  @override
  MessagePriority? get priority;

  /// Create a copy of MessageSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageSearchCriteriaImplCopyWith<_$MessageSearchCriteriaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
