// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get requiresOtp => throw _privateConstructorUsedError;
  bool get resetEmailSent => throw _privateConstructorUsedError;
  AuthToken? get token => throw _privateConstructorUsedError;
  UserProfile? get user => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isAuthenticated,
      bool requiresOtp,
      bool resetEmailSent,
      AuthToken? token,
      UserProfile? user,
      String? error});

  $AuthTokenCopyWith<$Res>? get token;
  $UserProfileCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAuthenticated = null,
    Object? requiresOtp = null,
    Object? resetEmailSent = null,
    Object? token = freezed,
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresOtp: null == requiresOtp
          ? _value.requiresOtp
          : requiresOtp // ignore: cast_nullable_to_non_nullable
              as bool,
      resetEmailSent: null == resetEmailSent
          ? _value.resetEmailSent
          : resetEmailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as AuthToken?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      failure: core.Failure( freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthTokenCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $AuthTokenCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isAuthenticated,
      bool requiresOtp,
      bool resetEmailSent,
      AuthToken? token,
      UserProfile? user,
      String? error});

  @override
  $AuthTokenCopyWith<$Res>? get token;
  @override
  $UserProfileCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAuthenticated = null,
    Object? requiresOtp = null,
    Object? resetEmailSent = null,
    Object? token = freezed,
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AuthStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresOtp: null == requiresOtp
          ? _value.requiresOtp
          : requiresOtp // ignore: cast_nullable_to_non_nullable
              as bool,
      resetEmailSent: null == resetEmailSent
          ? _value.resetEmailSent
          : resetEmailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as AuthToken?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      failure: core.Failure( freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.isLoading = false,
      this.isAuthenticated = false,
      this.requiresOtp = false,
      this.resetEmailSent = false,
      this.token,
      this.user,
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey()
  final bool requiresOtp;
  @override
  @JsonKey()
  final bool resetEmailSent;
  @override
  final AuthToken? token;
  @override
  final UserProfile? user;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, isAuthenticated: $isAuthenticated, requiresOtp: $requiresOtp, resetEmailSent: $resetEmailSent, token: $token, user: $user, failure: core.Failure( $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.requiresOtp, requiresOtp) ||
                other.requiresOtp == requiresOtp) &&
            (identical(other.resetEmailSent, resetEmailSent) ||
                other.resetEmailSent == resetEmailSent) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isAuthenticated,
      requiresOtp, resetEmailSent, token, user, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final bool isLoading,
      final bool isAuthenticated,
      final bool requiresOtp,
      final bool resetEmailSent,
      final AuthToken? token,
      final UserProfile? user,
      final String? error}) = _$AuthStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isAuthenticated;
  @override
  bool get requiresOtp;
  @override
  bool get resetEmailSent;
  @override
  AuthToken? get token;
  @override
  UserProfile? get user;
  @override
  String? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
