import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../shared/widget/btn_shadown.dart';
import '../../../../core/router/routes.dart';
import 'widget/register_navigation_bar.dart';
import 'widget/resgister_success_section.dart';

class RegisterSuccessPage extends StatefulWidget {
  const RegisterSuccessPage({super.key});

  @override
  State<RegisterSuccessPage> createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm
  final provinceController = TextEditingController();
  final wardController = TextEditingController();
  final streetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // 🔥 ép full size
        children: [
          // ---------- BACKGROUND ----------
          Image.asset(AppAssets.bgImage, fit: BoxFit.cover),

          // ---------- SCROLL CONTENT ----------
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              16,
              navBarTotalHeight + 32,
              16,
              footerBuffer, // 🔥 buffer an toàn
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RegisterSuccessSection(),

                const SizedBox(height: 48),

                FilledButton(
                  onPressed: () {
                    context.pushNamed(Routes.login);
                  },
                  child: const Text('Cung cấp thông tin và giấy phép'),
                ),

                const SizedBox(height: 16),

                OutlinedButtonWithShadow(
                  onPressed: () {
                    context.pushNamed(Routes.home);
                  },
                  child: const Text('Về trang chủ'),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
