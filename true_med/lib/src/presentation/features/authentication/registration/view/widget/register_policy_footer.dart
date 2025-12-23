import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/widgets/link_text.dart';
import 'policy_footer.dart';

class ResgisterPolyciFooter extends StatelessWidget {
  const ResgisterPolyciFooter({super.key, required this.onNext});

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
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: AppColors.borderPrimary, width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 QUAN TRỌNG
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PolicyFooter(shouldRemember: ValueNotifier<bool>(false)),
            const SizedBox(height: 16),

            FilledButton(
              onPressed: onNext,
              child: const Text('Bắt đầu đăng ký'),
            ),

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
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.08),
    //         offset: const Offset(0, -2),
    //         blurRadius: 10,
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       PolicyFooter(shouldRemember: ValueNotifier<bool>(false)),
    //       const SizedBox(height: 16),
    //       FilledButton(onPressed: () {}, child: const Text('Bắt đầu đăng ký')),
    //       const SizedBox(height: 0),
    //       LinkText(
    //         text: 'Đã có tài khoản? ',
    //         linkText: 'Đăng nhập',
    //         onTap: () {
    //           context.pushNamed(Routes.login);
    //         },
    //       ),
    //       const Spacer(),
    //     ],
    //   ),
    // );
  }
}
