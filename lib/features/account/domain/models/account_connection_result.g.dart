// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_connection_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountConnectionResultImpl _$$AccountConnectionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountConnectionResultImpl(
      isSuccess: json['isSuccess'] as bool,
      details: json['details'] as String?,
      errorMessage: json['errorMessage'] as String?,
      capabilities: (json['capabilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AccountConnectionResultImplToJson(
        _$AccountConnectionResultImpl instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'details': instance.details,
      'errorMessage': instance.errorMessage,
      'capabilities': instance.capabilities,
    };
