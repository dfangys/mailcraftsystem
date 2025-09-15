// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_connection_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountConnectionResultImpl _$$AccountConnectionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountConnectionResultImpl(
      imapConnected: json['imapConnected'] as bool,
      smtpConnected: json['smtpConnected'] as bool,
      imapError: json['imapError'] as String?,
      smtpError: json['smtpError'] as String?,
      capabilities: json['capabilities'] == null
          ? null
          : AccountCapabilities.fromJson(
              json['capabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountConnectionResultImplToJson(
        _$AccountConnectionResultImpl instance) =>
    <String, dynamic>{
      'imapConnected': instance.imapConnected,
      'smtpConnected': instance.smtpConnected,
      'imapError': instance.imapError,
      'smtpError': instance.smtpError,
      'capabilities': instance.capabilities,
    };

_$AccountValidationResultImpl _$$AccountValidationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountValidationResultImpl(
      isValid: json['isValid'] as bool,
      fieldErrors: (json['fieldErrors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AccountValidationResultImplToJson(
        _$AccountValidationResultImpl instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'fieldErrors': instance.fieldErrors,
      'warnings': instance.warnings,
    };

_$AccountCapabilitiesImpl _$$AccountCapabilitiesImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountCapabilitiesImpl(
      supportsIdle: json['supportsIdle'] as bool? ?? false,
      supportsMove: json['supportsMove'] as bool? ?? false,
      supportsSort: json['supportsSort'] as bool? ?? false,
      supportsSearch: json['supportsSearch'] as bool? ?? false,
      supportsQuota: json['supportsQuota'] as bool? ?? false,
      supportsUidPlus: json['supportsUidPlus'] as bool? ?? false,
      supportedExtensions: (json['supportedExtensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxMessageSize: (json['maxMessageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AccountCapabilitiesImplToJson(
        _$AccountCapabilitiesImpl instance) =>
    <String, dynamic>{
      'supportsIdle': instance.supportsIdle,
      'supportsMove': instance.supportsMove,
      'supportsSort': instance.supportsSort,
      'supportsSearch': instance.supportsSearch,
      'supportsQuota': instance.supportsQuota,
      'supportsUidPlus': instance.supportsUidPlus,
      'supportedExtensions': instance.supportedExtensions,
      'maxMessageSize': instance.maxMessageSize,
    };
