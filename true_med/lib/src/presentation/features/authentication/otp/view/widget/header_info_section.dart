import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class HeaderInfoSection extends StatelessWidget {
  HeaderInfoSection({
    super.key,
    this.iconShow,
    required this.title,
    this.subTitle,
  });
  String? iconShow;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- TITLE ----------
        if (iconShow != null) ...[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderPrimaryCheck, width: 1),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                AppAssets.iconMobile,
                width: 24,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ] else ...[
          const SizedBox.shrink(),
        ],

        // ---------- TITLE ----------
        Text(
          title,
          style: AppTextStyles.bodyTextXLSemiBold.copyWith(
            color: AppColors.fgPrimaryText,
          ),
        ),

        // ---------- SUB TITLE ----------
        if (subTitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subTitle ?? '',
            style: AppTextStyles.bodyTextSm.copyWith(
              color: AppColors.textTertiary600,
            ),
          ),
        ] else ...[
          const SizedBox.shrink(),
        ],
      ],
    );
  }
}
