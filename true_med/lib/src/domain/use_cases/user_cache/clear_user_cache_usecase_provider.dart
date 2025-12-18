import 'package:riverpod/riverpod.dart';

import 'clear_user_cache_usecase.dart';
import '../../../data/repositories/user_repository_provider.dart';

final clearUserCacheUseCaseProvider = Provider<ClearUserCacheUseCase>((ref) {
  return ClearUserCacheUseCase(ref.read(userRepositoryProvider));
});
