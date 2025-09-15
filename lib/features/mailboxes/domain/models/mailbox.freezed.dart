// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mailbox.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mailbox _$MailboxFromJson(Map<String, dynamic> json) {
  return _Mailbox.fromJson(json);
}

/// @nodoc
mixin _$Mailbox {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  MailboxType get type => throw _privateConstructorUsedError;
  int get messageCount => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  int get recentCount => throw _privateConstructorUsedError;
  bool get isSelectable => throw _privateConstructorUsedError;
  bool get hasChildren => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;
  List<MailboxFlag>? get flags => throw _privateConstructorUsedError;
  String? get parentPath => throw _privateConstructorUsedError;
  List<Mailbox>? get children => throw _privateConstructorUsedError;
  DateTime? get lastSync => throw _privateConstructorUsedError;

  /// Serializes this Mailbox to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mailbox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailboxCopyWith<Mailbox> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailboxCopyWith<$Res> {
  factory $MailboxCopyWith(Mailbox value, $Res Function(Mailbox) then) =
      _$MailboxCopyWithImpl<$Res, Mailbox>;
  @useResult
  $Res call(
      {String id,
      String name,
      String path,
      MailboxType type,
      int messageCount,
      int unreadCount,
      int recentCount,
      bool isSelectable,
      bool hasChildren,
      bool isSubscribed,
      List<MailboxFlag>? flags,
      String? parentPath,
      List<Mailbox>? children,
      DateTime? lastSync});
}

/// @nodoc
class _$MailboxCopyWithImpl<$Res, $Val extends Mailbox>
    implements $MailboxCopyWith<$Res> {
  _$MailboxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mailbox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? type = null,
    Object? messageCount = null,
    Object? unreadCount = null,
    Object? recentCount = null,
    Object? isSelectable = null,
    Object? hasChildren = null,
    Object? isSubscribed = null,
    Object? flags = freezed,
    Object? parentPath = freezed,
    Object? children = freezed,
    Object? lastSync = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MailboxType,
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
      isSelectable: null == isSelectable
          ? _value.isSelectable
          : isSelectable // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChildren: null == hasChildren
          ? _value.hasChildren
          : hasChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      flags: freezed == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<MailboxFlag>?,
      parentPath: freezed == parentPath
          ? _value.parentPath
          : parentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Mailbox>?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MailboxImplCopyWith<$Res> implements $MailboxCopyWith<$Res> {
  factory _$$MailboxImplCopyWith(
          _$MailboxImpl value, $Res Function(_$MailboxImpl) then) =
      __$$MailboxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String path,
      MailboxType type,
      int messageCount,
      int unreadCount,
      int recentCount,
      bool isSelectable,
      bool hasChildren,
      bool isSubscribed,
      List<MailboxFlag>? flags,
      String? parentPath,
      List<Mailbox>? children,
      DateTime? lastSync});
}

/// @nodoc
class __$$MailboxImplCopyWithImpl<$Res>
    extends _$MailboxCopyWithImpl<$Res, _$MailboxImpl>
    implements _$$MailboxImplCopyWith<$Res> {
  __$$MailboxImplCopyWithImpl(
      _$MailboxImpl _value, $Res Function(_$MailboxImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mailbox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? type = null,
    Object? messageCount = null,
    Object? unreadCount = null,
    Object? recentCount = null,
    Object? isSelectable = null,
    Object? hasChildren = null,
    Object? isSubscribed = null,
    Object? flags = freezed,
    Object? parentPath = freezed,
    Object? children = freezed,
    Object? lastSync = freezed,
  }) {
    return _then(_$MailboxImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MailboxType,
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
      isSelectable: null == isSelectable
          ? _value.isSelectable
          : isSelectable // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChildren: null == hasChildren
          ? _value.hasChildren
          : hasChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      flags: freezed == flags
          ? _value._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<MailboxFlag>?,
      parentPath: freezed == parentPath
          ? _value.parentPath
          : parentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Mailbox>?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailboxImpl implements _Mailbox {
  const _$MailboxImpl(
      {required this.id,
      required this.name,
      required this.path,
      required this.type,
      this.messageCount = 0,
      this.unreadCount = 0,
      this.recentCount = 0,
      this.isSelectable = false,
      this.hasChildren = false,
      this.isSubscribed = false,
      final List<MailboxFlag>? flags,
      this.parentPath,
      final List<Mailbox>? children,
      this.lastSync})
      : _flags = flags,
        _children = children;

  factory _$MailboxImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailboxImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;
  @override
  final MailboxType type;
  @override
  @JsonKey()
  final int messageCount;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final int recentCount;
  @override
  @JsonKey()
  final bool isSelectable;
  @override
  @JsonKey()
  final bool hasChildren;
  @override
  @JsonKey()
  final bool isSubscribed;
  final List<MailboxFlag>? _flags;
  @override
  List<MailboxFlag>? get flags {
    final value = _flags;
    if (value == null) return null;
    if (_flags is EqualUnmodifiableListView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? parentPath;
  final List<Mailbox>? _children;
  @override
  List<Mailbox>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? lastSync;

  @override
  String toString() {
    return 'Mailbox(id: $id, name: $name, path: $path, type: $type, messageCount: $messageCount, unreadCount: $unreadCount, recentCount: $recentCount, isSelectable: $isSelectable, hasChildren: $hasChildren, isSubscribed: $isSubscribed, flags: $flags, parentPath: $parentPath, children: $children, lastSync: $lastSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailboxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.recentCount, recentCount) ||
                other.recentCount == recentCount) &&
            (identical(other.isSelectable, isSelectable) ||
                other.isSelectable == isSelectable) &&
            (identical(other.hasChildren, hasChildren) ||
                other.hasChildren == hasChildren) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.parentPath, parentPath) ||
                other.parentPath == parentPath) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      path,
      type,
      messageCount,
      unreadCount,
      recentCount,
      isSelectable,
      hasChildren,
      isSubscribed,
      const DeepCollectionEquality().hash(_flags),
      parentPath,
      const DeepCollectionEquality().hash(_children),
      lastSync);

  /// Create a copy of Mailbox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailboxImplCopyWith<_$MailboxImpl> get copyWith =>
      __$$MailboxImplCopyWithImpl<_$MailboxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailboxImplToJson(
      this,
    );
  }
}

abstract class _Mailbox implements Mailbox {
  const factory _Mailbox(
      {required final String id,
      required final String name,
      required final String path,
      required final MailboxType type,
      final int messageCount,
      final int unreadCount,
      final int recentCount,
      final bool isSelectable,
      final bool hasChildren,
      final bool isSubscribed,
      final List<MailboxFlag>? flags,
      final String? parentPath,
      final List<Mailbox>? children,
      final DateTime? lastSync}) = _$MailboxImpl;

  factory _Mailbox.fromJson(Map<String, dynamic> json) = _$MailboxImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
  @override
  MailboxType get type;
  @override
  int get messageCount;
  @override
  int get unreadCount;
  @override
  int get recentCount;
  @override
  bool get isSelectable;
  @override
  bool get hasChildren;
  @override
  bool get isSubscribed;
  @override
  List<MailboxFlag>? get flags;
  @override
  String? get parentPath;
  @override
  List<Mailbox>? get children;
  @override
  DateTime? get lastSync;

  /// Create a copy of Mailbox
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailboxImplCopyWith<_$MailboxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
