// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mailbox_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MailboxStatus _$MailboxStatusFromJson(Map<String, dynamic> json) {
  return _MailboxStatus.fromJson(json);
}

/// @nodoc
mixin _$MailboxStatus {
  String get path => throw _privateConstructorUsedError;
  int get messageCount => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  int get recentCount => throw _privateConstructorUsedError;
  int? get uidNext => throw _privateConstructorUsedError;
  int? get uidValidity => throw _privateConstructorUsedError;
  DateTime? get lastSync => throw _privateConstructorUsedError;
  bool? get isSelectable => throw _privateConstructorUsedError;

  /// Serializes this MailboxStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailboxStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailboxStatusCopyWith<MailboxStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailboxStatusCopyWith<$Res> {
  factory $MailboxStatusCopyWith(
          MailboxStatus value, $Res Function(MailboxStatus) then) =
      _$MailboxStatusCopyWithImpl<$Res, MailboxStatus>;
  @useResult
  $Res call(
      {String path,
      int messageCount,
      int unreadCount,
      int recentCount,
      int? uidNext,
      int? uidValidity,
      DateTime? lastSync,
      bool? isSelectable});
}

/// @nodoc
class _$MailboxStatusCopyWithImpl<$Res, $Val extends MailboxStatus>
    implements $MailboxStatusCopyWith<$Res> {
  _$MailboxStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailboxStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? messageCount = null,
    Object? unreadCount = null,
    Object? recentCount = null,
    Object? uidNext = freezed,
    Object? uidValidity = freezed,
    Object? lastSync = freezed,
    Object? isSelectable = freezed,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      messageCount: null == messageCount
          ? _value.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      recentCount: null == recentCount
          ? _value.recentCount
          : recentCount // ignore: cast_nullable_to_non_nullable
              as int,
      uidNext: freezed == uidNext
          ? _value.uidNext
          : uidNext // ignore: cast_nullable_to_non_nullable
              as int?,
      uidValidity: freezed == uidValidity
          ? _value.uidValidity
          : uidValidity // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSelectable: freezed == isSelectable
          ? _value.isSelectable
          : isSelectable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MailboxStatusImplCopyWith<$Res>
    implements $MailboxStatusCopyWith<$Res> {
  factory _$$MailboxStatusImplCopyWith(
          _$MailboxStatusImpl value, $Res Function(_$MailboxStatusImpl) then) =
      __$$MailboxStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path,
      int messageCount,
      int unreadCount,
      int recentCount,
      int? uidNext,
      int? uidValidity,
      DateTime? lastSync,
      bool? isSelectable});
}

/// @nodoc
class __$$MailboxStatusImplCopyWithImpl<$Res>
    extends _$MailboxStatusCopyWithImpl<$Res, _$MailboxStatusImpl>
    implements _$$MailboxStatusImplCopyWith<$Res> {
  __$$MailboxStatusImplCopyWithImpl(
      _$MailboxStatusImpl _value, $Res Function(_$MailboxStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailboxStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? messageCount = null,
    Object? unreadCount = null,
    Object? recentCount = null,
    Object? uidNext = freezed,
    Object? uidValidity = freezed,
    Object? lastSync = freezed,
    Object? isSelectable = freezed,
  }) {
    return _then(_$MailboxStatusImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      messageCount: null == messageCount
          ? _value.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      recentCount: null == recentCount
          ? _value.recentCount
          : recentCount // ignore: cast_nullable_to_non_nullable
              as int,
      uidNext: freezed == uidNext
          ? _value.uidNext
          : uidNext // ignore: cast_nullable_to_non_nullable
              as int?,
      uidValidity: freezed == uidValidity
          ? _value.uidValidity
          : uidValidity // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSelectable: freezed == isSelectable
          ? _value.isSelectable
          : isSelectable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailboxStatusImpl implements _MailboxStatus {
  const _$MailboxStatusImpl(
      {required this.path,
      required this.messageCount,
      required this.unreadCount,
      required this.recentCount,
      this.uidNext,
      this.uidValidity,
      this.lastSync,
      this.isSelectable});

  factory _$MailboxStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailboxStatusImplFromJson(json);

  @override
  final String path;
  @override
  final int messageCount;
  @override
  final int unreadCount;
  @override
  final int recentCount;
  @override
  final int? uidNext;
  @override
  final int? uidValidity;
  @override
  final DateTime? lastSync;
  @override
  final bool? isSelectable;

  @override
  String toString() {
    return 'MailboxStatus(path: $path, messageCount: $messageCount, unreadCount: $unreadCount, recentCount: $recentCount, uidNext: $uidNext, uidValidity: $uidValidity, lastSync: $lastSync, isSelectable: $isSelectable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailboxStatusImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.recentCount, recentCount) ||
                other.recentCount == recentCount) &&
            (identical(other.uidNext, uidNext) || other.uidNext == uidNext) &&
            (identical(other.uidValidity, uidValidity) ||
                other.uidValidity == uidValidity) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            (identical(other.isSelectable, isSelectable) ||
                other.isSelectable == isSelectable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, messageCount, unreadCount,
      recentCount, uidNext, uidValidity, lastSync, isSelectable);

  /// Create a copy of MailboxStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailboxStatusImplCopyWith<_$MailboxStatusImpl> get copyWith =>
      __$$MailboxStatusImplCopyWithImpl<_$MailboxStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailboxStatusImplToJson(
      this,
    );
  }
}

abstract class _MailboxStatus implements MailboxStatus {
  const factory _MailboxStatus(
      {required final String path,
      required final int messageCount,
      required final int unreadCount,
      required final int recentCount,
      final int? uidNext,
      final int? uidValidity,
      final DateTime? lastSync,
      final bool? isSelectable}) = _$MailboxStatusImpl;

  factory _MailboxStatus.fromJson(Map<String, dynamic> json) =
      _$MailboxStatusImpl.fromJson;

  @override
  String get path;
  @override
  int get messageCount;
  @override
  int get unreadCount;
  @override
  int get recentCount;
  @override
  int? get uidNext;
  @override
  int? get uidValidity;
  @override
  DateTime? get lastSync;
  @override
  bool? get isSelectable;

  /// Create a copy of MailboxStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailboxStatusImplCopyWith<_$MailboxStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MailboxOperationResult _$MailboxOperationResultFromJson(
    Map<String, dynamic> json) {
  return _MailboxOperationResult.fromJson(json);
}

/// @nodoc
mixin _$MailboxOperationResult {
  bool get success => throw _privateConstructorUsedError;
  String? get message =>
      throw _privateConstructorUsedError; // Note: Mailbox import would create circular dependency
  Map<String, dynamic>? get mailboxData => throw _privateConstructorUsedError;

  /// Serializes this MailboxOperationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailboxOperationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailboxOperationResultCopyWith<MailboxOperationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailboxOperationResultCopyWith<$Res> {
  factory $MailboxOperationResultCopyWith(MailboxOperationResult value,
          $Res Function(MailboxOperationResult) then) =
      _$MailboxOperationResultCopyWithImpl<$Res, MailboxOperationResult>;
  @useResult
  $Res call({bool success, String? message, Map<String, dynamic>? mailboxData});
}

/// @nodoc
class _$MailboxOperationResultCopyWithImpl<$Res,
        $Val extends MailboxOperationResult>
    implements $MailboxOperationResultCopyWith<$Res> {
  _$MailboxOperationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailboxOperationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? mailboxData = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      mailboxData: freezed == mailboxData
          ? _value.mailboxData
          : mailboxData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MailboxOperationResultImplCopyWith<$Res>
    implements $MailboxOperationResultCopyWith<$Res> {
  factory _$$MailboxOperationResultImplCopyWith(
          _$MailboxOperationResultImpl value,
          $Res Function(_$MailboxOperationResultImpl) then) =
      __$$MailboxOperationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, Map<String, dynamic>? mailboxData});
}

/// @nodoc
class __$$MailboxOperationResultImplCopyWithImpl<$Res>
    extends _$MailboxOperationResultCopyWithImpl<$Res,
        _$MailboxOperationResultImpl>
    implements _$$MailboxOperationResultImplCopyWith<$Res> {
  __$$MailboxOperationResultImplCopyWithImpl(
      _$MailboxOperationResultImpl _value,
      $Res Function(_$MailboxOperationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailboxOperationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? mailboxData = freezed,
  }) {
    return _then(_$MailboxOperationResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      mailboxData: freezed == mailboxData
          ? _value._mailboxData
          : mailboxData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailboxOperationResultImpl implements _MailboxOperationResult {
  const _$MailboxOperationResultImpl(
      {required this.success,
      this.message,
      final Map<String, dynamic>? mailboxData})
      : _mailboxData = mailboxData;

  factory _$MailboxOperationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailboxOperationResultImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
// Note: Mailbox import would create circular dependency
  final Map<String, dynamic>? _mailboxData;
// Note: Mailbox import would create circular dependency
  @override
  Map<String, dynamic>? get mailboxData {
    final value = _mailboxData;
    if (value == null) return null;
    if (_mailboxData is EqualUnmodifiableMapView) return _mailboxData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MailboxOperationResult(success: $success, message: $message, mailboxData: $mailboxData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailboxOperationResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._mailboxData, _mailboxData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_mailboxData));

  /// Create a copy of MailboxOperationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailboxOperationResultImplCopyWith<_$MailboxOperationResultImpl>
      get copyWith => __$$MailboxOperationResultImplCopyWithImpl<
          _$MailboxOperationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailboxOperationResultImplToJson(
      this,
    );
  }
}

abstract class _MailboxOperationResult implements MailboxOperationResult {
  const factory _MailboxOperationResult(
      {required final bool success,
      final String? message,
      final Map<String, dynamic>? mailboxData}) = _$MailboxOperationResultImpl;

  factory _MailboxOperationResult.fromJson(Map<String, dynamic> json) =
      _$MailboxOperationResultImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message; // Note: Mailbox import would create circular dependency
  @override
  Map<String, dynamic>? get mailboxData;

  /// Create a copy of MailboxOperationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailboxOperationResultImplCopyWith<_$MailboxOperationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
