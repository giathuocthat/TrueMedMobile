import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNav extends StatelessWidget {
  final StatefulNavigationShell navShell;

  const CustomBottomNav({super.key, required this.navShell});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ---- Background bottom bar ----
        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(
                context,
                index: 0,
                icon: Icons.home_outlined,
                label: "Trang Chủ",
                selected: navShell.currentIndex == 0,
              ),
              _navItem(
                context,
                index: 1,
                icon: Icons.local_fire_department_outlined,
                label: "Khuyến Mãi",
                selected: navShell.currentIndex == 1,
              ),
              const SizedBox(width: 60), // Space for floating button
              _navItem(
                context,
                index: 3,
                icon: Icons.archive_outlined,
                label: "Đơn Hàng",
                badge: "23",
                selected: navShell.currentIndex == 3,
              ),
              _navItem(
                context,
                index: 4,
                icon: Icons.local_fire_department,
                label: "Lợi Nhuận Cao",
                selected: navShell.currentIndex == 4,
              ),
            ],
          ),
        ),

        // ---- Floating Center Button ----
        Positioned(
          top: -28,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => navShell.goBranch(2),
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: navShell.currentIndex == 2
                        ? Colors.green
                        : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 32,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --------------- Bottom Nav Item ---------------
  Widget _navItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
    required bool selected,
    String? badge,
  }) {
    final color = selected ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: () => navShell.goBranch(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 24, color: color),

                if (badge != null)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
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
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
