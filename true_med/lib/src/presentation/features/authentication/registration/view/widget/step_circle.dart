import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class StepCircleWidget extends StatelessWidget {
  final int index;

  StepCircleWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bgBrandSolid, // xanh đậm
      ),
      child: Text(
        index.toString(),
        style: AppTextStyles.bodyTextMdSemiBold.copyWith(color: Colors.white),
      ),
    );
  }
}
