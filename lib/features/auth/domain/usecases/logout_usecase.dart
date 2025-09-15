import '../repositories/auth_repository.dart';
import 'login_usecase.dart';

/// Logout use case
class LogoutUseCase {
  /// Creates a logout use case
  const LogoutUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Execute logout
  Future<({AuthFailure? left, void right})> call() async {
    return await _repository.logout();
  }
}
