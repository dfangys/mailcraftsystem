// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncStatus _$SyncStatusFromJson(Map<String, dynamic> json) {
  return _SyncStatus.fromJson(json);
}

/// @nodoc
mixin _$SyncStatus {
  String get accountId => throw _privateConstructorUsedError;
  SyncState get state => throw _privateConstructorUsedError;
  DateTime get lastSync => throw _privateConstructorUsedError;
  DateTime? get nextSync => throw _privateConstructorUsedError;
  String? get currentMailbox => throw _privateConstructorUsedError;
  int? get totalMailboxes => throw _privateConstructorUsedError;
  int? get syncedMailboxes => throw _privateConstructorUsedError;
  int? get totalMessages => throw _privateConstructorUsedError;
  int? get syncedMessages => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  SyncProgress? get progress => throw _privateConstructorUsedError;

  /// Serializes this SyncStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncStatusCopyWith<SyncStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStatusCopyWith<$Res> {
  factory $SyncStatusCopyWith(
          SyncStatus value, $Res Function(SyncStatus) then) =
      _$SyncStatusCopyWithImpl<$Res, SyncStatus>;
  @useResult
  $Res call(
      {String accountId,
      SyncState state,
      DateTime lastSync,
      DateTime? nextSync,
      String? currentMailbox,
      int? totalMailboxes,
      int? syncedMailboxes,
      int? totalMessages,
      int? syncedMessages,
      String? error,
      SyncProgress? progress});

  $SyncProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class _$SyncStatusCopyWithImpl<$Res, $Val extends SyncStatus>
    implements $SyncStatusCopyWith<$Res> {
  _$SyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? state = null,
    Object? lastSync = null,
    Object? nextSync = freezed,
    Object? currentMailbox = freezed,
    Object? totalMailboxes = freezed,
    Object? syncedMailboxes = freezed,
    Object? totalMessages = freezed,
    Object? syncedMessages = freezed,
    Object? error = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SyncState,
      lastSync: null == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextSync: freezed == nextSync
          ? _value.nextSync
          : nextSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentMailbox: freezed == currentMailbox
          ? _value.currentMailbox
          : currentMailbox // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMailboxes: freezed == totalMailboxes
          ? _value.totalMailboxes
          : totalMailboxes // ignore: cast_nullable_to_non_nullable
              as int?,
      syncedMailboxes: freezed == syncedMailboxes
          ? _value.syncedMailboxes
          : syncedMailboxes // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMessages: freezed == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      syncedMessages: freezed == syncedMessages
          ? _value.syncedMessages
          : syncedMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      failure: core.Failure( freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as SyncProgress?,
    ) as $Val);
  }

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncProgressCopyWith<$Res>? get progress {
    if (_value.progress == null) {
      return null;
    }

    return $SyncProgressCopyWith<$Res>(_value.progress!, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SyncStatusImplCopyWith<$Res>
    implements $SyncStatusCopyWith<$Res> {
  factory _$$SyncStatusImplCopyWith(
          _$SyncStatusImpl value, $Res Function(_$SyncStatusImpl) then) =
      __$$SyncStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      SyncState state,
      DateTime lastSync,
      DateTime? nextSync,
      String? currentMailbox,
      int? totalMailboxes,
      int? syncedMailboxes,
      int? totalMessages,
      int? syncedMessages,
      String? error,
      SyncProgress? progress});

  @override
  $SyncProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class __$$SyncStatusImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncStatusImpl>
    implements _$$SyncStatusImplCopyWith<$Res> {
  __$$SyncStatusImplCopyWithImpl(
      _$SyncStatusImpl _value, $Res Function(_$SyncStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? state = null,
    Object? lastSync = null,
    Object? nextSync = freezed,
    Object? currentMailbox = freezed,
    Object? totalMailboxes = freezed,
    Object? syncedMailboxes = freezed,
    Object? totalMessages = freezed,
    Object? syncedMessages = freezed,
    Object? error = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$SyncStatusImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SyncState,
      lastSync: null == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextSync: freezed == nextSync
          ? _value.nextSync
          : nextSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentMailbox: freezed == currentMailbox
          ? _value.currentMailbox
          : currentMailbox // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMailboxes: freezed == totalMailboxes
          ? _value.totalMailboxes
          : totalMailboxes // ignore: cast_nullable_to_non_nullable
              as int?,
      syncedMailboxes: freezed == syncedMailboxes
          ? _value.syncedMailboxes
          : syncedMailboxes // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMessages: freezed == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      syncedMessages: freezed == syncedMessages
          ? _value.syncedMessages
          : syncedMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      failure: core.Failure( freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as SyncProgress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncStatusImpl implements _SyncStatus {
  const _$SyncStatusImpl(
      {required this.accountId,
      required this.state,
      required this.lastSync,
      this.nextSync,
      this.currentMailbox,
      this.totalMailboxes,
      this.syncedMailboxes,
      this.totalMessages,
      this.syncedMessages,
      this.error,
      this.progress});

  factory _$SyncStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncStatusImplFromJson(json);

  @override
  final String accountId;
  @override
  final SyncState state;
  @override
  final DateTime lastSync;
  @override
  final DateTime? nextSync;
  @override
  final String? currentMailbox;
  @override
  final int? totalMailboxes;
  @override
  final int? syncedMailboxes;
  @override
  final int? totalMessages;
  @override
  final int? syncedMessages;
  @override
  final String? error;
  @override
  final SyncProgress? progress;

  @override
  String toString() {
    return 'SyncStatus(accountId: $accountId, state: $state, lastSync: $lastSync, nextSync: $nextSync, currentMailbox: $currentMailbox, totalMailboxes: $totalMailboxes, syncedMailboxes: $syncedMailboxes, totalMessages: $totalMessages, syncedMessages: $syncedMessages, failure: core.Failure( $error, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatusImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            (identical(other.nextSync, nextSync) ||
                other.nextSync == nextSync) &&
            (identical(other.currentMailbox, currentMailbox) ||
                other.currentMailbox == currentMailbox) &&
            (identical(other.totalMailboxes, totalMailboxes) ||
                other.totalMailboxes == totalMailboxes) &&
            (identical(other.syncedMailboxes, syncedMailboxes) ||
                other.syncedMailboxes == syncedMailboxes) &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            (identical(other.syncedMessages, syncedMessages) ||
                other.syncedMessages == syncedMessages) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      state,
      lastSync,
      nextSync,
      currentMailbox,
      totalMailboxes,
      syncedMailboxes,
      totalMessages,
      syncedMessages,
      error,
      progress);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatusImplCopyWith<_$SyncStatusImpl> get copyWith =>
      __$$SyncStatusImplCopyWithImpl<_$SyncStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncStatusImplToJson(
      this,
    );
  }
}

abstract class _SyncStatus implements SyncStatus {
  const factory _SyncStatus(
      {required final String accountId,
      required final SyncState state,
      required final DateTime lastSync,
      final DateTime? nextSync,
      final String? currentMailbox,
      final int? totalMailboxes,
      final int? syncedMailboxes,
      final int? totalMessages,
      final int? syncedMessages,
      final String? error,
      final SyncProgress? progress}) = _$SyncStatusImpl;

  factory _SyncStatus.fromJson(Map<String, dynamic> json) =
      _$SyncStatusImpl.fromJson;

  @override
  String get accountId;
  @override
  SyncState get state;
  @override
  DateTime get lastSync;
  @override
  DateTime? get nextSync;
  @override
  String? get currentMailbox;
  @override
  int? get totalMailboxes;
  @override
  int? get syncedMailboxes;
  @override
  int? get totalMessages;
  @override
  int? get syncedMessages;
  @override
  String? get error;
  @override
  SyncProgress? get progress;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStatusImplCopyWith<_$SyncStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncProgress _$SyncProgressFromJson(Map<String, dynamic> json) {
  return _SyncProgress.fromJson(json);
}

/// @nodoc
mixin _$SyncProgress {
  double get percentage => throw _privateConstructorUsedError;
  String get currentOperation => throw _privateConstructorUsedError;
  String? get estimatedTimeRemaining => throw _privateConstructorUsedError;
  int? get itemsProcessed => throw _privateConstructorUsedError;
  int? get totalItems => throw _privateConstructorUsedError;

  /// Serializes this SyncProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncProgressCopyWith<SyncProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncProgressCopyWith<$Res> {
  factory $SyncProgressCopyWith(
          SyncProgress value, $Res Function(SyncProgress) then) =
      _$SyncProgressCopyWithImpl<$Res, SyncProgress>;
  @useResult
  $Res call(
      {double percentage,
      String currentOperation,
      String? estimatedTimeRemaining,
      int? itemsProcessed,
      int? totalItems});
}

/// @nodoc
class _$SyncProgressCopyWithImpl<$Res, $Val extends SyncProgress>
    implements $SyncProgressCopyWith<$Res> {
  _$SyncProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? currentOperation = null,
    Object? estimatedTimeRemaining = freezed,
    Object? itemsProcessed = freezed,
    Object? totalItems = freezed,
  }) {
    return _then(_value.copyWith(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      currentOperation: null == currentOperation
          ? _value.currentOperation
          : currentOperation // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedTimeRemaining: freezed == estimatedTimeRemaining
          ? _value.estimatedTimeRemaining
          : estimatedTimeRemaining // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsProcessed: freezed == itemsProcessed
          ? _value.itemsProcessed
          : itemsProcessed // ignore: cast_nullable_to_non_nullable
              as int?,
      totalItems: freezed == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncProgressImplCopyWith<$Res>
    implements $SyncProgressCopyWith<$Res> {
  factory _$$SyncProgressImplCopyWith(
          _$SyncProgressImpl value, $Res Function(_$SyncProgressImpl) then) =
      __$$SyncProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double percentage,
      String currentOperation,
      String? estimatedTimeRemaining,
      int? itemsProcessed,
      int? totalItems});
}

/// @nodoc
class __$$SyncProgressImplCopyWithImpl<$Res>
    extends _$SyncProgressCopyWithImpl<$Res, _$SyncProgressImpl>
    implements _$$SyncProgressImplCopyWith<$Res> {
  __$$SyncProgressImplCopyWithImpl(
      _$SyncProgressImpl _value, $Res Function(_$SyncProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? currentOperation = null,
    Object? estimatedTimeRemaining = freezed,
    Object? itemsProcessed = freezed,
    Object? totalItems = freezed,
  }) {
    return _then(_$SyncProgressImpl(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      currentOperation: null == currentOperation
          ? _value.currentOperation
          : currentOperation // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedTimeRemaining: freezed == estimatedTimeRemaining
          ? _value.estimatedTimeRemaining
          : estimatedTimeRemaining // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsProcessed: freezed == itemsProcessed
          ? _value.itemsProcessed
          : itemsProcessed // ignore: cast_nullable_to_non_nullable
              as int?,
      totalItems: freezed == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncProgressImpl implements _SyncProgress {
  const _$SyncProgressImpl(
      {required this.percentage,
      required this.currentOperation,
      this.estimatedTimeRemaining,
      this.itemsProcessed,
      this.totalItems});

  factory _$SyncProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncProgressImplFromJson(json);

  @override
  final double percentage;
  @override
  final String currentOperation;
  @override
  final String? estimatedTimeRemaining;
  @override
  final int? itemsProcessed;
  @override
  final int? totalItems;

  @override
  String toString() {
    return 'SyncProgress(percentage: $percentage, currentOperation: $currentOperation, estimatedTimeRemaining: $estimatedTimeRemaining, itemsProcessed: $itemsProcessed, totalItems: $totalItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncProgressImpl &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.currentOperation, currentOperation) ||
                other.currentOperation == currentOperation) &&
            (identical(other.estimatedTimeRemaining, estimatedTimeRemaining) ||
                other.estimatedTimeRemaining == estimatedTimeRemaining) &&
            (identical(other.itemsProcessed, itemsProcessed) ||
                other.itemsProcessed == itemsProcessed) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, percentage, currentOperation,
      estimatedTimeRemaining, itemsProcessed, totalItems);

  /// Create a copy of SyncProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncProgressImplCopyWith<_$SyncProgressImpl> get copyWith =>
      __$$SyncProgressImplCopyWithImpl<_$SyncProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncProgressImplToJson(
      this,
    );
  }
}

abstract class _SyncProgress implements SyncProgress {
  const factory _SyncProgress(
      {required final double percentage,
      required final String currentOperation,
      final String? estimatedTimeRemaining,
      final int? itemsProcessed,
      final int? totalItems}) = _$SyncProgressImpl;

  factory _SyncProgress.fromJson(Map<String, dynamic> json) =
      _$SyncProgressImpl.fromJson;

  @override
  double get percentage;
  @override
  String get currentOperation;
  @override
  String? get estimatedTimeRemaining;
  @override
  int? get itemsProcessed;
  @override
  int? get totalItems;

  /// Create a copy of SyncProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncProgressImplCopyWith<_$SyncProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncConfiguration _$SyncConfigurationFromJson(Map<String, dynamic> json) {
  return _SyncConfiguration.fromJson(json);
}

/// @nodoc
mixin _$SyncConfiguration {
  String get accountId => throw _privateConstructorUsedError;
  bool get autoSync => throw _privateConstructorUsedError;
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  bool get syncOnWifiOnly => throw _privateConstructorUsedError;
  bool get syncAttachments => throw _privateConstructorUsedError;
  int get maxMessagesPerMailbox => throw _privateConstructorUsedError;
  int get syncHistoryDays => throw _privateConstructorUsedError;
  List<String>? get excludedMailboxes => throw _privateConstructorUsedError;
  bool get enablePushNotifications => throw _privateConstructorUsedError;
  bool get syncInBackground => throw _privateConstructorUsedError;

  /// Serializes this SyncConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncConfigurationCopyWith<SyncConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncConfigurationCopyWith<$Res> {
  factory $SyncConfigurationCopyWith(
          SyncConfiguration value, $Res Function(SyncConfiguration) then) =
      _$SyncConfigurationCopyWithImpl<$Res, SyncConfiguration>;
  @useResult
  $Res call(
      {String accountId,
      bool autoSync,
      int syncIntervalMinutes,
      bool syncOnWifiOnly,
      bool syncAttachments,
      int maxMessagesPerMailbox,
      int syncHistoryDays,
      List<String>? excludedMailboxes,
      bool enablePushNotifications,
      bool syncInBackground});
}

/// @nodoc
class _$SyncConfigurationCopyWithImpl<$Res, $Val extends SyncConfiguration>
    implements $SyncConfigurationCopyWith<$Res> {
  _$SyncConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? autoSync = null,
    Object? syncIntervalMinutes = null,
    Object? syncOnWifiOnly = null,
    Object? syncAttachments = null,
    Object? maxMessagesPerMailbox = null,
    Object? syncHistoryDays = null,
    Object? excludedMailboxes = freezed,
    Object? enablePushNotifications = null,
    Object? syncInBackground = null,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      autoSync: null == autoSync
          ? _value.autoSync
          : autoSync // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      syncOnWifiOnly: null == syncOnWifiOnly
          ? _value.syncOnWifiOnly
          : syncOnWifiOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      syncAttachments: null == syncAttachments
          ? _value.syncAttachments
          : syncAttachments // ignore: cast_nullable_to_non_nullable
              as bool,
      maxMessagesPerMailbox: null == maxMessagesPerMailbox
          ? _value.maxMessagesPerMailbox
          : maxMessagesPerMailbox // ignore: cast_nullable_to_non_nullable
              as int,
      syncHistoryDays: null == syncHistoryDays
          ? _value.syncHistoryDays
          : syncHistoryDays // ignore: cast_nullable_to_non_nullable
              as int,
      excludedMailboxes: freezed == excludedMailboxes
          ? _value.excludedMailboxes
          : excludedMailboxes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enablePushNotifications: null == enablePushNotifications
          ? _value.enablePushNotifications
          : enablePushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      syncInBackground: null == syncInBackground
          ? _value.syncInBackground
          : syncInBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncConfigurationImplCopyWith<$Res>
    implements $SyncConfigurationCopyWith<$Res> {
  factory _$$SyncConfigurationImplCopyWith(_$SyncConfigurationImpl value,
          $Res Function(_$SyncConfigurationImpl) then) =
      __$$SyncConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      bool autoSync,
      int syncIntervalMinutes,
      bool syncOnWifiOnly,
      bool syncAttachments,
      int maxMessagesPerMailbox,
      int syncHistoryDays,
      List<String>? excludedMailboxes,
      bool enablePushNotifications,
      bool syncInBackground});
}

/// @nodoc
class __$$SyncConfigurationImplCopyWithImpl<$Res>
    extends _$SyncConfigurationCopyWithImpl<$Res, _$SyncConfigurationImpl>
    implements _$$SyncConfigurationImplCopyWith<$Res> {
  __$$SyncConfigurationImplCopyWithImpl(_$SyncConfigurationImpl _value,
      $Res Function(_$SyncConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? autoSync = null,
    Object? syncIntervalMinutes = null,
    Object? syncOnWifiOnly = null,
    Object? syncAttachments = null,
    Object? maxMessagesPerMailbox = null,
    Object? syncHistoryDays = null,
    Object? excludedMailboxes = freezed,
    Object? enablePushNotifications = null,
    Object? syncInBackground = null,
  }) {
    return _then(_$SyncConfigurationImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      autoSync: null == autoSync
          ? _value.autoSync
          : autoSync // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      syncOnWifiOnly: null == syncOnWifiOnly
          ? _value.syncOnWifiOnly
          : syncOnWifiOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      syncAttachments: null == syncAttachments
          ? _value.syncAttachments
          : syncAttachments // ignore: cast_nullable_to_non_nullable
              as bool,
      maxMessagesPerMailbox: null == maxMessagesPerMailbox
          ? _value.maxMessagesPerMailbox
          : maxMessagesPerMailbox // ignore: cast_nullable_to_non_nullable
              as int,
      syncHistoryDays: null == syncHistoryDays
          ? _value.syncHistoryDays
          : syncHistoryDays // ignore: cast_nullable_to_non_nullable
              as int,
      excludedMailboxes: freezed == excludedMailboxes
          ? _value._excludedMailboxes
          : excludedMailboxes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enablePushNotifications: null == enablePushNotifications
          ? _value.enablePushNotifications
          : enablePushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      syncInBackground: null == syncInBackground
          ? _value.syncInBackground
          : syncInBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncConfigurationImpl implements _SyncConfiguration {
  const _$SyncConfigurationImpl(
      {required this.accountId,
      this.autoSync = true,
      this.syncIntervalMinutes = 15,
      this.syncOnWifiOnly = true,
      this.syncAttachments = false,
      this.maxMessagesPerMailbox = 100,
      this.syncHistoryDays = 30,
      final List<String>? excludedMailboxes,
      this.enablePushNotifications = true,
      this.syncInBackground = false})
      : _excludedMailboxes = excludedMailboxes;

  factory _$SyncConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncConfigurationImplFromJson(json);

  @override
  final String accountId;
  @override
  @JsonKey()
  final bool autoSync;
  @override
  @JsonKey()
  final int syncIntervalMinutes;
  @override
  @JsonKey()
  final bool syncOnWifiOnly;
  @override
  @JsonKey()
  final bool syncAttachments;
  @override
  @JsonKey()
  final int maxMessagesPerMailbox;
  @override
  @JsonKey()
  final int syncHistoryDays;
  final List<String>? _excludedMailboxes;
  @override
  List<String>? get excludedMailboxes {
    final value = _excludedMailboxes;
    if (value == null) return null;
    if (_excludedMailboxes is EqualUnmodifiableListView)
      return _excludedMailboxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool enablePushNotifications;
  @override
  @JsonKey()
  final bool syncInBackground;

  @override
  String toString() {
    return 'SyncConfiguration(accountId: $accountId, autoSync: $autoSync, syncIntervalMinutes: $syncIntervalMinutes, syncOnWifiOnly: $syncOnWifiOnly, syncAttachments: $syncAttachments, maxMessagesPerMailbox: $maxMessagesPerMailbox, syncHistoryDays: $syncHistoryDays, excludedMailboxes: $excludedMailboxes, enablePushNotifications: $enablePushNotifications, syncInBackground: $syncInBackground)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncConfigurationImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.autoSync, autoSync) ||
                other.autoSync == autoSync) &&
            (identical(other.syncIntervalMinutes, syncIntervalMinutes) ||
                other.syncIntervalMinutes == syncIntervalMinutes) &&
            (identical(other.syncOnWifiOnly, syncOnWifiOnly) ||
                other.syncOnWifiOnly == syncOnWifiOnly) &&
            (identical(other.syncAttachments, syncAttachments) ||
                other.syncAttachments == syncAttachments) &&
            (identical(other.maxMessagesPerMailbox, maxMessagesPerMailbox) ||
                other.maxMessagesPerMailbox == maxMessagesPerMailbox) &&
            (identical(other.syncHistoryDays, syncHistoryDays) ||
                other.syncHistoryDays == syncHistoryDays) &&
            const DeepCollectionEquality()
                .equals(other._excludedMailboxes, _excludedMailboxes) &&
            (identical(
                    other.enablePushNotifications, enablePushNotifications) ||
                other.enablePushNotifications == enablePushNotifications) &&
            (identical(other.syncInBackground, syncInBackground) ||
                other.syncInBackground == syncInBackground));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      autoSync,
      syncIntervalMinutes,
      syncOnWifiOnly,
      syncAttachments,
      maxMessagesPerMailbox,
      syncHistoryDays,
      const DeepCollectionEquality().hash(_excludedMailboxes),
      enablePushNotifications,
      syncInBackground);

  /// Create a copy of SyncConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncConfigurationImplCopyWith<_$SyncConfigurationImpl> get copyWith =>
      __$$SyncConfigurationImplCopyWithImpl<_$SyncConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncConfigurationImplToJson(
      this,
    );
  }
}

abstract class _SyncConfiguration implements SyncConfiguration {
  const factory _SyncConfiguration(
      {required final String accountId,
      final bool autoSync,
      final int syncIntervalMinutes,
      final bool syncOnWifiOnly,
      final bool syncAttachments,
      final int maxMessagesPerMailbox,
      final int syncHistoryDays,
      final List<String>? excludedMailboxes,
      final bool enablePushNotifications,
      final bool syncInBackground}) = _$SyncConfigurationImpl;

  factory _SyncConfiguration.fromJson(Map<String, dynamic> json) =
      _$SyncConfigurationImpl.fromJson;

  @override
  String get accountId;
  @override
  bool get autoSync;
  @override
  int get syncIntervalMinutes;
  @override
  bool get syncOnWifiOnly;
  @override
  bool get syncAttachments;
  @override
  int get maxMessagesPerMailbox;
  @override
  int get syncHistoryDays;
  @override
  List<String>? get excludedMailboxes;
  @override
  bool get enablePushNotifications;
  @override
  bool get syncInBackground;

  /// Create a copy of SyncConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncConfigurationImplCopyWith<_$SyncConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncResult _$SyncResultFromJson(Map<String, dynamic> json) {
  return _SyncResult.fromJson(json);
}

/// @nodoc
mixin _$SyncResult {
  String get accountId => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get newMessages => throw _privateConstructorUsedError;
  int get updatedMessages => throw _privateConstructorUsedError;
  int get deletedMessages => throw _privateConstructorUsedError;
  int get syncedMailboxes => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;
  Map<String, int>? get mailboxMessageCounts =>
      throw _privateConstructorUsedError;

  /// Serializes this SyncResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncResultCopyWith<SyncResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncResultCopyWith<$Res> {
  factory $SyncResultCopyWith(
          SyncResult value, $Res Function(SyncResult) then) =
      _$SyncResultCopyWithImpl<$Res, SyncResult>;
  @useResult
  $Res call(
      {String accountId,
      bool success,
      DateTime startTime,
      DateTime endTime,
      int newMessages,
      int updatedMessages,
      int deletedMessages,
      int syncedMailboxes,
      List<String>? errors,
      Map<String, int>? mailboxMessageCounts});
}

/// @nodoc
class _$SyncResultCopyWithImpl<$Res, $Val extends SyncResult>
    implements $SyncResultCopyWith<$Res> {
  _$SyncResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? success = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? newMessages = null,
    Object? updatedMessages = null,
    Object? deletedMessages = null,
    Object? syncedMailboxes = null,
    Object? errors = freezed,
    Object? mailboxMessageCounts = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as int,
      updatedMessages: null == updatedMessages
          ? _value.updatedMessages
          : updatedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      deletedMessages: null == deletedMessages
          ? _value.deletedMessages
          : deletedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      syncedMailboxes: null == syncedMailboxes
          ? _value.syncedMailboxes
          : syncedMailboxes // ignore: cast_nullable_to_non_nullable
              as int,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mailboxMessageCounts: freezed == mailboxMessageCounts
          ? _value.mailboxMessageCounts
          : mailboxMessageCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncResultImplCopyWith<$Res>
    implements $SyncResultCopyWith<$Res> {
  factory _$$SyncResultImplCopyWith(
          _$SyncResultImpl value, $Res Function(_$SyncResultImpl) then) =
      __$$SyncResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      bool success,
      DateTime startTime,
      DateTime endTime,
      int newMessages,
      int updatedMessages,
      int deletedMessages,
      int syncedMailboxes,
      List<String>? errors,
      Map<String, int>? mailboxMessageCounts});
}

/// @nodoc
class __$$SyncResultImplCopyWithImpl<$Res>
    extends _$SyncResultCopyWithImpl<$Res, _$SyncResultImpl>
    implements _$$SyncResultImplCopyWith<$Res> {
  __$$SyncResultImplCopyWithImpl(
      _$SyncResultImpl _value, $Res Function(_$SyncResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? success = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? newMessages = null,
    Object? updatedMessages = null,
    Object? deletedMessages = null,
    Object? syncedMailboxes = null,
    Object? errors = freezed,
    Object? mailboxMessageCounts = freezed,
  }) {
    return _then(_$SyncResultImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as int,
      updatedMessages: null == updatedMessages
          ? _value.updatedMessages
          : updatedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      deletedMessages: null == deletedMessages
          ? _value.deletedMessages
          : deletedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      syncedMailboxes: null == syncedMailboxes
          ? _value.syncedMailboxes
          : syncedMailboxes // ignore: cast_nullable_to_non_nullable
              as int,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mailboxMessageCounts: freezed == mailboxMessageCounts
          ? _value._mailboxMessageCounts
          : mailboxMessageCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncResultImpl implements _SyncResult {
  const _$SyncResultImpl(
      {required this.accountId,
      required this.success,
      required this.startTime,
      required this.endTime,
      this.newMessages = 0,
      this.updatedMessages = 0,
      this.deletedMessages = 0,
      this.syncedMailboxes = 0,
      final List<String>? errors,
      final Map<String, int>? mailboxMessageCounts})
      : _errors = errors,
        _mailboxMessageCounts = mailboxMessageCounts;

  factory _$SyncResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncResultImplFromJson(json);

  @override
  final String accountId;
  @override
  final bool success;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @JsonKey()
  final int newMessages;
  @override
  @JsonKey()
  final int updatedMessages;
  @override
  @JsonKey()
  final int deletedMessages;
  @override
  @JsonKey()
  final int syncedMailboxes;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, int>? _mailboxMessageCounts;
  @override
  Map<String, int>? get mailboxMessageCounts {
    final value = _mailboxMessageCounts;
    if (value == null) return null;
    if (_mailboxMessageCounts is EqualUnmodifiableMapView)
      return _mailboxMessageCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SyncResult(accountId: $accountId, success: $success, startTime: $startTime, endTime: $endTime, newMessages: $newMessages, updatedMessages: $updatedMessages, deletedMessages: $deletedMessages, syncedMailboxes: $syncedMailboxes, errors: $errors, mailboxMessageCounts: $mailboxMessageCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncResultImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.newMessages, newMessages) ||
                other.newMessages == newMessages) &&
            (identical(other.updatedMessages, updatedMessages) ||
                other.updatedMessages == updatedMessages) &&
            (identical(other.deletedMessages, deletedMessages) ||
                other.deletedMessages == deletedMessages) &&
            (identical(other.syncedMailboxes, syncedMailboxes) ||
                other.syncedMailboxes == syncedMailboxes) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality()
                .equals(other._mailboxMessageCounts, _mailboxMessageCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      success,
      startTime,
      endTime,
      newMessages,
      updatedMessages,
      deletedMessages,
      syncedMailboxes,
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(_mailboxMessageCounts));

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncResultImplCopyWith<_$SyncResultImpl> get copyWith =>
      __$$SyncResultImplCopyWithImpl<_$SyncResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncResultImplToJson(
      this,
    );
  }
}

abstract class _SyncResult implements SyncResult {
  const factory _SyncResult(
      {required final String accountId,
      required final bool success,
      required final DateTime startTime,
      required final DateTime endTime,
      final int newMessages,
      final int updatedMessages,
      final int deletedMessages,
      final int syncedMailboxes,
      final List<String>? errors,
      final Map<String, int>? mailboxMessageCounts}) = _$SyncResultImpl;

  factory _SyncResult.fromJson(Map<String, dynamic> json) =
      _$SyncResultImpl.fromJson;

  @override
  String get accountId;
  @override
  bool get success;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get newMessages;
  @override
  int get updatedMessages;
  @override
  int get deletedMessages;
  @override
  int get syncedMailboxes;
  @override
  List<String>? get errors;
  @override
  Map<String, int>? get mailboxMessageCounts;

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncResultImplCopyWith<_$SyncResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
