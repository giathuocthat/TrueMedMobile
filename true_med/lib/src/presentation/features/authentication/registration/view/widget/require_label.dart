import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class RequiredLabel extends StatelessWidget {
  final String text;

  const RequiredLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppTextStyles.bodyTextSm.copyWith(
          color: AppColors.textSecondary,
        ),
        children: [
          TextSpan(
            text: ' *',
            style: AppTextStyles.bodyTextSmMedium.copyWith(
              color: AppColors.textErrorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
