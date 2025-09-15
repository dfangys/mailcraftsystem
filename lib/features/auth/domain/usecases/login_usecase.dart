import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/models/auth_token.dart';
import 'package:mailcraftsystem/features/auth/domain/models/login_request.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Login use case
class LoginUseCase {
  /// Creates a login use case
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  /// Repository getter
  AuthRepository get repository => _repository;

  /// Execute login
  Future<Either<Failure, AuthToken>> call(LoginRequest request) async {
    // Validate email format
    if (!_isValidEmail(request.email)) {
      return const Left(
        Failure.validation(message: 'Please enter a valid email address'),
      );
    }

    // Validate password
    if (request.password.isEmpty) {
      return const Left(
        Failure.validation(message: 'Password cannot be empty'),
      );
    }

    if (request.password.length < 6) {
      return const Left(
        Failure.validation(
            message: 'Password must be at least 6 characters long'),
      );
    }

    // Perform login
    return _repository.login(request);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
