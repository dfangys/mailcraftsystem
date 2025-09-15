// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpChallengeImpl _$$OtpChallengeImplFromJson(Map<String, dynamic> json) =>
    _$OtpChallengeImpl(
      challengeId: json['challengeId'] as String,
      method: json['method'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      maskedDestination: json['maskedDestination'] as String?,
    );

Map<String, dynamic> _$$OtpChallengeImplToJson(_$OtpChallengeImpl instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'method': instance.method,
      'expiresIn': instance.expiresIn,
      'maskedDestination': instance.maskedDestination,
    };

_$OtpVerificationRequestImpl _$$OtpVerificationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpVerificationRequestImpl(
      challengeId: json['challengeId'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$OtpVerificationRequestImplToJson(
        _$OtpVerificationRequestImpl instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'code': instance.code,
    };
