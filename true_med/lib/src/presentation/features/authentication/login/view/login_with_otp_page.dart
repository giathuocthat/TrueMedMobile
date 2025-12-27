import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../core/router/routes.dart';
import '../../otp/view/confirm_otp_args.dart';
import '../../otp/view/widget/header_info_section.dart';
import '../../registration/view/widget/login_otp_info_form.dart';
import '../../registration/view/widget/register_btnNext_footer.dart';
import '../../registration/view/widget/register_navigation_bar.dart';
import '../riverpod/login_provider.dart';
import '../riverpod/login_state.dart';

class LoginWithOTPPage extends ConsumerStatefulWidget {
  const LoginWithOTPPage({super.key});

  @override
  ConsumerState<LoginWithOTPPage> createState() => _LoginWithOTPPageState();
}

class _LoginWithOTPPageState extends ConsumerState<LoginWithOTPPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  var phoneNumber = '';
  @override
  void initState() {
    super.initState();

    ref.listenManual<LoginState>(loginProvider, (previous, next) {
      if (previous == null) return;

      // ✅ Thành công → đi tiếp
      if (previous.authFlowStep != AuthFlowStep.needOtp &&
          next.authFlowStep == AuthFlowStep.needOtp) {
        _onPushToScreen();
        return;
      }

      // ❌ Chỉ show lỗi khi chuyển từ không lỗi → có lỗi
      if (!previous.status.isInvalid && next.status.isInvalid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.firstError ?? 'Số điện thoại chưa được đăng ký.',
            ),
          ),
        );
      }
    });
  }

  void _onCheckExit() {
    if (_formKey.currentState!.validate()) {
      phoneNumber = phoneController.text;
      ref.read(loginProvider.notifier).checkPhone(phoneNumber);
    }
  }

  void _onPushToScreen() {
    // ref.read(loginProvider.notifier).setStatusInit();
    context.pushNamed(
      Routes.confirmOTP,
      extra: ConfirmOtpArgs(phone: phoneNumber, flow: OTPFlowType.login),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderInfoSection(
                  iconShow: AppAssets.iconMobile,
                  title: 'Nhập số điện thoại',
                ),

                const SizedBox(height: 32),

                Form(
                  key: _formKey,

                  child: LoginOTPInfoForm(phoneController: phoneController),
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
                child: RegisterNavigationBar(
                  title: 'Đăng nhập bằng số điện thoại',
                ),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ResgisterButtonNextFooter(
              textDisplay: 'Nhận mã xác thực',

              isShowLogin: false,
              onNext: state.status.isLoading ? null : _onCheckExit,
            ),
          ),
        ],
      ),
    );
  }
}
