import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

/// Authentication token model
@freezed
/// AuthToken class
class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required String tokenType,
    required int expiresIn,
    String? refreshToken,
    @JsonKey(name: 'requires_otp') bool? requiresOtp,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}

/// Extension for token validation
extension AuthTokenExtension on AuthToken {
  /// Check if token is temporary (requires OTP)
  bool get isTemporary => requiresOtp == true;
  
  /// Get authorization header value
  String get authorizationHeader => '$tokenType $accessToken';
}
