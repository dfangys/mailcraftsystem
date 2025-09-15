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
    @JsonKey(name: 'requires_otp') @Default(false) bool requiresOtp,
    String? delivery,
    DateTime? expiresAt,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}

/// Extension for token validation
extension AuthTokenExtension on AuthToken {

  
  /// Check if token is expired
  bool get isExpired => expiresAt?.isBefore(DateTime.now()) ?? false;

  /// Get authorization header value
  String get authorizationHeader => '$tokenType $accessToken';
}

