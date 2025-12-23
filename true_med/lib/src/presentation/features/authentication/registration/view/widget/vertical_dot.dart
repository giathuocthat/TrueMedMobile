import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';

class VerticalDots extends StatelessWidget {
  final int count;
  final double size;
  final double spacing;
  final Color color;
  final double opacity;

  const VerticalDots({
    super.key,
    this.count = 7,
    this.size = 2,
    this.spacing = 4,
    this.color = AppColors.bgDisabled,
    this.opacity = 0.6, // 👈 60%
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: spacing / 2),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
