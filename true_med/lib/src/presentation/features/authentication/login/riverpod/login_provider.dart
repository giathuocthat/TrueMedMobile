import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../data/models/api_response_error_model.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../../domain/use_cases/authentication_use_case.dart';
import '../../../../../domain/use_cases/user_cache/save_user_cache_usecase_provider.dart';
import '../../../../core/application_state/user/user_provider.dart';
import 'login_state.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  late LoginUseCase _loginUseCase;
  late LoginPhoneUseCase _loginPhoneUseCase;
  late CheckRememberMeUseCase _checkRememberMeUseCase;
  late SaveRememberMeUseCase _saveRememberMeUseCase;

  late CheckExitingPhoneEmailUseCase _checkExitingPhoneEmailUseCase;

  @override
  LoginState build() {
    ref.keepAlive(); // 🔥 giữ state

    ref.onDispose(() {
      debugPrint('🔥 RegisterProvider disposed');
    });

    _loginUseCase = ref.read(loginUseCaseProvider);
    _loginPhoneUseCase = ref.read(loginPhoneUseCaseProvider);
    _checkRememberMeUseCase = ref.read(checkRememberMeUseCaseProvider);
    _saveRememberMeUseCase = ref.read(saveRememberMeUseCaseProvider);
    _checkExitingPhoneEmailUseCase = ref.read(
      checkExitingPhoneEmailUseCaseProvider,
    );

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
    state = state.copyWith(status: Status.loading, isLoginSuccess: false);

    final result = await _loginUseCase.call(
      email: email,
      password: password,
      shouldRemember: shouldRemember,
    );

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

        state = state.copyWith(status: Status.success, isLoginSuccess: true);
        break;

      case Error(:final error):
        state = state.copyWith(
          status: Status.error,
          error: error.message,
          isLoginSuccess: false,
        );
        break;

      default:
        state = state.copyWith(status: Status.error, isLoginSuccess: false);
    }
  }

  void loginPhone({
    required String phone,
    required String otp,
    bool? shouldRemember,
  }) async {
    state = state.copyWith(
      status: Status.loading,
      authFlowStep: AuthFlowStep.verifyingOtp,
    );

    final result = await _loginPhoneUseCase.call(
      phone: phone,
      otp: otp,
      shouldRemember: shouldRemember,
    );

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

        state = state.copyWith(
          status: Status.success,
          authFlowStep: AuthFlowStep.success,
          isLoginSuccess: true,
        );
        break;

      case Error(:final error):
        state = state.copyWith(
          status: Status.error,
          error: error.message, // ← Convert Failure → String
          isLoginSuccess: false,
        );
        break;

      default:
        state = state.copyWith(status: Status.error, isLoginSuccess: false);
    }
  }

  void setPhone(String phone) {
    state = state.copyWith(phoneNumber: phone);
  }

  void checkPhone(String phone) {
    setPhone(phone);
    checkPhoneAndEmailIsVaild(phone, "noemail@noemail.com");
  }

  void setOtp(String otp) {
    state = state.copyWith(otp: otp);
  }

  Future<void> checkPhoneAndEmailIsVaild(String phone, String? email) async {
    // reset state trước
    state = state.copyWith(
      status: Status.loading,
      authFlowStep: AuthFlowStep.checkingPhone,
      error: null,
      listError: null,
    );

    // 1) Call API 1
    final result1 = await _checkExitingPhoneEmailUseCase.call(
      phone: phone,
      email: email,
    );

    switch (result1) {
      case Success(:final data):
        final phoneIsValid = !data.isValid;
        state = state.copyWith(
          status: phoneIsValid ? Status.success : Status.invalid,
          authFlowStep: phoneIsValid
              ? AuthFlowStep.needOtp
              : AuthFlowStep.checkingPhone,
          listError: data.errors,
        );

      case Error(:final error):
        state = state.copyWith(
          status: Status.error,
          //authFlowStep: AuthFlowStep.idle,
          //listError: [FieldErrorModel.general(error)],
        );
      default:
        state = state.copyWith(
          status: Status.error,
          //authFlowStep: AuthFlowStep.idle,
          //listError: [FieldErrorModel.general('Something went wrong')],
        );
        return;
    }
  }
}
