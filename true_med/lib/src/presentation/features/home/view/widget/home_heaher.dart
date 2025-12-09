import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../shared/widget/icon_with_badge.dart';
import '../../../../core/router/routes.dart';
import '../../../application/cart/riverpod/cart_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qty = ref.watch(cartProvider.select((s) => s.totalQuantity));

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

          IconWithBadge(
            icon: Icons.notifications,
            badge: '3',
            onTap: () => context.pushNamed(Routes.notification),
          ),

          const SizedBox(width: 16),

          IconWithBadge(
            icon: Icons.shopping_cart,
            badge: '$qty',

            onTap: () => context.pushNamed(Routes.cartOrder),
          ),

          const SizedBox(width: 16),

          IconWithBadge(
            icon: Icons.person,
            onTap: () => context.pushNamed(Routes.profile),
          ),
        ],
      ),
    );
  }
}
