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
  ];
}
