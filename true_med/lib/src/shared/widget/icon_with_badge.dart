import 'package:flutter/material.dart';

import '../../core/extensions/string.dart';

class IconWithBadge extends StatelessWidget {
  final IconData icon;
  final String? badge;
  final VoidCallback? onTap;

  const IconWithBadge({super.key, required this.icon, this.badge, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: Colors.white, size: 26),

          // chỉ render badge nếu có
          if (badge != null && badge!.isNotEmpty)
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
                  badge!.formatBadge(),
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
