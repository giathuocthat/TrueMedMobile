import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/local/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.local);

  final UserLocalDataSource local;

  @override
  Future<CustomerResponseEntity?> getCachedUser() {
    return Future.value(local.getUser());
  }

  @override
  Future<void> saveUser(CustomerResponseEntity user) {
    return local.saveUser(user);
  }

  @override
  Future<void> clearUser() {
    return local.clear();
  }
}
