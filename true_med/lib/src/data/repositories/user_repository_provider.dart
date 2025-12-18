import 'package:riverpod/riverpod.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/local/user_local_data_source_provider.dart';
import 'user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(userLocalDataSourceProvider));
});
