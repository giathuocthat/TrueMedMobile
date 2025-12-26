import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OTPState<T> with _$OTPState<T> {
  const factory OTPState({
    @Default(Status.initial) Status status,

    @Default('') String otp,

    String? error,
  }) = _OTPState<T>;

  const OTPState._();
}
