// app_navigator.dart
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';
import 'navigation_args/order_list_navigation_args.dart';

class AppNavigator {
  const AppNavigator._(); // prevent instance

  /// 👉 Đi tới Order Detail qua MyOrder tab
  static void goToOrderDetail(BuildContext context, {required int orderId}) {
    context.goNamed(
      Routes.myOrder,
      extra: OrderListNavigationArgs(openOrderId: orderId),
    );
  }

  /// 👉 Đi thẳng vào Order Detail (bỏ qua list)
  static void goDirectToOrderDetail(
    BuildContext context, {
    required int orderId,
  }) {
    context.goNamed(
      Routes.orderDetail,
      pathParameters: {'orderId': orderId.toString()},
    );
  }
}
