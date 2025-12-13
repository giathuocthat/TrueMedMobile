import 'package:flutter/material.dart';

import 'app_sheet_container.dart';

class AppSheetRoute<T> extends PageRoute<T> {
  final Widget child;
  final double heightFactor;
  final bool dismissible;
  final Duration duration;

  AppSheetRoute({
    required this.child,
    required this.heightFactor,
    required this.dismissible,
    required this.duration,
  });

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => dismissible;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.35);

  @override
  String get barrierLabel => 'AppSheet';

  @override
  Duration get transitionDuration => duration;

  @override
  bool get maintainState => true;

  @override
  Duration get reverseTransitionDuration => duration;

  @override
  bool get fullscreenDialog => false;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return AppSheetContainer(
      animation: animation,
      heightFactor: heightFactor,
      dismissible: dismissible,
      child: child,
    );
  }
}
