import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/use_cases/authentication_use_case.dart';
import '../../../../../domain/use_cases/user_cache/save_user_cache_usecase_provider.dart';
import '../../../../core/application_state/user/user_provider.dart';
import 'login_state.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  late LoginUseCase _loginUseCase;
  late CheckRememberMeUseCase _checkRememberMeUseCase;
  late SaveRememberMeUseCase _saveRememberMeUseCase;

  @override
  LoginState build() {
    _loginUseCase = ref.read(loginUseCaseProvider);
    _checkRememberMeUseCase = ref.read(checkRememberMeUseCaseProvider);
    _saveRememberMeUseCase = ref.read(saveRememberMeUseCaseProvider);

    return const LoginState();
  }

  Future<void> checkRememberMe() async {
    final rememberMe = await _checkRememberMeUseCase.call();
    state = state.copyWith(rememberMe: rememberMe);
  }

  void updateRememberMe(bool rememberMe) {
    state = state.copyWith(rememberMe: rememberMe);
  }

  Future<void> saveRememberMe(bool rememberMe) async {
    await _saveRememberMeUseCase.call(rememberMe);
  }

  void login({
    required String email,
    required String password,
    bool? shouldRemember,
  }) async {
    state = state.copyWith(status: Status.loading);

    final result = await _loginUseCase.call(
      email: email,
      password: password,
      shouldRemember: shouldRemember,
    );

    // state = switch (result) {
    //   Success() => state.copyWith(status: Status.success),
    //   Error(:final error) => state.copyWith(status: Status.error, error: error),
    //   _ => state.copyWith(status: Status.error),
    // };
    switch (result) {
      case Success(:final data):
        if (data.customer != null) {
          // 1️⃣ Set user cho toàn app
          ref.read(userProvider.notifier).setUser(data.customer!);

          // 2️⃣ Cache user nếu rememberMe
          if (shouldRemember != null && shouldRemember) {
            await ref.read(saveUserCacheUseCaseProvider).call(data.customer!);
          }
        }

        state = state.copyWith(status: Status.success);
        break;

      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
        break;

      default:
        state = state.copyWith(status: Status.error);
    }
  }
}
