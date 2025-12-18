import '../../entities/customer_entity.dart';
import '../../repositories/user_repository.dart';

class SaveUserCacheUseCase {
  SaveUserCacheUseCase(this.repository);

  final UserRepository repository;

  Future<void> call(CustomerResponseEntity user) {
    return repository.saveUser(user);
  }
}
