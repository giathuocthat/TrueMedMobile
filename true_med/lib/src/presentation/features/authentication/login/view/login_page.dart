import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/extensions/validation.dart';
import '../../../../../core/utiliity/validation/validation.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../../shared/app_checkbox.dart';
import '../../../../core/base/status.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widgets/link_text.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../features/authentication/login/riverpod/login_provider.dart';
import '../../otp/view/confirm_otp_args.dart';
import '../widgets/login_header.dart';

part '../widgets/login_form.dart';
part '../widgets/login_form_footer.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final shouldRemember = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    final notifier = ref.read(loginProvider.notifier);
    notifier.checkRememberMe();

    shouldRemember.addListener(() {
      notifier.updateRememberMe(shouldRemember.value);
    });

    ref.listenManual(loginProvider, (previous, next) {
      if (next.status.isSuccess && next.isLoginSuccess) {
        notifier.saveRememberMe(shouldRemember.value);
        context.pushReplacementNamed(Routes.home);
      } else {
        shouldRemember.value = next.rememberMe;
      }

      if (next.status.isError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(loginProvider.notifier)
          .login(
            email: emailController.text,
            password: passwordController.text,
            shouldRemember: shouldRemember.value,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // 🔥 ép full size
        children: [
          // ---------- BACKGROUND ----------
          Image.asset(AppAssets.bgImage, fit: BoxFit.cover),

          // ---------- CONTENT (TÔN TRỌNG SAFE AREA) ----------
          SingleChildScrollView(
            //padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const LoginHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),

                      Form(
                        key: _formKey,
                        child: _LoginForm(
                          emailController: emailController,
                          passwordController: passwordController,
                          shouldRemember: shouldRemember,
                        ),
                      ),

                      const SizedBox(height: 24),

                      FilledButton(
                        onPressed: state.status.isLoading ? null : _onLogin,
                        child: state.status.isLoading
                            ? const LoadingIndicator()
                            : const Text('Đăng nhập'),
                      ),
                      const SizedBox(height: 12),

                      OutlinedButton.icon(
                        onPressed: () {
                          context.pushNamed(Routes.loginWithOTP);
                        },
                        icon: Image.asset(
                          AppAssets.iconMobile,
                          width: 24,
                          height: 24,
                        ),
                        label: const Text('Đăng nhập bằng số điện thoại'),
                      ),
                      const SizedBox(height: 12),

                      LinkText(
                        text: 'Bạn chưa có tài khoản? ',
                        linkText: 'Đăng ký ngay',
                        onTap: () {
                          context.pushNamed(Routes.registration);
                          // context.pushNamed(
                          //   Routes.confirmOTP,
                          //   extra: ConfirmOtpArgs(
                          //     phone: '0976973927',
                          //     flow: OTPFlowType.register,
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
