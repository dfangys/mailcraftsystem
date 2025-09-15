// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compose_validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageValidationResultImpl _$$MessageValidationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageValidationResultImpl(
      isValid: json['isValid'] as bool,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sizeInfo: json['sizeInfo'] == null
          ? null
          : MessageSizeInfo.fromJson(json['sizeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageValidationResultImplToJson(
        _$MessageValidationResultImpl instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'errors': instance.errors,
      'warnings': instance.warnings,
      'sizeInfo': instance.sizeInfo,
    };

_$MessageSizeInfoImpl _$$MessageSizeInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageSizeInfoImpl(
      totalSize: (json['totalSize'] as num).toInt(),
      contentSize: (json['contentSize'] as num).toInt(),
      attachmentSize: (json['attachmentSize'] as num).toInt(),
      exceedsLimit: json['exceedsLimit'] as bool? ?? false,
      maxAllowedSize: (json['maxAllowedSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MessageSizeInfoImplToJson(
        _$MessageSizeInfoImpl instance) =>
    <String, dynamic>{
      'totalSize': instance.totalSize,
      'contentSize': instance.contentSize,
      'attachmentSize': instance.attachmentSize,
      'exceedsLimit': instance.exceedsLimit,
      'maxAllowedSize': instance.maxAllowedSize,
    };

_$AddressValidationResultImpl _$$AddressValidationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressValidationResultImpl(
      address: json['address'] as String,
      isValid: json['isValid'] as bool,
      error: json['error'] as String?,
      suggestion: json['suggestion'] as String?,
    );

Map<String, dynamic> _$$AddressValidationResultImplToJson(
        _$AddressValidationResultImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'isValid': instance.isValid,
      'error': instance.error,
      'suggestion': instance.suggestion,
    };

_$AddressSuggestionImpl _$$AddressSuggestionImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressSuggestionImpl(
      email: json['email'] as String,
      name: json['name'] as String?,
      source: json['source'] as String?,
      frequency: (json['frequency'] as num?)?.toInt(),
      lastUsed: json['lastUsed'] == null
          ? null
          : DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$$AddressSuggestionImplToJson(
        _$AddressSuggestionImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'source': instance.source,
      'frequency': instance.frequency,
      'lastUsed': instance.lastUsed?.toIso8601String(),
    };

_$ContactInfoImpl _$$ContactInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContactInfoImpl(
      email: json['email'] as String,
      name: json['name'] as String?,
      organization: json['organization'] as String?,
      phone: json['phone'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ContactInfoImplToJson(_$ContactInfoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'organization': instance.organization,
      'phone': instance.phone,
      'notes': instance.notes,
    };

_$SendResultImpl _$$SendResultImplFromJson(Map<String, dynamic> json) =>
    _$SendResultImpl(
      success: json['success'] as bool,
      messageId: json['messageId'] as String?,
      error: json['error'] as String?,
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$$SendResultImplToJson(_$SendResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'messageId': instance.messageId,
      'error': instance.error,
      'sentAt': instance.sentAt?.toIso8601String(),
    };
