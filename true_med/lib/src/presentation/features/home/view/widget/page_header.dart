import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/go_router_extension.dart';
import '../../../../core/router/routes.dart';

class PageHeader extends StatelessWidget {
  final String title;
  const PageHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B4D2C), // màu xanh đậm
      padding: const EdgeInsets.only(
        top: 50, // chừa chỗ status bar
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Row(
        children: [
          // ----------------- SEARCH BAR -----------------
          Text(title, style: TextStyle(fontSize: 15, color: Colors.white)),

          //const SizedBox(width: 16),
          Spacer(),
          // ----------------- ICONS WITH BADGE -----------------
          _iconWithBadge(icon: Icons.notifications, badge: "88"),

          const SizedBox(width: 16),

          _iconWithBadge(icon: Icons.shopping_cart, badge: "18"),
        ],
      ),
    );
  }

  // Badge component
  Widget _iconWithBadge({required IconData icon, required String badge}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, color: Colors.white, size: 26),
        Positioned(
          right: -6,
          top: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                fontSize: 7,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
