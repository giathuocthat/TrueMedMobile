import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/link_text.dart';
import 'otp_input.dart';

class OtpInfoSection extends StatelessWidget {
  const OtpInfoSection({
    super.key,
    required this.phoneNumber,
    required this.remain,
    required this.onRetry,
    required this.onInputCompleted,
  });

  final String phoneNumber;
  final int remain;
  final VoidCallback onRetry;
  final void Function(String otp) onInputCompleted;

  @override
  Widget build(BuildContext context) {
    final bool isExpired = remain <= 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- TITLE ----------
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
        Text(
          'Nhập mã xác thực',
          style: AppTextStyles.bodyTextXLSemiBold.copyWith(
            color: AppColors.fgPrimaryText,
          ),
        ),

        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.bodyTextSm.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'Chúng tôi đã gửi mã xác thực (OTP) đến Zalo hoặc SMS qua số điện thoại ',
                    ),
                    TextSpan(
                      text: phoneNumber,
                      style: AppTextStyles.bodyTextSmBold.copyWith(
                        color: AppColors.textTertiary600,
                      ),
                    ),
                    const TextSpan(text: ' của bạn'),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        OtpInput(
          onCompleted: (otp) {
            onInputCompleted(otp);
          },
        ),
        const SizedBox(height: 24),

        LinkText(
          text: 'Chưa nhận được mã xác thực? ',
          linkText: isExpired ? 'Gửi lại' : 'Gửi lại sau ${remain}s',
          isActive: isExpired,
          onTap: isExpired
              ? () {
                  onRetry();
                }
              : null,
        ),
      ],
    );
  }
}
