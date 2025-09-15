import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Login use case
class LoginUseCase {
  const LoginUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Execute login
  Future<Either<Failure, AuthToken>> call(LoginRequest request) async {
    // Validate email format
    if (!_isValidEmail(request.email)) {
      return (
        left: const Failure.validation(
          message: 'Please enter a valid email address',
        ),
        right: null,
      );
    }
    
    // Validate password
    if (request.password.isEmpty) {
      return (
        left: const Failure.validation(
          message: 'Password cannot be empty',
        ),
        right: null,
      );
    }
    
    if (request.password.length < 6) {
      return (
        left: const Failure.validation(
          message: 'Password must be at least 6 characters long',
        ),
        right: null,
      );
    }
    
    // Perform login
    final result = await _repository.login(request);
    
    // Store token if login successful and not temporary
    if (result.isRight && result.right != null && !result.right!.isTemporary) {
      await _repository.storeToken(result.right!);
    }
    
    return result;
  }
  
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
