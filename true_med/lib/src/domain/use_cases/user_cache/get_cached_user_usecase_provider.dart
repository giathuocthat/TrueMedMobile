import 'package:riverpod/riverpod.dart';

import 'get_cached_user_usecase.dart';
import '../../repositories/user_repository.dart';
import '../../../data/repositories/user_repository_provider.dart';

final getCachedUserUseCaseProvider = Provider<GetCachedUserUseCase>((ref) {
  return GetCachedUserUseCase(ref.read(userRepositoryProvider));
});
