class Routes {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  static const String login = '/login';
  static const String resetPassword = 'reset-password';
  static const String emailVerification = 'email-verification';
  static const String createNewPassword = 'create-new-password';
  static const String resetPasswordSuccess = 'reset-password-success';
  static const String registration = 'registration';

  static const String home = '/home';
  static const String promo = '/promo';
  static const String myOrder = '/my-order';
  static const String search = '/search';
  static const String productDetail = '/product-detail/:productId';

  static const String paymentCheckout = '/payment-checkout';
  static const String shippingAddress = '/shipping-address/:addressId';
  static const String createShippingAddress = '/create-shipping-address';
  static const String editShippingAddress = '/edit-shipping-address/:addressId';

  static const String cartOrder = '/cart-order';
  static const String notification = '/notification';
  static const String quickOrder = '/quick-order';
  static const String orders = '/orders';
  static const String reward = '/reward';
  static const String profile = '/profile';

  static const String orderDetail = '/order-detail/:orderId';
}
