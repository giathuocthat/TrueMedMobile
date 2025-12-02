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
  ];
}
