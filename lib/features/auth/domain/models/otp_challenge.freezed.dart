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
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

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
  $Res call({String email, String code});
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
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String email, String code});
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
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$OtpChallengeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$OtpChallengeImpl implements _OtpChallenge {
  const _$OtpChallengeImpl({required this.email, required this.code});

  factory _$OtpChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpChallengeImplFromJson(json);

  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'OtpChallenge(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpChallengeImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

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
      {required final String email,
      required final String code}) = _$OtpChallengeImpl;

  factory _OtpChallenge.fromJson(Map<String, dynamic> json) =
      _$OtpChallengeImpl.fromJson;

  @override
  String get email;
  @override
  String get code;

  /// Create a copy of OtpChallenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpChallengeImplCopyWith<_$OtpChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
