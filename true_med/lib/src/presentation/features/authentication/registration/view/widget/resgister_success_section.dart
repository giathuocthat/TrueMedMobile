import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class RegisterSuccessSection extends StatelessWidget {
  const RegisterSuccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ---------- TITLE ----------
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderPrimaryCheck, width: 1),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              AppAssets.iconSuccess,
              width: 28,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Tài khoản được tạo thành công',
          style: AppTextStyles.bodyTextXLSemiBold.copyWith(
            color: AppColors.fgPrimaryText,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'Chỉ còn một bước nữa để bắt đầu sử dụng trọn vẹn',
          style: AppTextStyles.bodyTextSm.copyWith(
            color: AppColors.textTertiary600,
          ),
        ),
      ],
    );
  }
}
