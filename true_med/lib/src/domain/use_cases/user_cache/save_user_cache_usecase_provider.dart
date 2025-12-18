import 'package:riverpod/riverpod.dart';

import '../../../data/repositories/user_repository_provider.dart';
import 'save_user_cache_usecase.dart';

final saveUserCacheUseCaseProvider = Provider<SaveUserCacheUseCase>((ref) {
  return SaveUserCacheUseCase(ref.read(userRepositoryProvider));
});
