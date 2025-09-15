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
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<String>? get capabilities => throw _privateConstructorUsedError;

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
      {bool isSuccess,
      String? details,
      String? errorMessage,
      List<String>? capabilities});
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
    Object? isSuccess = null,
    Object? details = freezed,
    Object? errorMessage = freezed,
    Object? capabilities = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
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
      {bool isSuccess,
      String? details,
      String? errorMessage,
      List<String>? capabilities});
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
    Object? isSuccess = null,
    Object? details = freezed,
    Object? errorMessage = freezed,
    Object? capabilities = freezed,
  }) {
    return _then(_$AccountConnectionResultImpl(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountConnectionResultImpl implements _AccountConnectionResult {
  const _$AccountConnectionResultImpl(
      {required this.isSuccess,
      this.details,
      this.errorMessage,
      final List<String>? capabilities})
      : _capabilities = capabilities;

  factory _$AccountConnectionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountConnectionResultImplFromJson(json);

  @override
  final bool isSuccess;
  @override
  final String? details;
  @override
  final String? errorMessage;
  final List<String>? _capabilities;
  @override
  List<String>? get capabilities {
    final value = _capabilities;
    if (value == null) return null;
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AccountConnectionResult(isSuccess: $isSuccess, details: $details, errorMessage: $errorMessage, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountConnectionResultImpl &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, details, errorMessage,
      const DeepCollectionEquality().hash(_capabilities));

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
      {required final bool isSuccess,
      final String? details,
      final String? errorMessage,
      final List<String>? capabilities}) = _$AccountConnectionResultImpl;

  factory _AccountConnectionResult.fromJson(Map<String, dynamic> json) =
      _$AccountConnectionResultImpl.fromJson;

  @override
  bool get isSuccess;
  @override
  String? get details;
  @override
  String? get errorMessage;
  @override
  List<String>? get capabilities;

  /// Create a copy of AccountConnectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountConnectionResultImplCopyWith<_$AccountConnectionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
