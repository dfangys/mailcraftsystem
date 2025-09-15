// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpChallenge _$OtpChallengeFromJson(Map<String, dynamic> json) {
  return _OtpChallenge.fromJson(json);
}

/// @nodoc
mixin _$OtpChallenge {
  String get challengeId => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;
  String? get maskedDestination => throw _privateConstructorUsedError;

  /// Serializes this OtpChallenge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpChallenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpChallengeCopyWith<OtpChallenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpChallengeCopyWith<$Res> {
  factory $OtpChallengeCopyWith(
          OtpChallenge value, $Res Function(OtpChallenge) then) =
      _$OtpChallengeCopyWithImpl<$Res, OtpChallenge>;
  @useResult
  $Res call(
      {String challengeId,
      String method,
      int expiresIn,
      String? maskedDestination});
}

/// @nodoc
class _$OtpChallengeCopyWithImpl<$Res, $Val extends OtpChallenge>
    implements $OtpChallengeCopyWith<$Res> {
  _$OtpChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpChallenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
    Object? method = null,
    Object? expiresIn = null,
    Object? maskedDestination = freezed,
  }) {
    return _then(_value.copyWith(
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      maskedDestination: freezed == maskedDestination
          ? _value.maskedDestination
          : maskedDestination // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpChallengeImplCopyWith<$Res>
    implements $OtpChallengeCopyWith<$Res> {
  factory _$$OtpChallengeImplCopyWith(
          _$OtpChallengeImpl value, $Res Function(_$OtpChallengeImpl) then) =
      __$$OtpChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String challengeId,
      String method,
      int expiresIn,
      String? maskedDestination});
}

/// @nodoc
class __$$OtpChallengeImplCopyWithImpl<$Res>
    extends _$OtpChallengeCopyWithImpl<$Res, _$OtpChallengeImpl>
    implements _$$OtpChallengeImplCopyWith<$Res> {
  __$$OtpChallengeImplCopyWithImpl(
      _$OtpChallengeImpl _value, $Res Function(_$OtpChallengeImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpChallenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
    Object? method = null,
    Object? expiresIn = null,
    Object? maskedDestination = freezed,
  }) {
    return _then(_$OtpChallengeImpl(
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      maskedDestination: freezed == maskedDestination
          ? _value.maskedDestination
          : maskedDestination // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpChallengeImpl implements _OtpChallenge {
  const _$OtpChallengeImpl(
      {required this.challengeId,
      required this.method,
      required this.expiresIn,
      this.maskedDestination});

  factory _$OtpChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpChallengeImplFromJson(json);

  @override
  final String challengeId;
  @override
  final String method;
  @override
  final int expiresIn;
  @override
  final String? maskedDestination;

  @override
  String toString() {
    return 'OtpChallenge(challengeId: $challengeId, method: $method, expiresIn: $expiresIn, maskedDestination: $maskedDestination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpChallengeImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.maskedDestination, maskedDestination) ||
                other.maskedDestination == maskedDestination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, challengeId, method, expiresIn, maskedDestination);

  /// Create a copy of OtpChallenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpChallengeImplCopyWith<_$OtpChallengeImpl> get copyWith =>
      __$$OtpChallengeImplCopyWithImpl<_$OtpChallengeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpChallengeImplToJson(
      this,
    );
  }
}

abstract class _OtpChallenge implements OtpChallenge {
  const factory _OtpChallenge(
      {required final String challengeId,
      required final String method,
      required final int expiresIn,
      final String? maskedDestination}) = _$OtpChallengeImpl;

  factory _OtpChallenge.fromJson(Map<String, dynamic> json) =
      _$OtpChallengeImpl.fromJson;

  @override
  String get challengeId;
  @override
  String get method;
  @override
  int get expiresIn;
  @override
  String? get maskedDestination;

  /// Create a copy of OtpChallenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpChallengeImplCopyWith<_$OtpChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtpVerificationRequest _$OtpVerificationRequestFromJson(
    Map<String, dynamic> json) {
  return _OtpVerificationRequest.fromJson(json);
}

/// @nodoc
mixin _$OtpVerificationRequest {
  String get challengeId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this OtpVerificationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationRequestCopyWith<OtpVerificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationRequestCopyWith<$Res> {
  factory $OtpVerificationRequestCopyWith(OtpVerificationRequest value,
          $Res Function(OtpVerificationRequest) then) =
      _$OtpVerificationRequestCopyWithImpl<$Res, OtpVerificationRequest>;
  @useResult
  $Res call({String challengeId, String code});
}

/// @nodoc
class _$OtpVerificationRequestCopyWithImpl<$Res,
        $Val extends OtpVerificationRequest>
    implements $OtpVerificationRequestCopyWith<$Res> {
  _$OtpVerificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpVerificationRequestImplCopyWith<$Res>
    implements $OtpVerificationRequestCopyWith<$Res> {
  factory _$$OtpVerificationRequestImplCopyWith(
          _$OtpVerificationRequestImpl value,
          $Res Function(_$OtpVerificationRequestImpl) then) =
      __$$OtpVerificationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String challengeId, String code});
}

/// @nodoc
class __$$OtpVerificationRequestImplCopyWithImpl<$Res>
    extends _$OtpVerificationRequestCopyWithImpl<$Res,
        _$OtpVerificationRequestImpl>
    implements _$$OtpVerificationRequestImplCopyWith<$Res> {
  __$$OtpVerificationRequestImplCopyWithImpl(
      _$OtpVerificationRequestImpl _value,
      $Res Function(_$OtpVerificationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
    Object? code = null,
  }) {
    return _then(_$OtpVerificationRequestImpl(
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpVerificationRequestImpl implements _OtpVerificationRequest {
  const _$OtpVerificationRequestImpl(
      {required this.challengeId, required this.code});

  factory _$OtpVerificationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpVerificationRequestImplFromJson(json);

  @override
  final String challengeId;
  @override
  final String code;

  @override
  String toString() {
    return 'OtpVerificationRequest(challengeId: $challengeId, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationRequestImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, challengeId, code);

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationRequestImplCopyWith<_$OtpVerificationRequestImpl>
      get copyWith => __$$OtpVerificationRequestImplCopyWithImpl<
          _$OtpVerificationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpVerificationRequestImplToJson(
      this,
    );
  }
}

abstract class _OtpVerificationRequest implements OtpVerificationRequest {
  const factory _OtpVerificationRequest(
      {required final String challengeId,
      required final String code}) = _$OtpVerificationRequestImpl;

  factory _OtpVerificationRequest.fromJson(Map<String, dynamic> json) =
      _$OtpVerificationRequestImpl.fromJson;

  @override
  String get challengeId;
  @override
  String get code;

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationRequestImplCopyWith<_$OtpVerificationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
