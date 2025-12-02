import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/app_localization.dart';
import 'bottom_nav.dart';
import 'convex_bottom_nav.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Flutter Template')),
      appBar: null, // ⭐ Tắt AppBar
      extendBodyBehindAppBar: true, // ⭐ Cho phép nội dung nằm sát top
      body: widget.statefulNavigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.statefulNavigationShell.currentIndex,
        onTap: (index) {
          widget.statefulNavigationShell.goBranch(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.locale.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: context.locale.promotion,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_offer),
            label: context.locale.profile,
          ),
        ],
      ),
      // bottomNavigationBar: CustomBottomNav(
      //   navShell: widget.statefulNavigationShell,
      // ),

      // bottomNavigationBar: ConvexBottomNav(
      //   navShell: widget.statefulNavigationShell,
      // ),
    );
  }
}
