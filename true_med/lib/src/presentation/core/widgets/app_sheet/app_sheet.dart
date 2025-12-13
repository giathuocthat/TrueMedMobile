import 'package:flutter/material.dart';

import 'app_sheet_route.dart';

class AppSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    double heightFactor = 0.8,
    bool dismissible = true,
    Duration duration = const Duration(milliseconds: 350),
  }) {
    return Navigator.of(context).push<T>(
      AppSheetRoute(
        child: child,
        heightFactor: heightFactor,
        dismissible: dismissible,
        duration: duration,
      ),
    );
  }
}
