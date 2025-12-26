import '../../../../../domain/enum/app_enums.dart';

class ConfirmOtpArgs {
  final String phone;
  final OTPFlowType flow;

  const ConfirmOtpArgs({required this.phone, required this.flow});
}
