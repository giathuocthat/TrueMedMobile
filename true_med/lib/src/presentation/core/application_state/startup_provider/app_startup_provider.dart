import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../domain/use_cases/user_cache/get_cached_user_usecase_provider.dart';
import '../localization_provider/localization_provider.dart';
import '../user/user_provider.dart';

part 'app_startup_provider.g.dart';

// @Riverpod(keepAlive: true)
// Future<void> appStartup(Ref ref) async {
//   ref.onDispose(() {
//     ref.invalidate(sharedPreferencesProvider);
//   });

//   await ref.watch(sharedPreferencesProvider.future);

//   await ref.read(localizationProvider.notifier).setCurrentLocal();
// }

enum AppStartupResult { onboarding, login, home }

@Riverpod(keepAlive: true)
Future<AppStartupResult> appStartup(Ref ref) async {
  ref.onDispose(() {
    ref.invalidate(sharedPreferencesProvider);
  });
  await ref.watch(sharedPreferencesProvider.future);
  await ref.read(localizationProvider.notifier).setCurrentLocal();

  final isOnboarded = await ref.read(getOnboardingStatusUseCaseProvider).call();

  if (!isOnboarded) {
    // Mark onboarding as completed
    ref.read(markOnboardingCompletedUseCaseProvider).call();
    return AppStartupResult.onboarding;
  }

  final isLoggedIn = await ref.read(getUserLoginStatusUseCaseProvider).call();

  if (!isLoggedIn) {
    return AppStartupResult.login;
  }

  // 🔥 REFRESH TOKEN Ở ĐÂY
  await ref.read(refreshTokenUseCaseProvider).call();

  final cachedUser = await ref.read(getCachedUserUseCaseProvider).call();

  if (cachedUser != null) {
    ref.read(userProvider.notifier).setUser(cachedUser);
  }
  //final cachedUser = await ref.read(getCachedUserUseCaseProvider).call();

  // if (cachedUser != null) {
  //   ref.read(userProvider.notifier).setUser(cachedUser);
  // }

  // 🔥 LOAD USER
  //await ref.read(loadUserProfileUseCaseProvider).call();

  return AppStartupResult.home;
}
