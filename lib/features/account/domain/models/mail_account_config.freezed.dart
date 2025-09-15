// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_account_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MailAccountConfig _$MailAccountConfigFromJson(Map<String, dynamic> json) {
  return _MailAccountConfig.fromJson(json);
}

/// @nodoc
mixin _$MailAccountConfig {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  ImapConfig get imapConfig => throw _privateConstructorUsedError;
  SmtpConfig get smtpConfig => throw _privateConstructorUsedError;
  bool get allowInsecureSSL => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MailAccountConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailAccountConfigCopyWith<MailAccountConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailAccountConfigCopyWith<$Res> {
  factory $MailAccountConfigCopyWith(
          MailAccountConfig value, $Res Function(MailAccountConfig) then) =
      _$MailAccountConfigCopyWithImpl<$Res, MailAccountConfig>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String password,
      ImapConfig imapConfig,
      SmtpConfig smtpConfig,
      bool allowInsecureSSL,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});

  $ImapConfigCopyWith<$Res> get imapConfig;
  $SmtpConfigCopyWith<$Res> get smtpConfig;
}

/// @nodoc
class _$MailAccountConfigCopyWithImpl<$Res, $Val extends MailAccountConfig>
    implements $MailAccountConfigCopyWith<$Res> {
  _$MailAccountConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? imapConfig = null,
    Object? smtpConfig = null,
    Object? allowInsecureSSL = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      imapConfig: null == imapConfig
          ? _value.imapConfig
          : imapConfig // ignore: cast_nullable_to_non_nullable
              as ImapConfig,
      smtpConfig: null == smtpConfig
          ? _value.smtpConfig
          : smtpConfig // ignore: cast_nullable_to_non_nullable
              as SmtpConfig,
      allowInsecureSSL: null == allowInsecureSSL
          ? _value.allowInsecureSSL
          : allowInsecureSSL // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImapConfigCopyWith<$Res> get imapConfig {
    return $ImapConfigCopyWith<$Res>(_value.imapConfig, (value) {
      return _then(_value.copyWith(imapConfig: value) as $Val);
    });
  }

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmtpConfigCopyWith<$Res> get smtpConfig {
    return $SmtpConfigCopyWith<$Res>(_value.smtpConfig, (value) {
      return _then(_value.copyWith(smtpConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MailAccountConfigImplCopyWith<$Res>
    implements $MailAccountConfigCopyWith<$Res> {
  factory _$$MailAccountConfigImplCopyWith(_$MailAccountConfigImpl value,
          $Res Function(_$MailAccountConfigImpl) then) =
      __$$MailAccountConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String password,
      ImapConfig imapConfig,
      SmtpConfig smtpConfig,
      bool allowInsecureSSL,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $ImapConfigCopyWith<$Res> get imapConfig;
  @override
  $SmtpConfigCopyWith<$Res> get smtpConfig;
}

/// @nodoc
class __$$MailAccountConfigImplCopyWithImpl<$Res>
    extends _$MailAccountConfigCopyWithImpl<$Res, _$MailAccountConfigImpl>
    implements _$$MailAccountConfigImplCopyWith<$Res> {
  __$$MailAccountConfigImplCopyWithImpl(_$MailAccountConfigImpl _value,
      $Res Function(_$MailAccountConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? imapConfig = null,
    Object? smtpConfig = null,
    Object? allowInsecureSSL = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MailAccountConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      imapConfig: null == imapConfig
          ? _value.imapConfig
          : imapConfig // ignore: cast_nullable_to_non_nullable
              as ImapConfig,
      smtpConfig: null == smtpConfig
          ? _value.smtpConfig
          : smtpConfig // ignore: cast_nullable_to_non_nullable
              as SmtpConfig,
      allowInsecureSSL: null == allowInsecureSSL
          ? _value.allowInsecureSSL
          : allowInsecureSSL // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailAccountConfigImpl implements _MailAccountConfig {
  const _$MailAccountConfigImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.imapConfig,
      required this.smtpConfig,
      this.allowInsecureSSL = false,
      this.isActive = true,
      this.createdAt,
      this.updatedAt});

  factory _$MailAccountConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailAccountConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final ImapConfig imapConfig;
  @override
  final SmtpConfig smtpConfig;
  @override
  @JsonKey()
  final bool allowInsecureSSL;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MailAccountConfig(id: $id, name: $name, email: $email, password: $password, imapConfig: $imapConfig, smtpConfig: $smtpConfig, allowInsecureSSL: $allowInsecureSSL, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailAccountConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.imapConfig, imapConfig) ||
                other.imapConfig == imapConfig) &&
            (identical(other.smtpConfig, smtpConfig) ||
                other.smtpConfig == smtpConfig) &&
            (identical(other.allowInsecureSSL, allowInsecureSSL) ||
                other.allowInsecureSSL == allowInsecureSSL) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, password,
      imapConfig, smtpConfig, allowInsecureSSL, isActive, createdAt, updatedAt);

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailAccountConfigImplCopyWith<_$MailAccountConfigImpl> get copyWith =>
      __$$MailAccountConfigImplCopyWithImpl<_$MailAccountConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailAccountConfigImplToJson(
      this,
    );
  }
}

abstract class _MailAccountConfig implements MailAccountConfig {
  const factory _MailAccountConfig(
      {required final String id,
      required final String name,
      required final String email,
      required final String password,
      required final ImapConfig imapConfig,
      required final SmtpConfig smtpConfig,
      final bool allowInsecureSSL,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MailAccountConfigImpl;

  factory _MailAccountConfig.fromJson(Map<String, dynamic> json) =
      _$MailAccountConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  ImapConfig get imapConfig;
  @override
  SmtpConfig get smtpConfig;
  @override
  bool get allowInsecureSSL;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of MailAccountConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailAccountConfigImplCopyWith<_$MailAccountConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImapConfig _$ImapConfigFromJson(Map<String, dynamic> json) {
  return _ImapConfig.fromJson(json);
}

/// @nodoc
mixin _$ImapConfig {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  SocketType get socketType => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool get isSecure => throw _privateConstructorUsedError;

  /// Serializes this ImapConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImapConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImapConfigCopyWith<ImapConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImapConfigCopyWith<$Res> {
  factory $ImapConfigCopyWith(
          ImapConfig value, $Res Function(ImapConfig) then) =
      _$ImapConfigCopyWithImpl<$Res, ImapConfig>;
  @useResult
  $Res call(
      {String host,
      int port,
      SocketType socketType,
      String? username,
      bool isSecure});
}

/// @nodoc
class _$ImapConfigCopyWithImpl<$Res, $Val extends ImapConfig>
    implements $ImapConfigCopyWith<$Res> {
  _$ImapConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImapConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? socketType = null,
    Object? username = freezed,
    Object? isSecure = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      socketType: null == socketType
          ? _value.socketType
          : socketType // ignore: cast_nullable_to_non_nullable
              as SocketType,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isSecure: null == isSecure
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImapConfigImplCopyWith<$Res>
    implements $ImapConfigCopyWith<$Res> {
  factory _$$ImapConfigImplCopyWith(
          _$ImapConfigImpl value, $Res Function(_$ImapConfigImpl) then) =
      __$$ImapConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String host,
      int port,
      SocketType socketType,
      String? username,
      bool isSecure});
}

/// @nodoc
class __$$ImapConfigImplCopyWithImpl<$Res>
    extends _$ImapConfigCopyWithImpl<$Res, _$ImapConfigImpl>
    implements _$$ImapConfigImplCopyWith<$Res> {
  __$$ImapConfigImplCopyWithImpl(
      _$ImapConfigImpl _value, $Res Function(_$ImapConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImapConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? socketType = null,
    Object? username = freezed,
    Object? isSecure = null,
  }) {
    return _then(_$ImapConfigImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      socketType: null == socketType
          ? _value.socketType
          : socketType // ignore: cast_nullable_to_non_nullable
              as SocketType,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isSecure: null == isSecure
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImapConfigImpl implements _ImapConfig {
  const _$ImapConfigImpl(
      {required this.host,
      required this.port,
      required this.socketType,
      this.username,
      this.isSecure = true});

  factory _$ImapConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImapConfigImplFromJson(json);

  @override
  final String host;
  @override
  final int port;
  @override
  final SocketType socketType;
  @override
  final String? username;
  @override
  @JsonKey()
  final bool isSecure;

  @override
  String toString() {
    return 'ImapConfig(host: $host, port: $port, socketType: $socketType, username: $username, isSecure: $isSecure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImapConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.socketType, socketType) ||
                other.socketType == socketType) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isSecure, isSecure) ||
                other.isSecure == isSecure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, host, port, socketType, username, isSecure);

  /// Create a copy of ImapConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImapConfigImplCopyWith<_$ImapConfigImpl> get copyWith =>
      __$$ImapConfigImplCopyWithImpl<_$ImapConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImapConfigImplToJson(
      this,
    );
  }
}

abstract class _ImapConfig implements ImapConfig {
  const factory _ImapConfig(
      {required final String host,
      required final int port,
      required final SocketType socketType,
      final String? username,
      final bool isSecure}) = _$ImapConfigImpl;

  factory _ImapConfig.fromJson(Map<String, dynamic> json) =
      _$ImapConfigImpl.fromJson;

  @override
  String get host;
  @override
  int get port;
  @override
  SocketType get socketType;
  @override
  String? get username;
  @override
  bool get isSecure;

  /// Create a copy of ImapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImapConfigImplCopyWith<_$ImapConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmtpConfig _$SmtpConfigFromJson(Map<String, dynamic> json) {
  return _SmtpConfig.fromJson(json);
}

/// @nodoc
mixin _$SmtpConfig {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  SocketType get socketType => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get clientDomain => throw _privateConstructorUsedError;
  bool get isSecure => throw _privateConstructorUsedError;

  /// Serializes this SmtpConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmtpConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmtpConfigCopyWith<SmtpConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmtpConfigCopyWith<$Res> {
  factory $SmtpConfigCopyWith(
          SmtpConfig value, $Res Function(SmtpConfig) then) =
      _$SmtpConfigCopyWithImpl<$Res, SmtpConfig>;
  @useResult
  $Res call(
      {String host,
      int port,
      SocketType socketType,
      String? username,
      String? clientDomain,
      bool isSecure});
}

/// @nodoc
class _$SmtpConfigCopyWithImpl<$Res, $Val extends SmtpConfig>
    implements $SmtpConfigCopyWith<$Res> {
  _$SmtpConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmtpConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? socketType = null,
    Object? username = freezed,
    Object? clientDomain = freezed,
    Object? isSecure = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      socketType: null == socketType
          ? _value.socketType
          : socketType // ignore: cast_nullable_to_non_nullable
              as SocketType,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      clientDomain: freezed == clientDomain
          ? _value.clientDomain
          : clientDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      isSecure: null == isSecure
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmtpConfigImplCopyWith<$Res>
    implements $SmtpConfigCopyWith<$Res> {
  factory _$$SmtpConfigImplCopyWith(
          _$SmtpConfigImpl value, $Res Function(_$SmtpConfigImpl) then) =
      __$$SmtpConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String host,
      int port,
      SocketType socketType,
      String? username,
      String? clientDomain,
      bool isSecure});
}

/// @nodoc
class __$$SmtpConfigImplCopyWithImpl<$Res>
    extends _$SmtpConfigCopyWithImpl<$Res, _$SmtpConfigImpl>
    implements _$$SmtpConfigImplCopyWith<$Res> {
  __$$SmtpConfigImplCopyWithImpl(
      _$SmtpConfigImpl _value, $Res Function(_$SmtpConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmtpConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? socketType = null,
    Object? username = freezed,
    Object? clientDomain = freezed,
    Object? isSecure = null,
  }) {
    return _then(_$SmtpConfigImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      socketType: null == socketType
          ? _value.socketType
          : socketType // ignore: cast_nullable_to_non_nullable
              as SocketType,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      clientDomain: freezed == clientDomain
          ? _value.clientDomain
          : clientDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      isSecure: null == isSecure
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmtpConfigImpl implements _SmtpConfig {
  const _$SmtpConfigImpl(
      {required this.host,
      required this.port,
      required this.socketType,
      this.username,
      this.clientDomain,
      this.isSecure = true});

  factory _$SmtpConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmtpConfigImplFromJson(json);

  @override
  final String host;
  @override
  final int port;
  @override
  final SocketType socketType;
  @override
  final String? username;
  @override
  final String? clientDomain;
  @override
  @JsonKey()
  final bool isSecure;

  @override
  String toString() {
    return 'SmtpConfig(host: $host, port: $port, socketType: $socketType, username: $username, clientDomain: $clientDomain, isSecure: $isSecure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmtpConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.socketType, socketType) ||
                other.socketType == socketType) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.clientDomain, clientDomain) ||
                other.clientDomain == clientDomain) &&
            (identical(other.isSecure, isSecure) ||
                other.isSecure == isSecure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, host, port, socketType, username, clientDomain, isSecure);

  /// Create a copy of SmtpConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmtpConfigImplCopyWith<_$SmtpConfigImpl> get copyWith =>
      __$$SmtpConfigImplCopyWithImpl<_$SmtpConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmtpConfigImplToJson(
      this,
    );
  }
}

abstract class _SmtpConfig implements SmtpConfig {
  const factory _SmtpConfig(
      {required final String host,
      required final int port,
      required final SocketType socketType,
      final String? username,
      final String? clientDomain,
      final bool isSecure}) = _$SmtpConfigImpl;

  factory _SmtpConfig.fromJson(Map<String, dynamic> json) =
      _$SmtpConfigImpl.fromJson;

  @override
  String get host;
  @override
  int get port;
  @override
  SocketType get socketType;
  @override
  String? get username;
  @override
  String? get clientDomain;
  @override
  bool get isSecure;

  /// Create a copy of SmtpConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmtpConfigImplCopyWith<_$SmtpConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
