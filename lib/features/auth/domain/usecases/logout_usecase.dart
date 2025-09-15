import 'package:dartz/dartz.dart';
import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Logout use case
class LogoutUseCase {
  /// Creates a logout use case
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  /// Repository getter
  AuthRepository get repository => _repository;

  /// Execute logout
  Future<Either<Failure, void>> call() async {
    return _repository.logout();
  }
}
