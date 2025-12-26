import '../../domain/enum/app_enums.dart';

extension OTPFlowTypeX on OTPFlowType {
  int get apiValue => switch (this) {
    OTPFlowType.register => 0,
    OTPFlowType.login => 1,
    OTPFlowType.forgotPass => 2,
  };

  String get name => switch (this) {
    OTPFlowType.register => 'register',
    OTPFlowType.login => 'login',
    OTPFlowType.forgotPass => ' ',
  };
}
