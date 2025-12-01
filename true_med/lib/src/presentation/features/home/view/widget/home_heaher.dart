import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/go_router_extension.dart';
import '../../../../core/router/routes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
          Expanded(
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.search),
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 22, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "Tìm kiếm ...",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    Container(width: 1, height: 20, color: Colors.grey),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // ----------------- ICONS WITH BADGE -----------------
          _iconWithBadge(icon: Icons.notifications, badge: "88"),

          const SizedBox(width: 16),

          _iconWithBadge(icon: Icons.shopping_cart, badge: "18"),

          const SizedBox(width: 16),

          const Icon(Icons.person, color: Colors.white, size: 26),
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                fontSize: 10,
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
