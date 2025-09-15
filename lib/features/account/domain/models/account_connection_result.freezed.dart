// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_connection_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountConnectionResult _$AccountConnectionResultFromJson(
    Map<String, dynamic> json) {
  return _AccountConnectionResult.fromJson(json);
}

/// @nodoc
mixin _$AccountConnectionResult {
  bool get imapConnected => throw _privateConstructorUsedError;
  bool get smtpConnected => throw _privateConstructorUsedError;
  String? get imapError => throw _privateConstructorUsedError;
  String? get smtpError => throw _privateConstructorUsedError;
  AccountCapabilities? get capabilities => throw _privateConstructorUsedError;

  /// Serializes this AccountConnectionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountConnectionResultCopyWith<AccountConnectionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountConnectionResultCopyWith<$Res> {
  factory $AccountConnectionResultCopyWith(AccountConnectionResult value,
          $Res Function(AccountConnectionResult) then) =
      _$AccountConnectionResultCopyWithImpl<$Res, AccountConnectionResult>;
  @useResult
  $Res call(
      {bool imapConnected,
      bool smtpConnected,
      String? imapError,
      String? smtpError,
      AccountCapabilities? capabilities});

  $AccountCapabilitiesCopyWith<$Res>? get capabilities;
}

/// @nodoc
class _$AccountConnectionResultCopyWithImpl<$Res,
        $Val extends AccountConnectionResult>
    implements $AccountConnectionResultCopyWith<$Res> {
  _$AccountConnectionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imapConnected = null,
    Object? smtpConnected = null,
    Object? imapError = freezed,
    Object? smtpError = freezed,
    Object? capabilities = freezed,
  }) {
    return _then(_value.copyWith(
      imapConnected: null == imapConnected
          ? _value.imapConnected
          : imapConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      smtpConnected: null == smtpConnected
          ? _value.smtpConnected
          : smtpConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      imapError: freezed == imapError
          ? _value.imapError
          : imapError // ignore: cast_nullable_to_non_nullable
              as String?,
      smtpError: freezed == smtpError
          ? _value.smtpError
          : smtpError // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as AccountCapabilities?,
    ) as $Val);
  }

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCapabilitiesCopyWith<$Res>? get capabilities {
    if (_value.capabilities == null) {
      return null;
    }

    return $AccountCapabilitiesCopyWith<$Res>(_value.capabilities!, (value) {
      return _then(_value.copyWith(capabilities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountConnectionResultImplCopyWith<$Res>
    implements $AccountConnectionResultCopyWith<$Res> {
  factory _$$AccountConnectionResultImplCopyWith(
          _$AccountConnectionResultImpl value,
          $Res Function(_$AccountConnectionResultImpl) then) =
      __$$AccountConnectionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool imapConnected,
      bool smtpConnected,
      String? imapError,
      String? smtpError,
      AccountCapabilities? capabilities});

  @override
  $AccountCapabilitiesCopyWith<$Res>? get capabilities;
}

/// @nodoc
class __$$AccountConnectionResultImplCopyWithImpl<$Res>
    extends _$AccountConnectionResultCopyWithImpl<$Res,
        _$AccountConnectionResultImpl>
    implements _$$AccountConnectionResultImplCopyWith<$Res> {
  __$$AccountConnectionResultImplCopyWithImpl(
      _$AccountConnectionResultImpl _value,
      $Res Function(_$AccountConnectionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imapConnected = null,
    Object? smtpConnected = null,
    Object? imapError = freezed,
    Object? smtpError = freezed,
    Object? capabilities = freezed,
  }) {
    return _then(_$AccountConnectionResultImpl(
      imapConnected: null == imapConnected
          ? _value.imapConnected
          : imapConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      smtpConnected: null == smtpConnected
          ? _value.smtpConnected
          : smtpConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      imapError: freezed == imapError
          ? _value.imapError
          : imapError // ignore: cast_nullable_to_non_nullable
              as String?,
      smtpError: freezed == smtpError
          ? _value.smtpError
          : smtpError // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as AccountCapabilities?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountConnectionResultImpl implements _AccountConnectionResult {
  const _$AccountConnectionResultImpl(
      {required this.imapConnected,
      required this.smtpConnected,
      this.imapError,
      this.smtpError,
      this.capabilities});

  factory _$AccountConnectionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountConnectionResultImplFromJson(json);

  @override
  final bool imapConnected;
  @override
  final bool smtpConnected;
  @override
  final String? imapError;
  @override
  final String? smtpError;
  @override
  final AccountCapabilities? capabilities;

  @override
  String toString() {
    return 'AccountConnectionResult(imapConnected: $imapConnected, smtpConnected: $smtpConnected, imapError: $imapError, smtpError: $smtpError, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountConnectionResultImpl &&
            (identical(other.imapConnected, imapConnected) ||
                other.imapConnected == imapConnected) &&
            (identical(other.smtpConnected, smtpConnected) ||
                other.smtpConnected == smtpConnected) &&
            (identical(other.imapError, imapError) ||
                other.imapError == imapError) &&
            (identical(other.smtpError, smtpError) ||
                other.smtpError == smtpError) &&
            (identical(other.capabilities, capabilities) ||
                other.capabilities == capabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imapConnected, smtpConnected,
      imapError, smtpError, capabilities);

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountConnectionResultImplCopyWith<_$AccountConnectionResultImpl>
      get copyWith => __$$AccountConnectionResultImplCopyWithImpl<
          _$AccountConnectionResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountConnectionResultImplToJson(
      this,
    );
  }
}

abstract class _AccountConnectionResult implements AccountConnectionResult {
  const factory _AccountConnectionResult(
      {required final bool imapConnected,
      required final bool smtpConnected,
      final String? imapError,
      final String? smtpError,
      final AccountCapabilities? capabilities}) = _$AccountConnectionResultImpl;

  factory _AccountConnectionResult.fromJson(Map<String, dynamic> json) =
      _$AccountConnectionResultImpl.fromJson;

  @override
  bool get imapConnected;
  @override
  bool get smtpConnected;
  @override
  String? get imapError;
  @override
  String? get smtpError;
  @override
  AccountCapabilities? get capabilities;

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountConnectionResultImplCopyWith<_$AccountConnectionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AccountValidationResult _$AccountValidationResultFromJson(
    Map<String, dynamic> json) {
  return _AccountValidationResult.fromJson(json);
}

/// @nodoc
mixin _$AccountValidationResult {
  bool get isValid => throw _privateConstructorUsedError;
  Map<String, String>? get fieldErrors => throw _privateConstructorUsedError;
  List<String>? get warnings => throw _privateConstructorUsedError;

  /// Serializes this AccountValidationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountValidationResultCopyWith<AccountValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountValidationResultCopyWith<$Res> {
  factory $AccountValidationResultCopyWith(AccountValidationResult value,
          $Res Function(AccountValidationResult) then) =
      _$AccountValidationResultCopyWithImpl<$Res, AccountValidationResult>;
  @useResult
  $Res call(
      {bool isValid, Map<String, String>? fieldErrors, List<String>? warnings});
}

/// @nodoc
class _$AccountValidationResultCopyWithImpl<$Res,
        $Val extends AccountValidationResult>
    implements $AccountValidationResultCopyWith<$Res> {
  _$AccountValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? fieldErrors = freezed,
    Object? warnings = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      fieldErrors: freezed == fieldErrors
          ? _value.fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      warnings: freezed == warnings
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountValidationResultImplCopyWith<$Res>
    implements $AccountValidationResultCopyWith<$Res> {
  factory _$$AccountValidationResultImplCopyWith(
          _$AccountValidationResultImpl value,
          $Res Function(_$AccountValidationResultImpl) then) =
      __$$AccountValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid, Map<String, String>? fieldErrors, List<String>? warnings});
}

/// @nodoc
class __$$AccountValidationResultImplCopyWithImpl<$Res>
    extends _$AccountValidationResultCopyWithImpl<$Res,
        _$AccountValidationResultImpl>
    implements _$$AccountValidationResultImplCopyWith<$Res> {
  __$$AccountValidationResultImplCopyWithImpl(
      _$AccountValidationResultImpl _value,
      $Res Function(_$AccountValidationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? fieldErrors = freezed,
    Object? warnings = freezed,
  }) {
    return _then(_$AccountValidationResultImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      fieldErrors: freezed == fieldErrors
          ? _value._fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      warnings: freezed == warnings
          ? _value._warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountValidationResultImpl implements _AccountValidationResult {
  const _$AccountValidationResultImpl(
      {required this.isValid,
      final Map<String, String>? fieldErrors,
      final List<String>? warnings})
      : _fieldErrors = fieldErrors,
        _warnings = warnings;

  factory _$AccountValidationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountValidationResultImplFromJson(json);

  @override
  final bool isValid;
  final Map<String, String>? _fieldErrors;
  @override
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _warnings;
  @override
  List<String>? get warnings {
    final value = _warnings;
    if (value == null) return null;
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AccountValidationResult(isValid: $isValid, fieldErrors: $fieldErrors, warnings: $warnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountValidationResultImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality()
                .equals(other._fieldErrors, _fieldErrors) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isValid,
      const DeepCollectionEquality().hash(_fieldErrors),
      const DeepCollectionEquality().hash(_warnings));

  /// Create a copy of AccountValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountValidationResultImplCopyWith<_$AccountValidationResultImpl>
      get copyWith => __$$AccountValidationResultImplCopyWithImpl<
          _$AccountValidationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountValidationResultImplToJson(
      this,
    );
  }
}

abstract class _AccountValidationResult implements AccountValidationResult {
  const factory _AccountValidationResult(
      {required final bool isValid,
      final Map<String, String>? fieldErrors,
      final List<String>? warnings}) = _$AccountValidationResultImpl;

  factory _AccountValidationResult.fromJson(Map<String, dynamic> json) =
      _$AccountValidationResultImpl.fromJson;

  @override
  bool get isValid;
  @override
  Map<String, String>? get fieldErrors;
  @override
  List<String>? get warnings;

  /// Create a copy of AccountValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountValidationResultImplCopyWith<_$AccountValidationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AccountCapabilities _$AccountCapabilitiesFromJson(Map<String, dynamic> json) {
  return _AccountCapabilities.fromJson(json);
}

/// @nodoc
mixin _$AccountCapabilities {
  bool get supportsIdle => throw _privateConstructorUsedError;
  bool get supportsMove => throw _privateConstructorUsedError;
  bool get supportsSort => throw _privateConstructorUsedError;
  bool get supportsSearch => throw _privateConstructorUsedError;
  bool get supportsQuota => throw _privateConstructorUsedError;
  bool get supportsUidPlus => throw _privateConstructorUsedError;
  List<String>? get supportedExtensions => throw _privateConstructorUsedError;
  int? get maxMessageSize => throw _privateConstructorUsedError;

  /// Serializes this AccountCapabilities to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCapabilitiesCopyWith<AccountCapabilities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCapabilitiesCopyWith<$Res> {
  factory $AccountCapabilitiesCopyWith(
          AccountCapabilities value, $Res Function(AccountCapabilities) then) =
      _$AccountCapabilitiesCopyWithImpl<$Res, AccountCapabilities>;
  @useResult
  $Res call(
      {bool supportsIdle,
      bool supportsMove,
      bool supportsSort,
      bool supportsSearch,
      bool supportsQuota,
      bool supportsUidPlus,
      List<String>? supportedExtensions,
      int? maxMessageSize});
}

/// @nodoc
class _$AccountCapabilitiesCopyWithImpl<$Res, $Val extends AccountCapabilities>
    implements $AccountCapabilitiesCopyWith<$Res> {
  _$AccountCapabilitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportsIdle = null,
    Object? supportsMove = null,
    Object? supportsSort = null,
    Object? supportsSearch = null,
    Object? supportsQuota = null,
    Object? supportsUidPlus = null,
    Object? supportedExtensions = freezed,
    Object? maxMessageSize = freezed,
  }) {
    return _then(_value.copyWith(
      supportsIdle: null == supportsIdle
          ? _value.supportsIdle
          : supportsIdle // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsMove: null == supportsMove
          ? _value.supportsMove
          : supportsMove // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsSort: null == supportsSort
          ? _value.supportsSort
          : supportsSort // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsSearch: null == supportsSearch
          ? _value.supportsSearch
          : supportsSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsQuota: null == supportsQuota
          ? _value.supportsQuota
          : supportsQuota // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsUidPlus: null == supportsUidPlus
          ? _value.supportsUidPlus
          : supportsUidPlus // ignore: cast_nullable_to_non_nullable
              as bool,
      supportedExtensions: freezed == supportedExtensions
          ? _value.supportedExtensions
          : supportedExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      maxMessageSize: freezed == maxMessageSize
          ? _value.maxMessageSize
          : maxMessageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountCapabilitiesImplCopyWith<$Res>
    implements $AccountCapabilitiesCopyWith<$Res> {
  factory _$$AccountCapabilitiesImplCopyWith(_$AccountCapabilitiesImpl value,
          $Res Function(_$AccountCapabilitiesImpl) then) =
      __$$AccountCapabilitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool supportsIdle,
      bool supportsMove,
      bool supportsSort,
      bool supportsSearch,
      bool supportsQuota,
      bool supportsUidPlus,
      List<String>? supportedExtensions,
      int? maxMessageSize});
}

/// @nodoc
class __$$AccountCapabilitiesImplCopyWithImpl<$Res>
    extends _$AccountCapabilitiesCopyWithImpl<$Res, _$AccountCapabilitiesImpl>
    implements _$$AccountCapabilitiesImplCopyWith<$Res> {
  __$$AccountCapabilitiesImplCopyWithImpl(_$AccountCapabilitiesImpl _value,
      $Res Function(_$AccountCapabilitiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportsIdle = null,
    Object? supportsMove = null,
    Object? supportsSort = null,
    Object? supportsSearch = null,
    Object? supportsQuota = null,
    Object? supportsUidPlus = null,
    Object? supportedExtensions = freezed,
    Object? maxMessageSize = freezed,
  }) {
    return _then(_$AccountCapabilitiesImpl(
      supportsIdle: null == supportsIdle
          ? _value.supportsIdle
          : supportsIdle // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsMove: null == supportsMove
          ? _value.supportsMove
          : supportsMove // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsSort: null == supportsSort
          ? _value.supportsSort
          : supportsSort // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsSearch: null == supportsSearch
          ? _value.supportsSearch
          : supportsSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsQuota: null == supportsQuota
          ? _value.supportsQuota
          : supportsQuota // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsUidPlus: null == supportsUidPlus
          ? _value.supportsUidPlus
          : supportsUidPlus // ignore: cast_nullable_to_non_nullable
              as bool,
      supportedExtensions: freezed == supportedExtensions
          ? _value._supportedExtensions
          : supportedExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      maxMessageSize: freezed == maxMessageSize
          ? _value.maxMessageSize
          : maxMessageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountCapabilitiesImpl implements _AccountCapabilities {
  const _$AccountCapabilitiesImpl(
      {this.supportsIdle = false,
      this.supportsMove = false,
      this.supportsSort = false,
      this.supportsSearch = false,
      this.supportsQuota = false,
      this.supportsUidPlus = false,
      final List<String>? supportedExtensions,
      this.maxMessageSize})
      : _supportedExtensions = supportedExtensions;

  factory _$AccountCapabilitiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountCapabilitiesImplFromJson(json);

  @override
  @JsonKey()
  final bool supportsIdle;
  @override
  @JsonKey()
  final bool supportsMove;
  @override
  @JsonKey()
  final bool supportsSort;
  @override
  @JsonKey()
  final bool supportsSearch;
  @override
  @JsonKey()
  final bool supportsQuota;
  @override
  @JsonKey()
  final bool supportsUidPlus;
  final List<String>? _supportedExtensions;
  @override
  List<String>? get supportedExtensions {
    final value = _supportedExtensions;
    if (value == null) return null;
    if (_supportedExtensions is EqualUnmodifiableListView)
      return _supportedExtensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? maxMessageSize;

  @override
  String toString() {
    return 'AccountCapabilities(supportsIdle: $supportsIdle, supportsMove: $supportsMove, supportsSort: $supportsSort, supportsSearch: $supportsSearch, supportsQuota: $supportsQuota, supportsUidPlus: $supportsUidPlus, supportedExtensions: $supportedExtensions, maxMessageSize: $maxMessageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountCapabilitiesImpl &&
            (identical(other.supportsIdle, supportsIdle) ||
                other.supportsIdle == supportsIdle) &&
            (identical(other.supportsMove, supportsMove) ||
                other.supportsMove == supportsMove) &&
            (identical(other.supportsSort, supportsSort) ||
                other.supportsSort == supportsSort) &&
            (identical(other.supportsSearch, supportsSearch) ||
                other.supportsSearch == supportsSearch) &&
            (identical(other.supportsQuota, supportsQuota) ||
                other.supportsQuota == supportsQuota) &&
            (identical(other.supportsUidPlus, supportsUidPlus) ||
                other.supportsUidPlus == supportsUidPlus) &&
            const DeepCollectionEquality()
                .equals(other._supportedExtensions, _supportedExtensions) &&
            (identical(other.maxMessageSize, maxMessageSize) ||
                other.maxMessageSize == maxMessageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      supportsIdle,
      supportsMove,
      supportsSort,
      supportsSearch,
      supportsQuota,
      supportsUidPlus,
      const DeepCollectionEquality().hash(_supportedExtensions),
      maxMessageSize);

  /// Create a copy of AccountCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountCapabilitiesImplCopyWith<_$AccountCapabilitiesImpl> get copyWith =>
      __$$AccountCapabilitiesImplCopyWithImpl<_$AccountCapabilitiesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountCapabilitiesImplToJson(
      this,
    );
  }
}

abstract class _AccountCapabilities implements AccountCapabilities {
  const factory _AccountCapabilities(
      {final bool supportsIdle,
      final bool supportsMove,
      final bool supportsSort,
      final bool supportsSearch,
      final bool supportsQuota,
      final bool supportsUidPlus,
      final List<String>? supportedExtensions,
      final int? maxMessageSize}) = _$AccountCapabilitiesImpl;

  factory _AccountCapabilities.fromJson(Map<String, dynamic> json) =
      _$AccountCapabilitiesImpl.fromJson;

  @override
  bool get supportsIdle;
  @override
  bool get supportsMove;
  @override
  bool get supportsSort;
  @override
  bool get supportsSearch;
  @override
  bool get supportsQuota;
  @override
  bool get supportsUidPlus;
  @override
  List<String>? get supportedExtensions;
  @override
  int? get maxMessageSize;

  /// Create a copy of AccountCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountCapabilitiesImplCopyWith<_$AccountCapabilitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
