import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../core/router/routes.dart';
import '../../otp/view/widget/header_info_section.dart';
import '../riverpod/register_provider.dart';
import '../riverpod/register_state.dart';
import 'widget/register_btnNext_footer.dart';
import 'widget/register_info_form.dart';
import 'widget/register_navigation_bar.dart';
import 'widget/register_policy_footer.dart';

class AccountInfoPage extends ConsumerStatefulWidget {
  const AccountInfoPage({super.key});

  @override
  ConsumerState<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends ConsumerState<AccountInfoPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.listenManual<RegisterState>(registerProvider, (previous, next) {
      // 🔥 chỉ react khi từ false → true
      if (previous == null) return;

      if (previous.authFlowStep != AuthFlowStep.needOtp &&
          next.authFlowStep == AuthFlowStep.needOtp) {
        _onPushToScreen();
        return;
      }

      if (!previous.status.isInvalid && next.status.isInvalid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.firstError ?? 'Đã có lỗi xảy ra')),
        );
      }
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _onCheckExit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(registerProvider.notifier)
          .checkPhoneAndEmailIsVaild(
            phoneController.text,
            emailController.text,
          );
    }
  }

  void _onPushToScreen() {
    ref
        .read(registerProvider.notifier)
        .updateAccountInfo(
          phoneController.text,
          passwordController.text,
          emailController.text,
        );
    context.pushNamed(Routes.bussinessAddress);
  }

  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;
    final state = ref.watch(registerProvider);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderInfoSection(
                  title: 'Thông tin tài khoản',
                  subTitle: 'Nhập thông tin bên dưới để đăng ký tài khoản',
                ),
                const SizedBox(height: 32),
                Form(
                  key: _formKey,

                  child: RegisterInfoForm(
                    phoneController: phoneController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    emailController: emailController,
                  ),
                ),
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
                child: RegisterNavigationBar(currentStep: 2, totalSteps: 3),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ResgisterButtonNextFooter(
              // onPressed: state.status.isLoading ? null : _onCheckExit,
              onNext: state.status.isLoading ? null : _onCheckExit,
            ),
          ),
        ],
      ),
    );
  }
}
