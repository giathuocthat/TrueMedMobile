import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_shadows.dart';

class OutlinedButtonWithShadow extends StatelessWidget {
  const OutlinedButtonWithShadow({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),

        // 🔥 SHADOW NGOÀI
        boxShadow: const [
          AppShadows.xsOuter, // shadow ngoài
        ],
      ),
      child: Stack(
        children: [
          // 🔹 Inset shadows
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            ),
          ),

          // 🔹 Button thật
          OutlinedButton(
            onPressed: onPressed,
            style:
                OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  // foregroundColor: _enabled
                  //     ? AppColors.fgPrimary
                  //     : AppColors.fgPrimary,
                  //side: BorderSide(color: AppColors.borderPrimary, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).copyWith(
                  // ❌ bỏ overlay đen khi press/hover
                  //overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
            child: child,
          ),
        ],
      ),
    );
  }
}
