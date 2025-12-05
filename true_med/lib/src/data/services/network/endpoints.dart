class Endpoints {
  static const base = 'https://192.168.1.150/api/';

  /// Authentication
  static const String register = '/auth/register/';
  static const String login = '/customer/auth/login';
  static const String forgotPassword = '/auth/forgot_password/';
  static const String resetPassword = '/auth/reset_password/';
  static const String refreshToken = '/auth/refresh_token/';

  /// OTP
  static const String verifyOtp = '/otp/verify_otp/';
  static const String resendOtp = '/otp/resend_otp/';
}
