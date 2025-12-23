import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState({
    @Default(false) bool rememberMe,
    @Default(Status.initial) Status status,
    String? error,
  }) = _RegisterState<T>;

  const RegisterState._();
}
