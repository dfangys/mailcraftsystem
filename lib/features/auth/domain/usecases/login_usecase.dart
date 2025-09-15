import '../models/auth_token.dart';
import '../models/login_request.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';

/// Login use case
class LoginUseCase {
  /// Creates a login use case
  const LoginUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Repository getter
  AuthRepository get repository => _repository;
  
  /// Execute login
  Future<({Failure? left, AuthToken? right})> call(LoginRequest request) async {
    // Validate email format
    if (!_isValidEmail(request.email)) {
      return (
        left: Failure.validation(message: 'Please enter a valid email address'),
        right: null,
      );
    }
    
    // Validate password
    if (request.password.isEmpty) {
      return (
        left: Failure.validation(message: 'Password cannot be empty'),
        right: null,
      );
    }
    
    if (request.password.length < 6) {
      return (
        left: Failure.validation(message: 'Password must be at least 6 characters long'),
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
