import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../shared/app_checkbox.dart';
import '../../../../../core/router/routes.dart';

class PolicyFooter extends ConsumerWidget {
  const PolicyFooter({required this.shouldRemember});

  final ValueNotifier<bool> shouldRemember;

  void _toggleRememberMe(bool? value) {
    shouldRemember.value = value ?? false;
  }

  void _navigateToResetPassword(BuildContext context) {
    context.pushNamed(Routes.resetPassword);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTextStyle(
      style: AppTextStyles.bodyTextSmSemiBold.copyWith(
        color: AppColors.textBrandSecondary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: shouldRemember,
            builder: (context, value, _) {
              //return Checkbox(value: value, onChanged: _toggleRememberMe);
              return Padding(
                padding: const EdgeInsets.only(top: 2), // spacing-xxs
                child: AppCheckbox(value: value, onChanged: _toggleRememberMe),
              );
              //return AppCheckbox(value: value, onChanged: _toggleRememberMe);
            },
          ),

          const SizedBox(width: 8),

          // 🔥 QUAN TRỌNG: Expanded
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyTextSm.copyWith(
                  color: AppColors.textSecondary,
                ),
                children: [
                  const TextSpan(text: 'Tôi đồng ý với '),
                  TextSpan(
                    text: 'Điều khoản sử dụng',
                    style: AppTextStyles.bodyTextSmSemiBold.copyWith(
                      color: AppColors.linkPrimary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // mở điều khoản
                      },
                  ),
                  const TextSpan(
                    text:
                        ', và xác nhận tôi đã có đủ giấy phép cần thiết cũng như đáp ứng các điều kiện theo quy định của pháp luật',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
