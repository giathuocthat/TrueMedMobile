class Endpoints {
  //static const base = 'https://192.168.1.150/api/';
  //static const base = 'https://treena-noncellulous-alan.ngrok-free.dev/api/';
  //static const base = 'https://treena-noncellulous-alan.ngrok-free.dev/api';
  static const base = 'https://treena-noncellulous-alan.ngrok-free.dev/api';

  /// Authentication
  static const String register = '/auth/register/';
  static const String login = '/customer/auth/login';
  static const String forgotPassword = '/auth/forgot_password/';
  static const String resetPassword = '/auth/reset_password/';
  static const String refreshToken = '/auth/refresh_token/';

  /// OTP
  static const String verifyOtp = '/otp/verify_otp/';
  static const String resendOtp = '/otp/resend_otp/';

  // Product
  static const String products = '/product';

  // Product
  static const String productStores = '/product/getStoreProduct';

  // Product
  static const String productDetail = '/product/{id}';

  // Province
  static const String provinceAll = '/province';
  static const String provinceDetail = '/province/{id}';
  static const String wardAll = '/Ward';
  static const String wardDetail = '/ward/{id}';

  // Address
  static const String addressAll = '/addresses/customer/{id}';
  static const String setAddressDefault = '/addresses/customer/{id}/default';
  static const String newAddress = '/addresses';
  static const String deleteAddress = '/addresses/{id}';
  static const String editAddress = '/addresses/{id}';
  static const String defaultAddress = '/addresses/customer/{id}/default';

  // Order
  static const String placeOrder = '/order/customer/place-order';
  static const String orderList = '/order/customer/list';
  static const String myOrders = '/order/customer/listxxxx';
}
