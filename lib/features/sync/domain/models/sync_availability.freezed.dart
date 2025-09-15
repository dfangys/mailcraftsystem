// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_availability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncAvailability _$SyncAvailabilityFromJson(Map<String, dynamic> json) {
  return _SyncAvailability.fromJson(json);
}

/// @nodoc
mixin _$SyncAvailability {
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get hasNetworkConnection => throw _privateConstructorUsedError;
  bool get isOnWifi => throw _privateConstructorUsedError;
  bool get hasPermissions => throw _privateConstructorUsedError;
  bool get isAccountActive => throw _privateConstructorUsedError;
  List<String>? get restrictions => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this SyncAvailability to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncAvailabilityCopyWith<SyncAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncAvailabilityCopyWith<$Res> {
  factory $SyncAvailabilityCopyWith(
          SyncAvailability value, $Res Function(SyncAvailability) then) =
      _$SyncAvailabilityCopyWithImpl<$Res, SyncAvailability>;
  @useResult
  $Res call(
      {bool isAvailable,
      bool hasNetworkConnection,
      bool isOnWifi,
      bool hasPermissions,
      bool isAccountActive,
      List<String>? restrictions,
      String? reason});
}

/// @nodoc
class _$SyncAvailabilityCopyWithImpl<$Res, $Val extends SyncAvailability>
    implements $SyncAvailabilityCopyWith<$Res> {
  _$SyncAvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? hasNetworkConnection = null,
    Object? isOnWifi = null,
    Object? hasPermissions = null,
    Object? isAccountActive = null,
    Object? restrictions = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNetworkConnection: null == hasNetworkConnection
          ? _value.hasNetworkConnection
          : hasNetworkConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnWifi: null == isOnWifi
          ? _value.isOnWifi
          : isOnWifi // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermissions: null == hasPermissions
          ? _value.hasPermissions
          : hasPermissions // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountActive: null == isAccountActive
          ? _value.isAccountActive
          : isAccountActive // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictions: freezed == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncAvailabilityImplCopyWith<$Res>
    implements $SyncAvailabilityCopyWith<$Res> {
  factory _$$SyncAvailabilityImplCopyWith(_$SyncAvailabilityImpl value,
          $Res Function(_$SyncAvailabilityImpl) then) =
      __$$SyncAvailabilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAvailable,
      bool hasNetworkConnection,
      bool isOnWifi,
      bool hasPermissions,
      bool isAccountActive,
      List<String>? restrictions,
      String? reason});
}

/// @nodoc
class __$$SyncAvailabilityImplCopyWithImpl<$Res>
    extends _$SyncAvailabilityCopyWithImpl<$Res, _$SyncAvailabilityImpl>
    implements _$$SyncAvailabilityImplCopyWith<$Res> {
  __$$SyncAvailabilityImplCopyWithImpl(_$SyncAvailabilityImpl _value,
      $Res Function(_$SyncAvailabilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? hasNetworkConnection = null,
    Object? isOnWifi = null,
    Object? hasPermissions = null,
    Object? isAccountActive = null,
    Object? restrictions = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$SyncAvailabilityImpl(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNetworkConnection: null == hasNetworkConnection
          ? _value.hasNetworkConnection
          : hasNetworkConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnWifi: null == isOnWifi
          ? _value.isOnWifi
          : isOnWifi // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermissions: null == hasPermissions
          ? _value.hasPermissions
          : hasPermissions // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountActive: null == isAccountActive
          ? _value.isAccountActive
          : isAccountActive // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictions: freezed == restrictions
          ? _value._restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncAvailabilityImpl implements _SyncAvailability {
  const _$SyncAvailabilityImpl(
      {required this.isAvailable,
      required this.hasNetworkConnection,
      required this.isOnWifi,
      required this.hasPermissions,
      required this.isAccountActive,
      final List<String>? restrictions,
      this.reason})
      : _restrictions = restrictions;

  factory _$SyncAvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncAvailabilityImplFromJson(json);

  @override
  final bool isAvailable;
  @override
  final bool hasNetworkConnection;
  @override
  final bool isOnWifi;
  @override
  final bool hasPermissions;
  @override
  final bool isAccountActive;
  final List<String>? _restrictions;
  @override
  List<String>? get restrictions {
    final value = _restrictions;
    if (value == null) return null;
    if (_restrictions is EqualUnmodifiableListView) return _restrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? reason;

  @override
  String toString() {
    return 'SyncAvailability(isAvailable: $isAvailable, hasNetworkConnection: $hasNetworkConnection, isOnWifi: $isOnWifi, hasPermissions: $hasPermissions, isAccountActive: $isAccountActive, restrictions: $restrictions, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncAvailabilityImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.hasNetworkConnection, hasNetworkConnection) ||
                other.hasNetworkConnection == hasNetworkConnection) &&
            (identical(other.isOnWifi, isOnWifi) ||
                other.isOnWifi == isOnWifi) &&
            (identical(other.hasPermissions, hasPermissions) ||
                other.hasPermissions == hasPermissions) &&
            (identical(other.isAccountActive, isAccountActive) ||
                other.isAccountActive == isAccountActive) &&
            const DeepCollectionEquality()
                .equals(other._restrictions, _restrictions) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAvailable,
      hasNetworkConnection,
      isOnWifi,
      hasPermissions,
      isAccountActive,
      const DeepCollectionEquality().hash(_restrictions),
      reason);

  /// Create a copy of SyncAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncAvailabilityImplCopyWith<_$SyncAvailabilityImpl> get copyWith =>
      __$$SyncAvailabilityImplCopyWithImpl<_$SyncAvailabilityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncAvailabilityImplToJson(
      this,
    );
  }
}

abstract class _SyncAvailability implements SyncAvailability {
  const factory _SyncAvailability(
      {required final bool isAvailable,
      required final bool hasNetworkConnection,
      required final bool isOnWifi,
      required final bool hasPermissions,
      required final bool isAccountActive,
      final List<String>? restrictions,
      final String? reason}) = _$SyncAvailabilityImpl;

  factory _SyncAvailability.fromJson(Map<String, dynamic> json) =
      _$SyncAvailabilityImpl.fromJson;

  @override
  bool get isAvailable;
  @override
  bool get hasNetworkConnection;
  @override
  bool get isOnWifi;
  @override
  bool get hasPermissions;
  @override
  bool get isAccountActive;
  @override
  List<String>? get restrictions;
  @override
  String? get reason;

  /// Create a copy of SyncAvailability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncAvailabilityImplCopyWith<_$SyncAvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncEstimate _$SyncEstimateFromJson(Map<String, dynamic> json) {
  return _SyncEstimate.fromJson(json);
}

/// @nodoc
mixin _$SyncEstimate {
  Duration get estimatedDuration => throw _privateConstructorUsedError;
  int get estimatedDataUsage => throw _privateConstructorUsedError;
  int get estimatedNewMessages => throw _privateConstructorUsedError;
  Map<String, int> get mailboxEstimates => throw _privateConstructorUsedError;
  DateTime? get estimatedCompletion => throw _privateConstructorUsedError;

  /// Serializes this SyncEstimate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncEstimate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncEstimateCopyWith<SyncEstimate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncEstimateCopyWith<$Res> {
  factory $SyncEstimateCopyWith(
          SyncEstimate value, $Res Function(SyncEstimate) then) =
      _$SyncEstimateCopyWithImpl<$Res, SyncEstimate>;
  @useResult
  $Res call(
      {Duration estimatedDuration,
      int estimatedDataUsage,
      int estimatedNewMessages,
      Map<String, int> mailboxEstimates,
      DateTime? estimatedCompletion});
}

/// @nodoc
class _$SyncEstimateCopyWithImpl<$Res, $Val extends SyncEstimate>
    implements $SyncEstimateCopyWith<$Res> {
  _$SyncEstimateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncEstimate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedDuration = null,
    Object? estimatedDataUsage = null,
    Object? estimatedNewMessages = null,
    Object? mailboxEstimates = null,
    Object? estimatedCompletion = freezed,
  }) {
    return _then(_value.copyWith(
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      estimatedDataUsage: null == estimatedDataUsage
          ? _value.estimatedDataUsage
          : estimatedDataUsage // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedNewMessages: null == estimatedNewMessages
          ? _value.estimatedNewMessages
          : estimatedNewMessages // ignore: cast_nullable_to_non_nullable
              as int,
      mailboxEstimates: null == mailboxEstimates
          ? _value.mailboxEstimates
          : mailboxEstimates // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      estimatedCompletion: freezed == estimatedCompletion
          ? _value.estimatedCompletion
          : estimatedCompletion // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncEstimateImplCopyWith<$Res>
    implements $SyncEstimateCopyWith<$Res> {
  factory _$$SyncEstimateImplCopyWith(
          _$SyncEstimateImpl value, $Res Function(_$SyncEstimateImpl) then) =
      __$$SyncEstimateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration estimatedDuration,
      int estimatedDataUsage,
      int estimatedNewMessages,
      Map<String, int> mailboxEstimates,
      DateTime? estimatedCompletion});
}

/// @nodoc
class __$$SyncEstimateImplCopyWithImpl<$Res>
    extends _$SyncEstimateCopyWithImpl<$Res, _$SyncEstimateImpl>
    implements _$$SyncEstimateImplCopyWith<$Res> {
  __$$SyncEstimateImplCopyWithImpl(
      _$SyncEstimateImpl _value, $Res Function(_$SyncEstimateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncEstimate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedDuration = null,
    Object? estimatedDataUsage = null,
    Object? estimatedNewMessages = null,
    Object? mailboxEstimates = null,
    Object? estimatedCompletion = freezed,
  }) {
    return _then(_$SyncEstimateImpl(
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      estimatedDataUsage: null == estimatedDataUsage
          ? _value.estimatedDataUsage
          : estimatedDataUsage // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedNewMessages: null == estimatedNewMessages
          ? _value.estimatedNewMessages
          : estimatedNewMessages // ignore: cast_nullable_to_non_nullable
              as int,
      mailboxEstimates: null == mailboxEstimates
          ? _value._mailboxEstimates
          : mailboxEstimates // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      estimatedCompletion: freezed == estimatedCompletion
          ? _value.estimatedCompletion
          : estimatedCompletion // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncEstimateImpl implements _SyncEstimate {
  const _$SyncEstimateImpl(
      {required this.estimatedDuration,
      required this.estimatedDataUsage,
      required this.estimatedNewMessages,
      required final Map<String, int> mailboxEstimates,
      this.estimatedCompletion})
      : _mailboxEstimates = mailboxEstimates;

  factory _$SyncEstimateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncEstimateImplFromJson(json);

  @override
  final Duration estimatedDuration;
  @override
  final int estimatedDataUsage;
  @override
  final int estimatedNewMessages;
  final Map<String, int> _mailboxEstimates;
  @override
  Map<String, int> get mailboxEstimates {
    if (_mailboxEstimates is EqualUnmodifiableMapView) return _mailboxEstimates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mailboxEstimates);
  }

  @override
  final DateTime? estimatedCompletion;

  @override
  String toString() {
    return 'SyncEstimate(estimatedDuration: $estimatedDuration, estimatedDataUsage: $estimatedDataUsage, estimatedNewMessages: $estimatedNewMessages, mailboxEstimates: $mailboxEstimates, estimatedCompletion: $estimatedCompletion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncEstimateImpl &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            (identical(other.estimatedDataUsage, estimatedDataUsage) ||
                other.estimatedDataUsage == estimatedDataUsage) &&
            (identical(other.estimatedNewMessages, estimatedNewMessages) ||
                other.estimatedNewMessages == estimatedNewMessages) &&
            const DeepCollectionEquality()
                .equals(other._mailboxEstimates, _mailboxEstimates) &&
            (identical(other.estimatedCompletion, estimatedCompletion) ||
                other.estimatedCompletion == estimatedCompletion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      estimatedDuration,
      estimatedDataUsage,
      estimatedNewMessages,
      const DeepCollectionEquality().hash(_mailboxEstimates),
      estimatedCompletion);

  /// Create a copy of SyncEstimate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncEstimateImplCopyWith<_$SyncEstimateImpl> get copyWith =>
      __$$SyncEstimateImplCopyWithImpl<_$SyncEstimateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncEstimateImplToJson(
      this,
    );
  }
}

abstract class _SyncEstimate implements SyncEstimate {
  const factory _SyncEstimate(
      {required final Duration estimatedDuration,
      required final int estimatedDataUsage,
      required final int estimatedNewMessages,
      required final Map<String, int> mailboxEstimates,
      final DateTime? estimatedCompletion}) = _$SyncEstimateImpl;

  factory _SyncEstimate.fromJson(Map<String, dynamic> json) =
      _$SyncEstimateImpl.fromJson;

  @override
  Duration get estimatedDuration;
  @override
  int get estimatedDataUsage;
  @override
  int get estimatedNewMessages;
  @override
  Map<String, int> get mailboxEstimates;
  @override
  DateTime? get estimatedCompletion;

  /// Create a copy of SyncEstimate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncEstimateImplCopyWith<_$SyncEstimateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncStatistics _$SyncStatisticsFromJson(Map<String, dynamic> json) {
  return _SyncStatistics.fromJson(json);
}

/// @nodoc
mixin _$SyncStatistics {
  String get accountId => throw _privateConstructorUsedError;
  int get totalSyncs => throw _privateConstructorUsedError;
  int get successfulSyncs => throw _privateConstructorUsedError;
  int get failedSyncs => throw _privateConstructorUsedError;
  Duration get totalSyncTime => throw _privateConstructorUsedError;
  Duration get averageSyncTime => throw _privateConstructorUsedError;
  int get totalMessagesSynced => throw _privateConstructorUsedError;
  int get totalDataTransferred => throw _privateConstructorUsedError;
  DateTime? get firstSync => throw _privateConstructorUsedError;
  DateTime? get lastSuccessfulSync => throw _privateConstructorUsedError;
  Map<String, int>? get errorCounts => throw _privateConstructorUsedError;

  /// Serializes this SyncStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncStatisticsCopyWith<SyncStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStatisticsCopyWith<$Res> {
  factory $SyncStatisticsCopyWith(
          SyncStatistics value, $Res Function(SyncStatistics) then) =
      _$SyncStatisticsCopyWithImpl<$Res, SyncStatistics>;
  @useResult
  $Res call(
      {String accountId,
      int totalSyncs,
      int successfulSyncs,
      int failedSyncs,
      Duration totalSyncTime,
      Duration averageSyncTime,
      int totalMessagesSynced,
      int totalDataTransferred,
      DateTime? firstSync,
      DateTime? lastSuccessfulSync,
      Map<String, int>? errorCounts});
}

/// @nodoc
class _$SyncStatisticsCopyWithImpl<$Res, $Val extends SyncStatistics>
    implements $SyncStatisticsCopyWith<$Res> {
  _$SyncStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? totalSyncs = null,
    Object? successfulSyncs = null,
    Object? failedSyncs = null,
    Object? totalSyncTime = null,
    Object? averageSyncTime = null,
    Object? totalMessagesSynced = null,
    Object? totalDataTransferred = null,
    Object? firstSync = freezed,
    Object? lastSuccessfulSync = freezed,
    Object? errorCounts = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      totalSyncs: null == totalSyncs
          ? _value.totalSyncs
          : totalSyncs // ignore: cast_nullable_to_non_nullable
              as int,
      successfulSyncs: null == successfulSyncs
          ? _value.successfulSyncs
          : successfulSyncs // ignore: cast_nullable_to_non_nullable
              as int,
      failedSyncs: null == failedSyncs
          ? _value.failedSyncs
          : failedSyncs // ignore: cast_nullable_to_non_nullable
              as int,
      totalSyncTime: null == totalSyncTime
          ? _value.totalSyncTime
          : totalSyncTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      averageSyncTime: null == averageSyncTime
          ? _value.averageSyncTime
          : averageSyncTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalMessagesSynced: null == totalMessagesSynced
          ? _value.totalMessagesSynced
          : totalMessagesSynced // ignore: cast_nullable_to_non_nullable
              as int,
      totalDataTransferred: null == totalDataTransferred
          ? _value.totalDataTransferred
          : totalDataTransferred // ignore: cast_nullable_to_non_nullable
              as int,
      firstSync: freezed == firstSync
          ? _value.firstSync
          : firstSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSuccessfulSync: freezed == lastSuccessfulSync
          ? _value.lastSuccessfulSync
          : lastSuccessfulSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorCounts: freezed == errorCounts
          ? _value.errorCounts
          : errorCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncStatisticsImplCopyWith<$Res>
    implements $SyncStatisticsCopyWith<$Res> {
  factory _$$SyncStatisticsImplCopyWith(_$SyncStatisticsImpl value,
          $Res Function(_$SyncStatisticsImpl) then) =
      __$$SyncStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      int totalSyncs,
      int successfulSyncs,
      int failedSyncs,
      Duration totalSyncTime,
      Duration averageSyncTime,
      int totalMessagesSynced,
      int totalDataTransferred,
      DateTime? firstSync,
      DateTime? lastSuccessfulSync,
      Map<String, int>? errorCounts});
}

/// @nodoc
class __$$SyncStatisticsImplCopyWithImpl<$Res>
    extends _$SyncStatisticsCopyWithImpl<$Res, _$SyncStatisticsImpl>
    implements _$$SyncStatisticsImplCopyWith<$Res> {
  __$$SyncStatisticsImplCopyWithImpl(
      _$SyncStatisticsImpl _value, $Res Function(_$SyncStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? totalSyncs = null,
    Object? successfulSyncs = null,
    Object? failedSyncs = null,
    Object? totalSyncTime = null,
    Object? averageSyncTime = null,
    Object? totalMessagesSynced = null,
    Object? totalDataTransferred = null,
    Object? firstSync = freezed,
    Object? lastSuccessfulSync = freezed,
    Object? errorCounts = freezed,
  }) {
    return _then(_$SyncStatisticsImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      totalSyncs: null == totalSyncs
          ? _value.totalSyncs
          : totalSyncs // ignore: cast_nullable_to_non_nullable
              as int,
      successfulSyncs: null == successfulSyncs
          ? _value.successfulSyncs
          : successfulSyncs // ignore: cast_nullable_to_non_nullable
              as int,
      failedSyncs: null == failedSyncs
          ? _value.failedSyncs
          : failedSyncs // ignore: cast_nullable_to_non_nullable
              as int,
      totalSyncTime: null == totalSyncTime
          ? _value.totalSyncTime
          : totalSyncTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      averageSyncTime: null == averageSyncTime
          ? _value.averageSyncTime
          : averageSyncTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalMessagesSynced: null == totalMessagesSynced
          ? _value.totalMessagesSynced
          : totalMessagesSynced // ignore: cast_nullable_to_non_nullable
              as int,
      totalDataTransferred: null == totalDataTransferred
          ? _value.totalDataTransferred
          : totalDataTransferred // ignore: cast_nullable_to_non_nullable
              as int,
      firstSync: freezed == firstSync
          ? _value.firstSync
          : firstSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSuccessfulSync: freezed == lastSuccessfulSync
          ? _value.lastSuccessfulSync
          : lastSuccessfulSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorCounts: freezed == errorCounts
          ? _value._errorCounts
          : errorCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncStatisticsImpl implements _SyncStatistics {
  const _$SyncStatisticsImpl(
      {required this.accountId,
      required this.totalSyncs,
      required this.successfulSyncs,
      required this.failedSyncs,
      required this.totalSyncTime,
      required this.averageSyncTime,
      required this.totalMessagesSynced,
      required this.totalDataTransferred,
      this.firstSync,
      this.lastSuccessfulSync,
      final Map<String, int>? errorCounts})
      : _errorCounts = errorCounts;

  factory _$SyncStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncStatisticsImplFromJson(json);

  @override
  final String accountId;
  @override
  final int totalSyncs;
  @override
  final int successfulSyncs;
  @override
  final int failedSyncs;
  @override
  final Duration totalSyncTime;
  @override
  final Duration averageSyncTime;
  @override
  final int totalMessagesSynced;
  @override
  final int totalDataTransferred;
  @override
  final DateTime? firstSync;
  @override
  final DateTime? lastSuccessfulSync;
  final Map<String, int>? _errorCounts;
  @override
  Map<String, int>? get errorCounts {
    final value = _errorCounts;
    if (value == null) return null;
    if (_errorCounts is EqualUnmodifiableMapView) return _errorCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SyncStatistics(accountId: $accountId, totalSyncs: $totalSyncs, successfulSyncs: $successfulSyncs, failedSyncs: $failedSyncs, totalSyncTime: $totalSyncTime, averageSyncTime: $averageSyncTime, totalMessagesSynced: $totalMessagesSynced, totalDataTransferred: $totalDataTransferred, firstSync: $firstSync, lastSuccessfulSync: $lastSuccessfulSync, errorCounts: $errorCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatisticsImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.totalSyncs, totalSyncs) ||
                other.totalSyncs == totalSyncs) &&
            (identical(other.successfulSyncs, successfulSyncs) ||
                other.successfulSyncs == successfulSyncs) &&
            (identical(other.failedSyncs, failedSyncs) ||
                other.failedSyncs == failedSyncs) &&
            (identical(other.totalSyncTime, totalSyncTime) ||
                other.totalSyncTime == totalSyncTime) &&
            (identical(other.averageSyncTime, averageSyncTime) ||
                other.averageSyncTime == averageSyncTime) &&
            (identical(other.totalMessagesSynced, totalMessagesSynced) ||
                other.totalMessagesSynced == totalMessagesSynced) &&
            (identical(other.totalDataTransferred, totalDataTransferred) ||
                other.totalDataTransferred == totalDataTransferred) &&
            (identical(other.firstSync, firstSync) ||
                other.firstSync == firstSync) &&
            (identical(other.lastSuccessfulSync, lastSuccessfulSync) ||
                other.lastSuccessfulSync == lastSuccessfulSync) &&
            const DeepCollectionEquality()
                .equals(other._errorCounts, _errorCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      totalSyncs,
      successfulSyncs,
      failedSyncs,
      totalSyncTime,
      averageSyncTime,
      totalMessagesSynced,
      totalDataTransferred,
      firstSync,
      lastSuccessfulSync,
      const DeepCollectionEquality().hash(_errorCounts));

  /// Create a copy of SyncStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatisticsImplCopyWith<_$SyncStatisticsImpl> get copyWith =>
      __$$SyncStatisticsImplCopyWithImpl<_$SyncStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncStatisticsImplToJson(
      this,
    );
  }
}

abstract class _SyncStatistics implements SyncStatistics {
  const factory _SyncStatistics(
      {required final String accountId,
      required final int totalSyncs,
      required final int successfulSyncs,
      required final int failedSyncs,
      required final Duration totalSyncTime,
      required final Duration averageSyncTime,
      required final int totalMessagesSynced,
      required final int totalDataTransferred,
      final DateTime? firstSync,
      final DateTime? lastSuccessfulSync,
      final Map<String, int>? errorCounts}) = _$SyncStatisticsImpl;

  factory _SyncStatistics.fromJson(Map<String, dynamic> json) =
      _$SyncStatisticsImpl.fromJson;

  @override
  String get accountId;
  @override
  int get totalSyncs;
  @override
  int get successfulSyncs;
  @override
  int get failedSyncs;
  @override
  Duration get totalSyncTime;
  @override
  Duration get averageSyncTime;
  @override
  int get totalMessagesSynced;
  @override
  int get totalDataTransferred;
  @override
  DateTime? get firstSync;
  @override
  DateTime? get lastSuccessfulSync;
  @override
  Map<String, int>? get errorCounts;

  /// Create a copy of SyncStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStatisticsImplCopyWith<_$SyncStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
