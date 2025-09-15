import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

/// Authentication token model
@freezed
class AuthToken with _$AuthToken {
  /// Creates an authentication token
  const factory AuthToken({
    /// The access token
    required String accessToken,

    /// The token type
    required String tokenType,

    /// The number of seconds until the token expires
    required int expiresIn,

    /// The refresh token
    String? refreshToken,

    /// Whether the token requires OTP verification
    @JsonKey(name: 'requires_otp') @Default(false) bool requiresOtp,

    /// The OTP delivery method
    String? delivery,

    /// The date and time when the token expires
    DateTime? expiresAt,

    /// The user profile
    UserProfile? user,
  }) = _AuthToken;

  /// Creates an authentication token from a JSON object
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
