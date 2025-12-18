import '../../entities/customer_entity.dart';
import '../../repositories/user_repository.dart';

class GetCachedUserUseCase {
  GetCachedUserUseCase(this.repository);

  final UserRepository repository;

  Future<CustomerResponseEntity?> call() {
    return repository.getCachedUser();
  }
}
