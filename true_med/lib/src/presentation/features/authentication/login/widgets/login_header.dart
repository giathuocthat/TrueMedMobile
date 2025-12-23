import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Container(
        color: Colors.transparent, // hoặc transparent nếu có bg
        width: double.infinity, // 🔥 QUAN TRỌNG
        padding: const EdgeInsets.only(left: 16, top: 40),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              color: Colors.white,
              child: Image.asset(AppAssets.logoHeader, fit: BoxFit.contain),
            ),

            const SizedBox(height: 32),

            // TITLE
            Text(
              'Đăng nhập',
              style: AppTextStyles.displayXsSemiBold.copyWith(
                color: AppColors.fgPrimary,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Vui lòng nhập thông tin để đăng nhập',
              //style: AppTextStyles.bodyTextSm,
              style: AppTextStyles.bodyTextSm.copyWith(
                color: AppColors.textTertiary600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
