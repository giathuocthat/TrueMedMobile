import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/api_response_error_model.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState<T> with _$LoginState<T> {
  const factory LoginState({
    @Default(false) bool rememberMe,
    @Default(Status.initial) Status status,
    String? error,
    @Default('') String phoneNumber,
    @Default('') String passWord,

    @Default('') String otp,
    List<FieldErrorModel>? listError,
    @Default(false) bool isLoginSuccess,
    @Default(AuthFlowStep.idle) AuthFlowStep authFlowStep,
  }) = _LoginState<T>;

  const LoginState._();

  //bool get hasError => listError?.isNotEmpty == true;

  String? get firstError =>
      listError?.isNotEmpty == true ? listError!.first.message : null;
}
