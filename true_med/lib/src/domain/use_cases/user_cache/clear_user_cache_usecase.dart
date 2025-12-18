import '../../repositories/user_repository.dart';

class ClearUserCacheUseCase {
  ClearUserCacheUseCase(this.repository);

  final UserRepository repository;

  Future<void> call() {
    return repository.clearUser();
  }
}
