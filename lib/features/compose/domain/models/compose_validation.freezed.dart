// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compose_validation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageValidationResult _$MessageValidationResultFromJson(
    Map<String, dynamic> json) {
  return _MessageValidationResult.fromJson(json);
}

/// @nodoc
mixin _$MessageValidationResult {
  bool get isValid => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;
  List<String>? get warnings => throw _privateConstructorUsedError;
  MessageSizeInfo? get sizeInfo => throw _privateConstructorUsedError;

  /// Serializes this MessageValidationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageValidationResultCopyWith<MessageValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageValidationResultCopyWith<$Res> {
  factory $MessageValidationResultCopyWith(MessageValidationResult value,
          $Res Function(MessageValidationResult) then) =
      _$MessageValidationResultCopyWithImpl<$Res, MessageValidationResult>;
  @useResult
  $Res call(
      {bool isValid,
      List<String>? errors,
      List<String>? warnings,
      MessageSizeInfo? sizeInfo});

  $MessageSizeInfoCopyWith<$Res>? get sizeInfo;
}

/// @nodoc
class _$MessageValidationResultCopyWithImpl<$Res,
        $Val extends MessageValidationResult>
    implements $MessageValidationResultCopyWith<$Res> {
  _$MessageValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? errors = freezed,
    Object? warnings = freezed,
    Object? sizeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      warnings: freezed == warnings
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sizeInfo: freezed == sizeInfo
          ? _value.sizeInfo
          : sizeInfo // ignore: cast_nullable_to_non_nullable
              as MessageSizeInfo?,
    ) as $Val);
  }

  /// Create a copy of MessageValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageSizeInfoCopyWith<$Res>? get sizeInfo {
    if (_value.sizeInfo == null) {
      return null;
    }

    return $MessageSizeInfoCopyWith<$Res>(_value.sizeInfo!, (value) {
      return _then(_value.copyWith(sizeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageValidationResultImplCopyWith<$Res>
    implements $MessageValidationResultCopyWith<$Res> {
  factory _$$MessageValidationResultImplCopyWith(
          _$MessageValidationResultImpl value,
          $Res Function(_$MessageValidationResultImpl) then) =
      __$$MessageValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid,
      List<String>? errors,
      List<String>? warnings,
      MessageSizeInfo? sizeInfo});

  @override
  $MessageSizeInfoCopyWith<$Res>? get sizeInfo;
}

/// @nodoc
class __$$MessageValidationResultImplCopyWithImpl<$Res>
    extends _$MessageValidationResultCopyWithImpl<$Res,
        _$MessageValidationResultImpl>
    implements _$$MessageValidationResultImplCopyWith<$Res> {
  __$$MessageValidationResultImplCopyWithImpl(
      _$MessageValidationResultImpl _value,
      $Res Function(_$MessageValidationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? errors = freezed,
    Object? warnings = freezed,
    Object? sizeInfo = freezed,
  }) {
    return _then(_$MessageValidationResultImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      warnings: freezed == warnings
          ? _value._warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sizeInfo: freezed == sizeInfo
          ? _value.sizeInfo
          : sizeInfo // ignore: cast_nullable_to_non_nullable
              as MessageSizeInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageValidationResultImpl implements _MessageValidationResult {
  const _$MessageValidationResultImpl(
      {required this.isValid,
      final List<String>? errors,
      final List<String>? warnings,
      this.sizeInfo})
      : _errors = errors,
        _warnings = warnings;

  factory _$MessageValidationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageValidationResultImplFromJson(json);

  @override
  final bool isValid;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
  final MessageSizeInfo? sizeInfo;

  @override
  String toString() {
    return 'MessageValidationResult(isValid: $isValid, errors: $errors, warnings: $warnings, sizeInfo: $sizeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageValidationResultImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            (identical(other.sizeInfo, sizeInfo) ||
                other.sizeInfo == sizeInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isValid,
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(_warnings),
      sizeInfo);

  /// Create a copy of MessageValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageValidationResultImplCopyWith<_$MessageValidationResultImpl>
      get copyWith => __$$MessageValidationResultImplCopyWithImpl<
          _$MessageValidationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageValidationResultImplToJson(
      this,
    );
  }
}

abstract class _MessageValidationResult implements MessageValidationResult {
  const factory _MessageValidationResult(
      {required final bool isValid,
      final List<String>? errors,
      final List<String>? warnings,
      final MessageSizeInfo? sizeInfo}) = _$MessageValidationResultImpl;

  factory _MessageValidationResult.fromJson(Map<String, dynamic> json) =
      _$MessageValidationResultImpl.fromJson;

  @override
  bool get isValid;
  @override
  List<String>? get errors;
  @override
  List<String>? get warnings;
  @override
  MessageSizeInfo? get sizeInfo;

  /// Create a copy of MessageValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageValidationResultImplCopyWith<_$MessageValidationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MessageSizeInfo _$MessageSizeInfoFromJson(Map<String, dynamic> json) {
  return _MessageSizeInfo.fromJson(json);
}

/// @nodoc
mixin _$MessageSizeInfo {
  int get totalSize => throw _privateConstructorUsedError;
  int get contentSize => throw _privateConstructorUsedError;
  int get attachmentSize => throw _privateConstructorUsedError;
  bool get exceedsLimit => throw _privateConstructorUsedError;
  int? get maxAllowedSize => throw _privateConstructorUsedError;

  /// Serializes this MessageSizeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageSizeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageSizeInfoCopyWith<MessageSizeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageSizeInfoCopyWith<$Res> {
  factory $MessageSizeInfoCopyWith(
          MessageSizeInfo value, $Res Function(MessageSizeInfo) then) =
      _$MessageSizeInfoCopyWithImpl<$Res, MessageSizeInfo>;
  @useResult
  $Res call(
      {int totalSize,
      int contentSize,
      int attachmentSize,
      bool exceedsLimit,
      int? maxAllowedSize});
}

/// @nodoc
class _$MessageSizeInfoCopyWithImpl<$Res, $Val extends MessageSizeInfo>
    implements $MessageSizeInfoCopyWith<$Res> {
  _$MessageSizeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageSizeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSize = null,
    Object? contentSize = null,
    Object? attachmentSize = null,
    Object? exceedsLimit = null,
    Object? maxAllowedSize = freezed,
  }) {
    return _then(_value.copyWith(
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      contentSize: null == contentSize
          ? _value.contentSize
          : contentSize // ignore: cast_nullable_to_non_nullable
              as int,
      attachmentSize: null == attachmentSize
          ? _value.attachmentSize
          : attachmentSize // ignore: cast_nullable_to_non_nullable
              as int,
      exceedsLimit: null == exceedsLimit
          ? _value.exceedsLimit
          : exceedsLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      maxAllowedSize: freezed == maxAllowedSize
          ? _value.maxAllowedSize
          : maxAllowedSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageSizeInfoImplCopyWith<$Res>
    implements $MessageSizeInfoCopyWith<$Res> {
  factory _$$MessageSizeInfoImplCopyWith(_$MessageSizeInfoImpl value,
          $Res Function(_$MessageSizeInfoImpl) then) =
      __$$MessageSizeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalSize,
      int contentSize,
      int attachmentSize,
      bool exceedsLimit,
      int? maxAllowedSize});
}

/// @nodoc
class __$$MessageSizeInfoImplCopyWithImpl<$Res>
    extends _$MessageSizeInfoCopyWithImpl<$Res, _$MessageSizeInfoImpl>
    implements _$$MessageSizeInfoImplCopyWith<$Res> {
  __$$MessageSizeInfoImplCopyWithImpl(
      _$MessageSizeInfoImpl _value, $Res Function(_$MessageSizeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageSizeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSize = null,
    Object? contentSize = null,
    Object? attachmentSize = null,
    Object? exceedsLimit = null,
    Object? maxAllowedSize = freezed,
  }) {
    return _then(_$MessageSizeInfoImpl(
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      contentSize: null == contentSize
          ? _value.contentSize
          : contentSize // ignore: cast_nullable_to_non_nullable
              as int,
      attachmentSize: null == attachmentSize
          ? _value.attachmentSize
          : attachmentSize // ignore: cast_nullable_to_non_nullable
              as int,
      exceedsLimit: null == exceedsLimit
          ? _value.exceedsLimit
          : exceedsLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      maxAllowedSize: freezed == maxAllowedSize
          ? _value.maxAllowedSize
          : maxAllowedSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageSizeInfoImpl implements _MessageSizeInfo {
  const _$MessageSizeInfoImpl(
      {required this.totalSize,
      required this.contentSize,
      required this.attachmentSize,
      this.exceedsLimit = false,
      this.maxAllowedSize});

  factory _$MessageSizeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageSizeInfoImplFromJson(json);

  @override
  final int totalSize;
  @override
  final int contentSize;
  @override
  final int attachmentSize;
  @override
  @JsonKey()
  final bool exceedsLimit;
  @override
  final int? maxAllowedSize;

  @override
  String toString() {
    return 'MessageSizeInfo(totalSize: $totalSize, contentSize: $contentSize, attachmentSize: $attachmentSize, exceedsLimit: $exceedsLimit, maxAllowedSize: $maxAllowedSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSizeInfoImpl &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.contentSize, contentSize) ||
                other.contentSize == contentSize) &&
            (identical(other.attachmentSize, attachmentSize) ||
                other.attachmentSize == attachmentSize) &&
            (identical(other.exceedsLimit, exceedsLimit) ||
                other.exceedsLimit == exceedsLimit) &&
            (identical(other.maxAllowedSize, maxAllowedSize) ||
                other.maxAllowedSize == maxAllowedSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSize, contentSize,
      attachmentSize, exceedsLimit, maxAllowedSize);

  /// Create a copy of MessageSizeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSizeInfoImplCopyWith<_$MessageSizeInfoImpl> get copyWith =>
      __$$MessageSizeInfoImplCopyWithImpl<_$MessageSizeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageSizeInfoImplToJson(
      this,
    );
  }
}

abstract class _MessageSizeInfo implements MessageSizeInfo {
  const factory _MessageSizeInfo(
      {required final int totalSize,
      required final int contentSize,
      required final int attachmentSize,
      final bool exceedsLimit,
      final int? maxAllowedSize}) = _$MessageSizeInfoImpl;

  factory _MessageSizeInfo.fromJson(Map<String, dynamic> json) =
      _$MessageSizeInfoImpl.fromJson;

  @override
  int get totalSize;
  @override
  int get contentSize;
  @override
  int get attachmentSize;
  @override
  bool get exceedsLimit;
  @override
  int? get maxAllowedSize;

  /// Create a copy of MessageSizeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageSizeInfoImplCopyWith<_$MessageSizeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressValidationResult _$AddressValidationResultFromJson(
    Map<String, dynamic> json) {
  return _AddressValidationResult.fromJson(json);
}

/// @nodoc
mixin _$AddressValidationResult {
  String get address => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get suggestion => throw _privateConstructorUsedError;

  /// Serializes this AddressValidationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressValidationResultCopyWith<AddressValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressValidationResultCopyWith<$Res> {
  factory $AddressValidationResultCopyWith(AddressValidationResult value,
          $Res Function(AddressValidationResult) then) =
      _$AddressValidationResultCopyWithImpl<$Res, AddressValidationResult>;
  @useResult
  $Res call({String address, bool isValid, String? error, String? suggestion});
}

/// @nodoc
class _$AddressValidationResultCopyWithImpl<$Res,
        $Val extends AddressValidationResult>
    implements $AddressValidationResultCopyWith<$Res> {
  _$AddressValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? isValid = null,
    Object? error = freezed,
    Object? suggestion = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressValidationResultImplCopyWith<$Res>
    implements $AddressValidationResultCopyWith<$Res> {
  factory _$$AddressValidationResultImplCopyWith(
          _$AddressValidationResultImpl value,
          $Res Function(_$AddressValidationResultImpl) then) =
      __$$AddressValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, bool isValid, String? error, String? suggestion});
}

/// @nodoc
class __$$AddressValidationResultImplCopyWithImpl<$Res>
    extends _$AddressValidationResultCopyWithImpl<$Res,
        _$AddressValidationResultImpl>
    implements _$$AddressValidationResultImplCopyWith<$Res> {
  __$$AddressValidationResultImplCopyWithImpl(
      _$AddressValidationResultImpl _value,
      $Res Function(_$AddressValidationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? isValid = null,
    Object? error = freezed,
    Object? suggestion = freezed,
  }) {
    return _then(_$AddressValidationResultImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressValidationResultImpl implements _AddressValidationResult {
  const _$AddressValidationResultImpl(
      {required this.address,
      required this.isValid,
      this.error,
      this.suggestion});

  factory _$AddressValidationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressValidationResultImplFromJson(json);

  @override
  final String address;
  @override
  final bool isValid;
  @override
  final String? error;
  @override
  final String? suggestion;

  @override
  String toString() {
    return 'AddressValidationResult(address: $address, isValid: $isValid, error: $error, suggestion: $suggestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressValidationResultImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, isValid, error, suggestion);

  /// Create a copy of AddressValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressValidationResultImplCopyWith<_$AddressValidationResultImpl>
      get copyWith => __$$AddressValidationResultImplCopyWithImpl<
          _$AddressValidationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressValidationResultImplToJson(
      this,
    );
  }
}

abstract class _AddressValidationResult implements AddressValidationResult {
  const factory _AddressValidationResult(
      {required final String address,
      required final bool isValid,
      final String? error,
      final String? suggestion}) = _$AddressValidationResultImpl;

  factory _AddressValidationResult.fromJson(Map<String, dynamic> json) =
      _$AddressValidationResultImpl.fromJson;

  @override
  String get address;
  @override
  bool get isValid;
  @override
  String? get error;
  @override
  String? get suggestion;

  /// Create a copy of AddressValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressValidationResultImplCopyWith<_$AddressValidationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AddressSuggestion _$AddressSuggestionFromJson(Map<String, dynamic> json) {
  return _AddressSuggestion.fromJson(json);
}

/// @nodoc
mixin _$AddressSuggestion {
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  int? get frequency => throw _privateConstructorUsedError;
  DateTime? get lastUsed => throw _privateConstructorUsedError;

  /// Serializes this AddressSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressSuggestionCopyWith<AddressSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressSuggestionCopyWith<$Res> {
  factory $AddressSuggestionCopyWith(
          AddressSuggestion value, $Res Function(AddressSuggestion) then) =
      _$AddressSuggestionCopyWithImpl<$Res, AddressSuggestion>;
  @useResult
  $Res call(
      {String email,
      String? name,
      String? source,
      int? frequency,
      DateTime? lastUsed});
}

/// @nodoc
class _$AddressSuggestionCopyWithImpl<$Res, $Val extends AddressSuggestion>
    implements $AddressSuggestionCopyWith<$Res> {
  _$AddressSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
    Object? source = freezed,
    Object? frequency = freezed,
    Object? lastUsed = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressSuggestionImplCopyWith<$Res>
    implements $AddressSuggestionCopyWith<$Res> {
  factory _$$AddressSuggestionImplCopyWith(_$AddressSuggestionImpl value,
          $Res Function(_$AddressSuggestionImpl) then) =
      __$$AddressSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String? name,
      String? source,
      int? frequency,
      DateTime? lastUsed});
}

/// @nodoc
class __$$AddressSuggestionImplCopyWithImpl<$Res>
    extends _$AddressSuggestionCopyWithImpl<$Res, _$AddressSuggestionImpl>
    implements _$$AddressSuggestionImplCopyWith<$Res> {
  __$$AddressSuggestionImplCopyWithImpl(_$AddressSuggestionImpl _value,
      $Res Function(_$AddressSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
    Object? source = freezed,
    Object? frequency = freezed,
    Object? lastUsed = freezed,
  }) {
    return _then(_$AddressSuggestionImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressSuggestionImpl implements _AddressSuggestion {
  const _$AddressSuggestionImpl(
      {required this.email,
      this.name,
      this.source,
      this.frequency,
      this.lastUsed});

  factory _$AddressSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressSuggestionImplFromJson(json);

  @override
  final String email;
  @override
  final String? name;
  @override
  final String? source;
  @override
  final int? frequency;
  @override
  final DateTime? lastUsed;

  @override
  String toString() {
    return 'AddressSuggestion(email: $email, name: $name, source: $source, frequency: $frequency, lastUsed: $lastUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressSuggestionImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, source, frequency, lastUsed);

  /// Create a copy of AddressSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressSuggestionImplCopyWith<_$AddressSuggestionImpl> get copyWith =>
      __$$AddressSuggestionImplCopyWithImpl<_$AddressSuggestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressSuggestionImplToJson(
      this,
    );
  }
}

abstract class _AddressSuggestion implements AddressSuggestion {
  const factory _AddressSuggestion(
      {required final String email,
      final String? name,
      final String? source,
      final int? frequency,
      final DateTime? lastUsed}) = _$AddressSuggestionImpl;

  factory _AddressSuggestion.fromJson(Map<String, dynamic> json) =
      _$AddressSuggestionImpl.fromJson;

  @override
  String get email;
  @override
  String? get name;
  @override
  String? get source;
  @override
  int? get frequency;
  @override
  DateTime? get lastUsed;

  /// Create a copy of AddressSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressSuggestionImplCopyWith<_$AddressSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

/// @nodoc
mixin _$ContactInfo {
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get organization => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ContactInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
          ContactInfo value, $Res Function(ContactInfo) then) =
      _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call(
      {String email,
      String? name,
      String? organization,
      String? phone,
      String? notes});
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
    Object? organization = freezed,
    Object? phone = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
          _$ContactInfoImpl value, $Res Function(_$ContactInfoImpl) then) =
      __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String? name,
      String? organization,
      String? phone,
      String? notes});
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
      _$ContactInfoImpl _value, $Res Function(_$ContactInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
    Object? organization = freezed,
    Object? phone = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ContactInfoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl(
      {required this.email,
      this.name,
      this.organization,
      this.phone,
      this.notes});

  factory _$ContactInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoImplFromJson(json);

  @override
  final String email;
  @override
  final String? name;
  @override
  final String? organization;
  @override
  final String? phone;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ContactInfo(email: $email, name: $name, organization: $organization, phone: $phone, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, organization, phone, notes);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoImplToJson(
      this,
    );
  }
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo(
      {required final String email,
      final String? name,
      final String? organization,
      final String? phone,
      final String? notes}) = _$ContactInfoImpl;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$ContactInfoImpl.fromJson;

  @override
  String get email;
  @override
  String? get name;
  @override
  String? get organization;
  @override
  String? get phone;
  @override
  String? get notes;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendResult _$SendResultFromJson(Map<String, dynamic> json) {
  return _SendResult.fromJson(json);
}

/// @nodoc
mixin _$SendResult {
  bool get success => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  DateTime? get sentAt => throw _privateConstructorUsedError;

  /// Serializes this SendResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendResultCopyWith<SendResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendResultCopyWith<$Res> {
  factory $SendResultCopyWith(
          SendResult value, $Res Function(SendResult) then) =
      _$SendResultCopyWithImpl<$Res, SendResult>;
  @useResult
  $Res call({bool success, String? messageId, String? error, DateTime? sentAt});
}

/// @nodoc
class _$SendResultCopyWithImpl<$Res, $Val extends SendResult>
    implements $SendResultCopyWith<$Res> {
  _$SendResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? messageId = freezed,
    Object? error = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendResultImplCopyWith<$Res>
    implements $SendResultCopyWith<$Res> {
  factory _$$SendResultImplCopyWith(
          _$SendResultImpl value, $Res Function(_$SendResultImpl) then) =
      __$$SendResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? messageId, String? error, DateTime? sentAt});
}

/// @nodoc
class __$$SendResultImplCopyWithImpl<$Res>
    extends _$SendResultCopyWithImpl<$Res, _$SendResultImpl>
    implements _$$SendResultImplCopyWith<$Res> {
  __$$SendResultImplCopyWithImpl(
      _$SendResultImpl _value, $Res Function(_$SendResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? messageId = freezed,
    Object? error = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(_$SendResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendResultImpl implements _SendResult {
  const _$SendResultImpl(
      {required this.success, this.messageId, this.error, this.sentAt});

  factory _$SendResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendResultImplFromJson(json);

  @override
  final bool success;
  @override
  final String? messageId;
  @override
  final String? error;
  @override
  final DateTime? sentAt;

  @override
  String toString() {
    return 'SendResult(success: $success, messageId: $messageId, error: $error, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, messageId, error, sentAt);

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendResultImplCopyWith<_$SendResultImpl> get copyWith =>
      __$$SendResultImplCopyWithImpl<_$SendResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendResultImplToJson(
      this,
    );
  }
}

abstract class _SendResult implements SendResult {
  const factory _SendResult(
      {required final bool success,
      final String? messageId,
      final String? error,
      final DateTime? sentAt}) = _$SendResultImpl;

  factory _SendResult.fromJson(Map<String, dynamic> json) =
      _$SendResultImpl.fromJson;

  @override
  bool get success;
  @override
  String? get messageId;
  @override
  String? get error;
  @override
  DateTime? get sentAt;

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendResultImplCopyWith<_$SendResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
