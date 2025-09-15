// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_provider_preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MailProviderPreset _$MailProviderPresetFromJson(Map<String, dynamic> json) {
  return _MailProviderPreset.fromJson(json);
}

/// @nodoc
mixin _$MailProviderPreset {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  List<String> get domains => throw _privateConstructorUsedError;
  ImapConfig get imapConfig => throw _privateConstructorUsedError;
  SmtpConfig get smtpConfig => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  bool get requiresInsecureSSL => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this MailProviderPreset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailProviderPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailProviderPresetCopyWith<MailProviderPreset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailProviderPresetCopyWith<$Res> {
  factory $MailProviderPresetCopyWith(
          MailProviderPreset value, $Res Function(MailProviderPreset) then) =
      _$MailProviderPresetCopyWithImpl<$Res, MailProviderPreset>;
  @useResult
  $Res call(
      {String id,
      String name,
      String displayName,
      List<String> domains,
      ImapConfig imapConfig,
      SmtpConfig smtpConfig,
      String? description,
      String? logoUrl,
      bool requiresInsecureSSL,
      bool isActive});

  $ImapConfigCopyWith<$Res> get imapConfig;
  $SmtpConfigCopyWith<$Res> get smtpConfig;
}

/// @nodoc
class _$MailProviderPresetCopyWithImpl<$Res, $Val extends MailProviderPreset>
    implements $MailProviderPresetCopyWith<$Res> {
  _$MailProviderPresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailProviderPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? domains = null,
    Object? imapConfig = null,
    Object? smtpConfig = null,
    Object? description = freezed,
    Object? logoUrl = freezed,
    Object? requiresInsecureSSL = null,
    Object? isActive = null,
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
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imapConfig: null == imapConfig
          ? _value.imapConfig
          : imapConfig // ignore: cast_nullable_to_non_nullable
              as ImapConfig,
      smtpConfig: null == smtpConfig
          ? _value.smtpConfig
          : smtpConfig // ignore: cast_nullable_to_non_nullable
              as SmtpConfig,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresInsecureSSL: null == requiresInsecureSSL
          ? _value.requiresInsecureSSL
          : requiresInsecureSSL // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MailProviderPreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImapConfigCopyWith<$Res> get imapConfig {
    return $ImapConfigCopyWith<$Res>(_value.imapConfig, (value) {
      return _then(_value.copyWith(imapConfig: value) as $Val);
    });
  }

  /// Create a copy of MailProviderPreset
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
abstract class _$$MailProviderPresetImplCopyWith<$Res>
    implements $MailProviderPresetCopyWith<$Res> {
  factory _$$MailProviderPresetImplCopyWith(_$MailProviderPresetImpl value,
          $Res Function(_$MailProviderPresetImpl) then) =
      __$$MailProviderPresetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String displayName,
      List<String> domains,
      ImapConfig imapConfig,
      SmtpConfig smtpConfig,
      String? description,
      String? logoUrl,
      bool requiresInsecureSSL,
      bool isActive});

  @override
  $ImapConfigCopyWith<$Res> get imapConfig;
  @override
  $SmtpConfigCopyWith<$Res> get smtpConfig;
}

/// @nodoc
class __$$MailProviderPresetImplCopyWithImpl<$Res>
    extends _$MailProviderPresetCopyWithImpl<$Res, _$MailProviderPresetImpl>
    implements _$$MailProviderPresetImplCopyWith<$Res> {
  __$$MailProviderPresetImplCopyWithImpl(_$MailProviderPresetImpl _value,
      $Res Function(_$MailProviderPresetImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailProviderPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? domains = null,
    Object? imapConfig = null,
    Object? smtpConfig = null,
    Object? description = freezed,
    Object? logoUrl = freezed,
    Object? requiresInsecureSSL = null,
    Object? isActive = null,
  }) {
    return _then(_$MailProviderPresetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      domains: null == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imapConfig: null == imapConfig
          ? _value.imapConfig
          : imapConfig // ignore: cast_nullable_to_non_nullable
              as ImapConfig,
      smtpConfig: null == smtpConfig
          ? _value.smtpConfig
          : smtpConfig // ignore: cast_nullable_to_non_nullable
              as SmtpConfig,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresInsecureSSL: null == requiresInsecureSSL
          ? _value.requiresInsecureSSL
          : requiresInsecureSSL // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailProviderPresetImpl implements _MailProviderPreset {
  const _$MailProviderPresetImpl(
      {required this.id,
      required this.name,
      required this.displayName,
      required final List<String> domains,
      required this.imapConfig,
      required this.smtpConfig,
      this.description,
      this.logoUrl,
      this.requiresInsecureSSL = false,
      this.isActive = true})
      : _domains = domains;

  factory _$MailProviderPresetImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailProviderPresetImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;
  final List<String> _domains;
  @override
  List<String> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  final ImapConfig imapConfig;
  @override
  final SmtpConfig smtpConfig;
  @override
  final String? description;
  @override
  final String? logoUrl;
  @override
  @JsonKey()
  final bool requiresInsecureSSL;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'MailProviderPreset(id: $id, name: $name, displayName: $displayName, domains: $domains, imapConfig: $imapConfig, smtpConfig: $smtpConfig, description: $description, logoUrl: $logoUrl, requiresInsecureSSL: $requiresInsecureSSL, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailProviderPresetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.imapConfig, imapConfig) ||
                other.imapConfig == imapConfig) &&
            (identical(other.smtpConfig, smtpConfig) ||
                other.smtpConfig == smtpConfig) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.requiresInsecureSSL, requiresInsecureSSL) ||
                other.requiresInsecureSSL == requiresInsecureSSL) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      displayName,
      const DeepCollectionEquality().hash(_domains),
      imapConfig,
      smtpConfig,
      description,
      logoUrl,
      requiresInsecureSSL,
      isActive);

  /// Create a copy of MailProviderPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailProviderPresetImplCopyWith<_$MailProviderPresetImpl> get copyWith =>
      __$$MailProviderPresetImplCopyWithImpl<_$MailProviderPresetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailProviderPresetImplToJson(
      this,
    );
  }
}

abstract class _MailProviderPreset implements MailProviderPreset {
  const factory _MailProviderPreset(
      {required final String id,
      required final String name,
      required final String displayName,
      required final List<String> domains,
      required final ImapConfig imapConfig,
      required final SmtpConfig smtpConfig,
      final String? description,
      final String? logoUrl,
      final bool requiresInsecureSSL,
      final bool isActive}) = _$MailProviderPresetImpl;

  factory _MailProviderPreset.fromJson(Map<String, dynamic> json) =
      _$MailProviderPresetImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  List<String> get domains;
  @override
  ImapConfig get imapConfig;
  @override
  SmtpConfig get smtpConfig;
  @override
  String? get description;
  @override
  String? get logoUrl;
  @override
  bool get requiresInsecureSSL;
  @override
  bool get isActive;

  /// Create a copy of MailProviderPreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailProviderPresetImplCopyWith<_$MailProviderPresetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
