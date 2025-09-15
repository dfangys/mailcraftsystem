import 'package:mailcraftsystem/core/error/failures.dart';
import 'package:mailcraftsystem/features/auth/domain/repositories/auth_repository.dart';

/// Logout use case
class LogoutUseCase {
  const LogoutUseCase(this._repository);
  
  final AuthRepository _repository;
  
  /// Execute logout
  Future<Either<Failure, void>> call() async {
    // Clear stored token first
    await _repository.clearToken();
    
    // Perform server-side logout
    final result = await _repository.logout();
    
    return result;
  }
}
