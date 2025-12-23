import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../theme/theme.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final String text;
  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onTap,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: text,

            style: AppTextStyles.bodyTextSm.copyWith(
              color: AppColors.textTertiary600,
            ),
            children: [
              TextSpan(
                text: linkText,
                style: AppTextStyles.bodyTextSmSemiBold.copyWith(
                  color: AppColors.textBrandSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
