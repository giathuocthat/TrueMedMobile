import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

import 'step_circle.dart';
import 'vertical_dot.dart';

class StepItem extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool isLast;

  const StepItem({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- LEFT (CIRCLE + LINE) ----------
        Column(
          children: [
            StepCircleWidget(index: index),
            if (!isLast)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: VerticalDots(),
              ),
          ],
        ),

        const SizedBox(width: 16),

        // ---------- RIGHT (TEXT) ----------
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyTextMdSemiBold.copyWith(
                  color: AppColors.fgSecondary,
                ),
              ),
              const SizedBox(height: 0),
              Text(
                subtitle,
                style: AppTextStyles.bodyTextMd.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
