import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../model/mock_data.dart';
import 'business_type_option.dart';

class BussinessTypeSection extends StatelessWidget {
  const BussinessTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- TITLE ----------
        Text(
          'Hình thức kinh doanh',
          style: AppTextStyles.bodyTextXLSemiBold.copyWith(
            color: AppColors.fgPrimaryText,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'Chọn hình thức kinh doanh tương ứng với doanh nghiệp của bạn',
          style: AppTextStyles.bodyTextSm.copyWith(
            color: AppColors.textTertiary600,
          ),
        ),
      ],
    );
  }
}
