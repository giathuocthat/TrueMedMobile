import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../domain/enum/select_location_mode.dart';
import 'vertical_dot.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.state,
    required this.index,
    required this.showDot,
  });

  final ProvinceHeaderState state;
  final String index;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMain(),
        if (showDot) ...[
          const SizedBox(height: 4),
          const VerticalDots(count: 3),
        ],
      ],
    );
  }

  Widget _buildMain() {
    switch (state) {
      case ProvinceHeaderState.completed:
        return Image.asset(AppAssets.iconChecked, width: 24, height: 24);

      case ProvinceHeaderState.current:
      case ProvinceHeaderState.disabled:
        return Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.grayLight100),
          ),
          child: Text(
            index,
            style: AppTextStyles.bodyTextXsBold.copyWith(
              color: AppColors.textSecondary505,
            ),
          ),
        );
    }
  }
}
