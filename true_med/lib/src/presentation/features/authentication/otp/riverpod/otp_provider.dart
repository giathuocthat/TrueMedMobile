import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extensions/int.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../../domain/use_cases/authentication_use_case.dart';
import 'otp_state.dart';

part 'otp_provider.g.dart';

@riverpod
class Otp extends _$Otp {
  late SendOTPUseCase _sendOTPUseCase;

  @override
  OTPState build() {
    _sendOTPUseCase = ref.read(sendOTPUseCaseProvider);

    return OTPState();
  }

  void callSendOTP(String phone, OTPFlowType type) {
    resendOTP(phone, type.apiValue);
  }

  Future<void> resendOTP(String phone, int type) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _sendOTPUseCase.call(phone: phone, type: type);

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(status: Status.success);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);

      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }
}
