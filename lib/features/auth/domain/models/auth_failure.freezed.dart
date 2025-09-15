// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidCredentialsImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$InvalidCredentialsImplCopyWith(_$InvalidCredentialsImpl value,
          $Res Function(_$InvalidCredentialsImpl) then) =
      __$$InvalidCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidCredentialsImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidCredentialsImpl>
    implements _$$InvalidCredentialsImplCopyWith<$Res> {
  __$$InvalidCredentialsImplCopyWithImpl(_$InvalidCredentialsImpl _value,
      $Res Function(_$InvalidCredentialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidCredentialsImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidCredentialsImpl implements _InvalidCredentials {
  const _$InvalidCredentialsImpl({this.message = 'Invalid email or password'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.invalidCredentials(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidCredentialsImplCopyWith<_$InvalidCredentialsImpl> get copyWith =>
      __$$InvalidCredentialsImplCopyWithImpl<_$InvalidCredentialsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return invalidCredentials(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return invalidCredentials?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class _InvalidCredentials implements AuthFailure {
  const factory _InvalidCredentials({final String message}) =
      _$InvalidCredentialsImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidCredentialsImplCopyWith<_$InvalidCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkImpl implements _Network {
  const _$NetworkImpl({this.message = 'Network error occurred'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      __$$NetworkImplCopyWithImpl<_$NetworkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements AuthFailure {
  const factory _Network({final String message}) = _$NetworkImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$ServerImplCopyWith(
          _$ServerImpl value, $Res Function(_$ServerImpl) then) =
      __$$ServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$ServerImpl>
    implements _$$ServerImplCopyWith<$Res> {
  __$$ServerImplCopyWithImpl(
      _$ServerImpl _value, $Res Function(_$ServerImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerImpl implements _Server {
  const _$ServerImpl({this.message = 'Server error occurred'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      __$$ServerImplCopyWithImpl<_$ServerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server implements AuthFailure {
  const factory _Server({final String message}) = _$ServerImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidOtpImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$InvalidOtpImplCopyWith(
          _$InvalidOtpImpl value, $Res Function(_$InvalidOtpImpl) then) =
      __$$InvalidOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidOtpImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidOtpImpl>
    implements _$$InvalidOtpImplCopyWith<$Res> {
  __$$InvalidOtpImplCopyWithImpl(
      _$InvalidOtpImpl _value, $Res Function(_$InvalidOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidOtpImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidOtpImpl implements _InvalidOtp {
  const _$InvalidOtpImpl({this.message = 'Invalid OTP code'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.invalidOtp(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidOtpImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidOtpImplCopyWith<_$InvalidOtpImpl> get copyWith =>
      __$$InvalidOtpImplCopyWithImpl<_$InvalidOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return invalidOtp(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return invalidOtp?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return invalidOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return invalidOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(this);
    }
    return orElse();
  }
}

abstract class _InvalidOtp implements AuthFailure {
  const factory _InvalidOtp({final String message}) = _$InvalidOtpImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidOtpImplCopyWith<_$InvalidOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpExpiredImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$OtpExpiredImplCopyWith(
          _$OtpExpiredImpl value, $Res Function(_$OtpExpiredImpl) then) =
      __$$OtpExpiredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OtpExpiredImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$OtpExpiredImpl>
    implements _$$OtpExpiredImplCopyWith<$Res> {
  __$$OtpExpiredImplCopyWithImpl(
      _$OtpExpiredImpl _value, $Res Function(_$OtpExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OtpExpiredImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpExpiredImpl implements _OtpExpired {
  const _$OtpExpiredImpl({this.message = 'OTP code has expired'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.otpExpired(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpExpiredImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpExpiredImplCopyWith<_$OtpExpiredImpl> get copyWith =>
      __$$OtpExpiredImplCopyWithImpl<_$OtpExpiredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return otpExpired(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return otpExpired?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (otpExpired != null) {
      return otpExpired(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return otpExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return otpExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (otpExpired != null) {
      return otpExpired(this);
    }
    return orElse();
  }
}

abstract class _OtpExpired implements AuthFailure {
  const factory _OtpExpired({final String message}) = _$OtpExpiredImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpExpiredImplCopyWith<_$OtpExpiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountLockedImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$AccountLockedImplCopyWith(
          _$AccountLockedImpl value, $Res Function(_$AccountLockedImpl) then) =
      __$$AccountLockedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccountLockedImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$AccountLockedImpl>
    implements _$$AccountLockedImplCopyWith<$Res> {
  __$$AccountLockedImplCopyWithImpl(
      _$AccountLockedImpl _value, $Res Function(_$AccountLockedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AccountLockedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountLockedImpl implements _AccountLocked {
  const _$AccountLockedImpl({this.message = 'Account is locked'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.accountLocked(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountLockedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountLockedImplCopyWith<_$AccountLockedImpl> get copyWith =>
      __$$AccountLockedImplCopyWithImpl<_$AccountLockedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return accountLocked(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return accountLocked?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return accountLocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return accountLocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked(this);
    }
    return orElse();
  }
}

abstract class _AccountLocked implements AuthFailure {
  const factory _AccountLocked({final String message}) = _$AccountLockedImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountLockedImplCopyWith<_$AccountLockedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl({this.message = 'An unknown error occurred'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) network,
    required TResult Function(String message) server,
    required TResult Function(String message) invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) accountLocked,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? network,
    TResult? Function(String message)? server,
    TResult? Function(String message)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? accountLocked,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? network,
    TResult Function(String message)? server,
    TResult Function(String message)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? accountLocked,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCredentials value) invalidCredentials,
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_OtpExpired value) otpExpired,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCredentials value)? invalidCredentials,
    TResult? Function(_Network value)? network,
    TResult? Function(_Server value)? server,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_OtpExpired value)? otpExpired,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCredentials value)? invalidCredentials,
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_OtpExpired value)? otpExpired,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements AuthFailure {
  const factory _Unknown({final String message}) = _$UnknownImpl;

  @override
  String get message;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
