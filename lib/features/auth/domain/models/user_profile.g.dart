// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      twoFactorEnabled: json['two_factor_enabled'] as bool?,
      quota: json['quota'] == null
          ? null
          : UserQuota.fromJson(json['quota'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'two_factor_enabled': instance.twoFactorEnabled,
      'quota': instance.quota,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$UserQuotaImpl _$$UserQuotaImplFromJson(Map<String, dynamic> json) =>
    _$UserQuotaImpl(
      used: (json['used'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$UserQuotaImplToJson(_$UserQuotaImpl instance) =>
    <String, dynamic>{
      'used': instance.used,
      'total': instance.total,
      'unit': instance.unit,
    };
