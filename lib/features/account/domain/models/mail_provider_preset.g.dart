// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_provider_preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MailProviderPresetImpl _$$MailProviderPresetImplFromJson(
        Map<String, dynamic> json) =>
    _$MailProviderPresetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      domains:
          (json['domains'] as List<dynamic>).map((e) => e as String).toList(),
      imapConfig:
          ImapConfig.fromJson(json['imapConfig'] as Map<String, dynamic>),
      smtpConfig:
          SmtpConfig.fromJson(json['smtpConfig'] as Map<String, dynamic>),
      description: json['description'] as String?,
      logoUrl: json['logoUrl'] as String?,
      requiresInsecureSSL: json['requiresInsecureSSL'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$MailProviderPresetImplToJson(
        _$MailProviderPresetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'domains': instance.domains,
      'imapConfig': instance.imapConfig,
      'smtpConfig': instance.smtpConfig,
      'description': instance.description,
      'logoUrl': instance.logoUrl,
      'requiresInsecureSSL': instance.requiresInsecureSSL,
      'isActive': instance.isActive,
    };
