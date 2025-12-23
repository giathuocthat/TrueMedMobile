import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import 'step_item.dart';

class RegisterStepper extends StatelessWidget {
  const RegisterStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- TITLE ----------
        Text(
          'Đăng ký tài khoản',
          style: AppTextStyles.bodyTextXLSemiBold.copyWith(
            color: AppColors.fgSecondary,
          ),
        ),

        const SizedBox(height: 24),

        // ---------- STEPS ----------
        const StepItem(
          index: 1,
          title: 'Chọn hình thức kinh doanh',
          subtitle: 'Hình thức kinh doanh của doanh nghiệp',
          isLast: false,
        ),
        const SizedBox(height: 24),

        const StepItem(
          index: 2,
          title: 'Nhập thông tin tài khoản',
          subtitle: 'Cung cấp email và số điện thoại',
          isLast: false,
        ),
        const SizedBox(height: 24),

        const StepItem(
          index: 3,
          title: 'Nhập địa chỉ kinh doanh',
          subtitle: 'Chi tiết địa điểm của doanh nghiệp',
          isLast: true,
        ),
      ],
    );
  }
}
