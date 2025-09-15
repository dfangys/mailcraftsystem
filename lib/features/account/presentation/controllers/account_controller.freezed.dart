// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  bool get isSetupComplete => throw _privateConstructorUsedError;
  String? get selectedProvider => throw _privateConstructorUsedError;
  MailAccountConfig? get accountConfig => throw _privateConstructorUsedError;
  String? get connectionDetails => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isConnected,
      bool isSetupComplete,
      String? selectedProvider,
      MailAccountConfig? accountConfig,
      String? connectionDetails,
      String? error});

  $MailAccountConfigCopyWith<$Res>? get accountConfig;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isConnected = null,
    Object? isSetupComplete = null,
    Object? selectedProvider = freezed,
    Object? accountConfig = freezed,
    Object? connectionDetails = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSetupComplete: null == isSetupComplete
          ? _value.isSetupComplete
          : isSetupComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedProvider: freezed == selectedProvider
          ? _value.selectedProvider
          : selectedProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      accountConfig: freezed == accountConfig
          ? _value.accountConfig
          : accountConfig // ignore: cast_nullable_to_non_nullable
              as MailAccountConfig?,
      connectionDetails: freezed == connectionDetails
          ? _value.connectionDetails
          : connectionDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MailAccountConfigCopyWith<$Res>? get accountConfig {
    if (_value.accountConfig == null) {
      return null;
    }

    return $MailAccountConfigCopyWith<$Res>(_value.accountConfig!, (value) {
      return _then(_value.copyWith(accountConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountStateImplCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$AccountStateImplCopyWith(
          _$AccountStateImpl value, $Res Function(_$AccountStateImpl) then) =
      __$$AccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isConnected,
      bool isSetupComplete,
      String? selectedProvider,
      MailAccountConfig? accountConfig,
      String? connectionDetails,
      String? error});

  @override
  $MailAccountConfigCopyWith<$Res>? get accountConfig;
}

/// @nodoc
class __$$AccountStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountStateImpl>
    implements _$$AccountStateImplCopyWith<$Res> {
  __$$AccountStateImplCopyWithImpl(
      _$AccountStateImpl _value, $Res Function(_$AccountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isConnected = null,
    Object? isSetupComplete = null,
    Object? selectedProvider = freezed,
    Object? accountConfig = freezed,
    Object? connectionDetails = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AccountStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSetupComplete: null == isSetupComplete
          ? _value.isSetupComplete
          : isSetupComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedProvider: freezed == selectedProvider
          ? _value.selectedProvider
          : selectedProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      accountConfig: freezed == accountConfig
          ? _value.accountConfig
          : accountConfig // ignore: cast_nullable_to_non_nullable
              as MailAccountConfig?,
      connectionDetails: freezed == connectionDetails
          ? _value.connectionDetails
          : connectionDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AccountStateImpl implements _AccountState {
  const _$AccountStateImpl(
      {this.isLoading = false,
      this.isConnected = false,
      this.isSetupComplete = false,
      this.selectedProvider,
      this.accountConfig,
      this.connectionDetails,
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final bool isSetupComplete;
  @override
  final String? selectedProvider;
  @override
  final MailAccountConfig? accountConfig;
  @override
  final String? connectionDetails;
  @override
  final String? error;

  @override
  String toString() {
    return 'AccountState(isLoading: $isLoading, isConnected: $isConnected, isSetupComplete: $isSetupComplete, selectedProvider: $selectedProvider, accountConfig: $accountConfig, connectionDetails: $connectionDetails, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isSetupComplete, isSetupComplete) ||
                other.isSetupComplete == isSetupComplete) &&
            (identical(other.selectedProvider, selectedProvider) ||
                other.selectedProvider == selectedProvider) &&
            (identical(other.accountConfig, accountConfig) ||
                other.accountConfig == accountConfig) &&
            (identical(other.connectionDetails, connectionDetails) ||
                other.connectionDetails == connectionDetails) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isConnected,
      isSetupComplete,
      selectedProvider,
      accountConfig,
      connectionDetails,
      error);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      __$$AccountStateImplCopyWithImpl<_$AccountStateImpl>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {final bool isLoading,
      final bool isConnected,
      final bool isSetupComplete,
      final String? selectedProvider,
      final MailAccountConfig? accountConfig,
      final String? connectionDetails,
      final String? error}) = _$AccountStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isConnected;
  @override
  bool get isSetupComplete;
  @override
  String? get selectedProvider;
  @override
  MailAccountConfig? get accountConfig;
  @override
  String? get connectionDetails;
  @override
  String? get error;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
