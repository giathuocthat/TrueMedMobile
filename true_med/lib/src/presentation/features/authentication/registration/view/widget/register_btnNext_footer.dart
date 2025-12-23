import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/widgets/link_text.dart';
import 'policy_footer.dart';

class ResgisterButtonNextFooter extends StatelessWidget {
  const ResgisterButtonNextFooter({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          16,
          16,
          16,
          20, // 🔥 cách bottom safe area 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: AppColors.borderPrimary, width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 QUAN TRỌNG
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilledButton(onPressed: onNext, child: const Text('Tiếp tục')),

            const SizedBox(height: 8),

            LinkText(
              text: 'Đã có tài khoản? ',
              linkText: 'Đăng nhập',
              onTap: () {
                context.pushNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
