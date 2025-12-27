import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/extensions/string.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../core/router/routes.dart';
import '../../login/riverpod/login_provider.dart';
import '../../login/riverpod/login_state.dart';
import '../../registration/riverpod/register_provider.dart';
import '../../registration/riverpod/register_state.dart';
import '../riverpod/otp_provider.dart';
import 'widget/otp_info_section.dart';
import '../../registration/view/widget/register_btnNext_footer.dart';
import '../../registration/view/widget/register_navigation_bar.dart';

class ConfirmOTPPage extends ConsumerStatefulWidget {
  final String phone;
  final OTPFlowType flow;
  const ConfirmOTPPage({super.key, required this.phone, required this.flow});

  @override
  ConsumerState<ConfirmOTPPage> createState() => _ConfirmOTPPageState();
}

class _ConfirmOTPPageState extends ConsumerState<ConfirmOTPPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm

  String otp = "";
  static const int _initialTime = 120;
  final ValueNotifier<String> otpNotifier = ValueNotifier('');

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
          _onPushToRegisterSuccess();
        }
      }
    });

    ref.listenManual(loginProvider, (previous, next) {
      if (next.status.isSuccess) {
        //notifier.saveRememberMe(shouldRemember.value);
        //context.pushReplacementNamed(Routes.home);
        _onPushToHome();
      } else {
        //shouldRemember.value = next.rememberMe;
      }

      if (next.status.isError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
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
    ref.read(otpProvider.notifier).callSendOTP(widget.phone, widget.flow);
  }

  void _handleAction(String otp) {
    if (widget.flow == OTPFlowType.register) {
      _sendRegister(otp);
    } else if (widget.flow == OTPFlowType.login) {
      _sendLogin(otp);
    } else if (widget.flow == OTPFlowType.forgotPass) {
      _sendForgotPassword(otp);
    }
  }

  void _sendRegister(String otp) {
    ref.read(registerProvider.notifier).callRegister(otp);
  }

  void _sendLogin(String otp) {
    ref.read(loginProvider.notifier).loginPhone(phone: widget.phone, otp: otp);
  }

  void _sendForgotPassword(String otp) {
    // ref.read(loginProvider.notifier).loginWithOTP(
    //       phone: widget.phone,
    //       otp: otp,
    //     );
  }
  void _onPushToRegisterSuccess() {
    ref.invalidate(registerProvider);
    context.pushNamed(Routes.registerSuccess);
  }

  void _onPushToHome() {
    ref.invalidate(loginProvider);
    context.pushReplacementNamed(Routes.home);
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = widget.phone.maskedPhone;
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
                OtpInfoSection(
                  phoneNumber: phoneNumber,
                  remain: _seconds,
                  onRetry: () {
                    _resendOTP();
                  },
                  onInputCompleted: (inputOtp) {
                    otpNotifier.value = inputOtp;
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
          ValueListenableBuilder<String>(
            valueListenable: otpNotifier,
            builder: (context, otp, _) {
              return Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ResgisterButtonNextFooter(
                  textDisplay: 'Xác nhận',
                  isShowLogin: false,
                  onNext: otp.length == 4 ? () => _handleAction(otp) : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
