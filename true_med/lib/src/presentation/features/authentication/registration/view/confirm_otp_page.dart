import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../core/router/routes.dart';
import '../riverpod/register_provider.dart';
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

  static const int _initialTime = 120;
  int _seconds = _initialTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resendOTP();
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
    ref.read(registerProvider.notifier).callSendOTP();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OtpInfoSection(
                  phoneNumber: '+84 123 456 789',
                  remain: _seconds,
                  onRetry: () {
                    _resendOTP();
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
              onNext: () {
                context.pushNamed(Routes.registerSuccess);
              },
            ),
          ),
        ],
      ),
    );
  }
}
