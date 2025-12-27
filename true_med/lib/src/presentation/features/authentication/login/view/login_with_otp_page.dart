import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/routes.dart';
import '../../otp/view/widget/header_info_section.dart';
import '../../otp/view/widget/otp_info_section.dart';
import '../../registration/riverpod/register_provider.dart';
import '../../registration/riverpod/register_state.dart';
import '../../registration/view/widget/register_btnNext_footer.dart';
import '../../registration/view/widget/register_navigation_bar.dart';

class LoginWithOTPPage extends ConsumerStatefulWidget {
  const LoginWithOTPPage({super.key});

  @override
  ConsumerState<LoginWithOTPPage> createState() => _LoginWithOTPPageState();
}

class _LoginWithOTPPageState extends ConsumerState<LoginWithOTPPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm

  String otp = "";
  static const int _initialTime = 120;

  int _seconds = _initialTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resendOTP();
    });

    ref.listenManual<RegisterState>(registerProvider, (previous, next) {
      // 🔥 chỉ react khi từ false → true
      if (previous == null) return;

      if (previous.isSubmitting && !next.isSubmitting) {
        if (next.errorResgister != null) {
          // ❌ Có lỗi → show message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.errorResgister!)));
        } else {
          // ✅ Thành công
          _onPushToScreen();
        }
      }
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _seconds = _initialTime;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendOTP() {
    _startTimer();
    // ref.read(otpProvider.notifier).callSendOTP(widget.phone, widget.flow);
  }

  void _handleAction(String otp) {}

  void _sendRegister(String otp) {
    ref.read(registerProvider.notifier).callRegister(otp);
  }

  void _sendLogin(String otp) {
    // ref.read(loginProvider.notifier).loginWithOTP(
    //       phone: widget.phone,
    //       otp: otp,
    //     );
  }
  void _sendForgotPassword(String otp) {
    // ref.read(loginProvider.notifier).loginWithOTP(
    //       phone: widget.phone,
    //       otp: otp,
    //     );
  }
  void _onCheckExit() {
    //if (_formKey.currentState!.validate()) {
    ref
        .read(registerProvider.notifier)
        .checkPhoneAndEmailIsVaild(
          'phoneController.text',
          'emailController.text',
        );
    //}
  }

  void _onPushToScreen() {
    context.pushNamed(Routes.registerSuccess);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final phoneNumber = widget.phone.maskedPhone;
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

                OtpInfoSection(
                  phoneNumber: 'phoneNumber',
                  remain: _seconds,
                  onRetry: () {
                    _resendOTP();
                  },
                  onInputCompleted: (inputOtp) {
                    otp = inputOtp;
                  },
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
                child: RegisterNavigationBar(),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ResgisterButtonNextFooter(
              textDisplay: 'Xác nhận',
              isShowLogin: false,
              onNext: otp.length == 4
                  ? () {
                      _handleAction(otp);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
