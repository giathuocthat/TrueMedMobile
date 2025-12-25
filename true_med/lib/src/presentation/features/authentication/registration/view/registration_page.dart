import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../domain/enum/select_location_mode.dart';
import '../../../../core/router/routes.dart';
import '../riverpod/register_provider.dart';
import 'widget/register_navigation_bar.dart';
import 'widget/register_policy_footer.dart';
import 'widget/register_stepper.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm

  final shouldPolicyCheck = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();

    final notifier = ref.read(registerProvider.notifier);

    shouldPolicyCheck.addListener(() {
      notifier.updatePolicyCheck(shouldPolicyCheck.value);
    });
  }

  @override
  void dispose() {
    shouldPolicyCheck.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isChecked = ref.watch(registerProvider).isPolicyChecked;
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Container(color: Colors.red, height: 2),
                RegisterStepper(),
              ],
            ),
          ),

          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: navBarHeight,
                child: RegisterNavigationBar(),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: RegisterPolicyFooter(
              shouldAgree: shouldPolicyCheck,
              onNext: isChecked
                  ? () {
                      context.pushNamed(Routes.bussinessType);
                      context.pushNamed(
                        Routes.selectProvinceDistrict,
                        extra: SelectLocationMode.province,
                      );
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
