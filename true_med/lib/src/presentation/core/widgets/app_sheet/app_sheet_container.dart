import 'package:flutter/material.dart';

class AppSheetContainer extends StatelessWidget {
  final Animation<double> animation;
  final double heightFactor;
  final bool dismissible;
  final Widget child;

  const AppSheetContainer({
    required this.animation,
    required this.heightFactor,
    required this.dismissible,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );

    final height = MediaQuery.of(context).size.height * heightFactor;

    return GestureDetector(
      onTap: dismissible ? () => Navigator.pop(context) : null,
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: curved,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.12),
                end: Offset.zero,
              ).animate(curved),
              child: GestureDetector(
                onTap: () {}, // block tap xuyên
                child: Container(
                  height: height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
