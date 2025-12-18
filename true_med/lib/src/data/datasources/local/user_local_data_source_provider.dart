import 'package:riverpod/riverpod.dart';

import '../../../core/di/dependency_injection.dart';
import 'user_local_data_source.dart';

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSource(ref.read(cacheServiceProvider));
});
