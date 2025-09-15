import '../models/auth_token.dart';
import '../models/login_request.dart';
import '../repositories/auth_repository.dart';

/// Login use case
class LoginUseCase {
  /// Creates a login use case
  const LoginUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Execute login
  Future<({AuthFailure? left, AuthToken? right})> call(LoginRequest request) async {
    // Validate email format
    if (!_isValidEmail(request.email)) {
      return (
        left: AuthFailure('Please enter a valid email address'),
        right: null,
      );
    }
    
    // Validate password
    if (request.password.isEmpty) {
      return (
        left: AuthFailure('Password cannot be empty'),
        right: null,
      );
    }
    
    if (request.password.length < 6) {
      return (
        left: AuthFailure('Password must be at least 6 characters long'),
        right: null,
      );
    }
    
    // Perform login
    return await _repository.login(request);
  }
  
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

/// Auth failure class
class AuthFailure {
  /// Creates an auth failure
  const AuthFailure(this.message);

  /// Error message
  final String message;
}
