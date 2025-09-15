// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_account_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MailAccountConfigImpl _$$MailAccountConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$MailAccountConfigImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imapConfig:
          ImapConfig.fromJson(json['imapConfig'] as Map<String, dynamic>),
      smtpConfig:
          SmtpConfig.fromJson(json['smtpConfig'] as Map<String, dynamic>),
      allowInsecureSSL: json['allowInsecureSSL'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MailAccountConfigImplToJson(
        _$MailAccountConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'imapConfig': instance.imapConfig,
      'smtpConfig': instance.smtpConfig,
      'allowInsecureSSL': instance.allowInsecureSSL,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$ImapConfigImpl _$$ImapConfigImplFromJson(Map<String, dynamic> json) =>
    _$ImapConfigImpl(
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
      socketType: $enumDecode(_$SocketTypeEnumMap, json['socketType']),
      username: json['username'] as String?,
      isSecure: json['isSecure'] as bool? ?? true,
    );

Map<String, dynamic> _$$ImapConfigImplToJson(_$ImapConfigImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'socketType': _$SocketTypeEnumMap[instance.socketType]!,
      'username': instance.username,
      'isSecure': instance.isSecure,
    };

const _$SocketTypeEnumMap = {
  SocketType.plain: 'plain',
  SocketType.ssl: 'ssl',
  SocketType.starttls: 'starttls',
};

_$SmtpConfigImpl _$$SmtpConfigImplFromJson(Map<String, dynamic> json) =>
    _$SmtpConfigImpl(
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
      socketType: $enumDecode(_$SocketTypeEnumMap, json['socketType']),
      username: json['username'] as String?,
      clientDomain: json['clientDomain'] as String?,
      isSecure: json['isSecure'] as bool? ?? true,
    );

Map<String, dynamic> _$$SmtpConfigImplToJson(_$SmtpConfigImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'socketType': _$SocketTypeEnumMap[instance.socketType]!,
      'username': instance.username,
      'clientDomain': instance.clientDomain,
      'isSecure': instance.isSecure,
    };
