import 'package:mailcraftsystem/features/auth/domain/models/user_profile.dart';

/// Authentication token model
class AuthToken {
  /// Creates an authentication token
  const AuthToken({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    this.refreshToken,
    this.requiresOtp = false,
    this.delivery,
    this.expiresAt,
    this.user,
  });

  /// The access token
  final String accessToken;

  /// The token type
  final String tokenType;

  /// The number of seconds until the token expires
  final int expiresIn;

  /// The refresh token
  final String? refreshToken;

  /// Whether the token requires OTP verification
  final bool requiresOtp;

  /// The OTP delivery method
  final String? delivery;

  /// The date and time when the token expires
  final DateTime? expiresAt;

  /// The user profile
  final UserProfile? user;

  /// Creates an authentication token from a JSON object
  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: json['expires_in'] as int,
      refreshToken: json['refresh_token'] as String?,
      requiresOtp: json['requires_otp'] as bool? ?? false,
      delivery: json['delivery'] as String?,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'] as String)
          : null,
      user: json['user'] != null
          ? UserProfile.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts the token to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'refresh_token': refreshToken,
      'requires_otp': requiresOtp,
      'delivery': delivery,
      'expires_at': expiresAt?.toIso8601String(),
      'user': user?.toJson(),
    };
  }

  /// Check if token is expired
  bool get isExpired => expiresAt?.isBefore(DateTime.now()) ?? false;

  /// Get authorization header value
  String get authorizationHeader => '$tokenType $accessToken';

  /// Copy with new values
  AuthToken copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    String? refreshToken,
    bool? requiresOtp,
    String? delivery,
    DateTime? expiresAt,
    UserProfile? user,
  }) {
    return AuthToken(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshToken: refreshToken ?? this.refreshToken,
      requiresOtp: requiresOtp ?? this.requiresOtp,
      delivery: delivery ?? this.delivery,
      expiresAt: expiresAt ?? this.expiresAt,
      user: user ?? this.user,
    );
  }
}
