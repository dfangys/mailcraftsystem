import '../repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';

/// Logout use case
class LogoutUseCase {
  /// Creates a logout use case
  const LogoutUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Repository getter
  AuthRepository get repository => _repository;
  
  /// Execute logout
  Future<({Failure? left, void right})> call() async {
    return await _repository.logout();
  }
}
