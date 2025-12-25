part of '../router.dart';

List<GoRoute> _modalRoutes(ref) {
  return [
    GoRoute(
      path: Routes.search,
      name: Routes.search,
      pageBuilder: (context, state) {
        return const MaterialPage(child: SearchPage());
      },
    ),
    //profile
    GoRoute(
      path: Routes.profile,
      name: Routes.profile,
      pageBuilder: (context, state) {
        return const MaterialPage(child: ProfilePage());
      },
    ),

    //notification
    GoRoute(
      path: Routes.notification,
      name: Routes.notification,
      pageBuilder: (context, state) {
        return const MaterialPage(child: NotificationPage());
      },
    ),

    //cart order
    GoRoute(
      path: Routes.cartOrder,
      name: Routes.cartOrder,
      pageBuilder: (context, state) {
        return const MaterialPage(child: CartOrderPage());
      },
    ),

    //product detail
    GoRoute(
      path: Routes.productDetail,
      name: Routes.productDetail,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: ProductDetailPage(
            productId: int.parse(state.pathParameters['productId']!),
          ),
        );
      },
    ),

    //product detail
    GoRoute(
      path: Routes.paymentCheckout,
      name: Routes.paymentCheckout,
      pageBuilder: (context, state) {
        return const MaterialPage(child: PaymentCheckoutPage());
      },
    ),

    //shipping address
    GoRoute(
      path: Routes.shippingAddress,
      name: Routes.shippingAddress,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: ShippingAddressPage(
            addressId: int.parse(state.pathParameters['addressId']!),
          ),
        );
      },
    ),

    //edit shipping address
    GoRoute(
      path: Routes.editShippingAddress,
      name: Routes.editShippingAddress,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: EditShippingAddressPage(
            addressId: int.parse(state.pathParameters['addressId']!),
          ),
        );
      },
    ),

    //edit shipping address
    GoRoute(
      path: Routes.createShippingAddress,
      name: Routes.createShippingAddress,
      pageBuilder: (context, state) {
        return const MaterialPage(child: EditShippingAddressPage());
      },
    ),
    // select province district
    GoRoute(
      path: Routes.selectProvinceDistrict,
      name: Routes.selectProvinceDistrict,
      pageBuilder: (context, state) {
        final mode = state.extra as SelectLocationMode;
        return MaterialPage(child: SelectProvinceDistrictPage(mode: mode));
      },
    ),

    //order Detail
    GoRoute(
      path: Routes.orderDetail,
      name: Routes.orderDetail,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: OrderDetailPage(
            orderId: int.parse(state.pathParameters['orderId']!),
          ),
        );
      },
    ),
    //order success
    GoRoute(
      path: Routes.orderSuccess,
      name: Routes.orderSuccess,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: OrderSuccessPage(
            orderId: int.parse(state.pathParameters['orderId']!),
          ),
        );
      },
    ),
  ];
}
