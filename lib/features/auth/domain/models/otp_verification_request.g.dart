// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpVerificationRequestImpl _$$OtpVerificationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpVerificationRequestImpl(
      token: json['token'] as String,
      code: json['code'] as String,
      deviceId: json['deviceId'] as String?,
      rememberDevice: json['rememberDevice'] as bool? ?? false,
    );

Map<String, dynamic> _$$OtpVerificationRequestImplToJson(
        _$OtpVerificationRequestImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'code': instance.code,
      'deviceId': instance.deviceId,
      'rememberDevice': instance.rememberDevice,
    };
