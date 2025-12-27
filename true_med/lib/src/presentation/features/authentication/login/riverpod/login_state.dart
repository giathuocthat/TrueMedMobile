import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/api_response_error_model.dart';
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
  }) = _LoginState<T>;

  const LoginState._();

  bool get isValid => listError?.isEmpty == true;
  bool get hasError => !isValid;
  //bool get hasError => listError != null && listError!.isNotEmpty;
  String? get firstError =>
      listError?.isNotEmpty == true ? listError!.first.message : null;
}
