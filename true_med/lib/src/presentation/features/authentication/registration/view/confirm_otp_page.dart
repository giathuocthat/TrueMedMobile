import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/extensions/string.dart';
import '../../../../core/router/routes.dart';
import '../riverpod/register_provider.dart';
import '../riverpod/register_state.dart';
import 'widget/otp_info_section.dart';
import 'widget/register_btnNext_footer.dart';
import 'widget/register_navigation_bar.dart';

class ConfirmOTPPage extends ConsumerStatefulWidget {
  const ConfirmOTPPage({super.key});

  @override
  ConsumerState<ConfirmOTPPage> createState() => _ConfirmOTPPageState();
}

class _ConfirmOTPPageState extends ConsumerState<ConfirmOTPPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm
  // final provinceController = TextEditingController();
  // final wardController = TextEditingController();
  // final streetController = TextEditingController();

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

  //context.pushNamed(Routes.registerSuccess);
  void _resendOTP() {
    _startTimer();
    ref.read(registerProvider.notifier).callSendOTP();
  }

  void _sendRegister(String otp) {
    ref.read(registerProvider.notifier).callRegister(otp);
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
    final state = ref.watch(registerProvider);
    final phoneNumber = state.phoneNumber.maskedPhone;
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
                      _sendRegister(otp);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
