import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class BussinessAddressSection extends StatelessWidget {
  const BussinessAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- TITLE ----------
        Text(
          'Địa chỉ kinh doanh',
          style: AppTextStyles.bodyTextXLSemiBold.copyWith(
            color: AppColors.fgPrimaryText,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'Nhập thông tin bên dưới để đăng ký tài khoản',
          style: AppTextStyles.bodyTextSm.copyWith(
            color: AppColors.textTertiary600,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
