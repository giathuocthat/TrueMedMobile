part of '../view/login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.shouldRemember,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> shouldRemember;

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, // 🔥 QUAN TRỌNG
          child: Text(
            'Tên đăng nhập',
            style: AppTextStyles.bodyTextSm.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 44,
          child: TextFormField(
            controller: widget.emailController,
            //decoration: InputDecoration(hintText: context.locale.email),
            decoration: InputDecoration(
              hintText: 'Nhập email hoặc số điện thoại',
            ),
            validator: context.validator.apply([RequiredValidation()]),
          ),
        ),

        const SizedBox(height: 20),

        Container(
          width: double.infinity, // 🔥 QUAN TRỌNG
          child: Text(
            'Mật khẩu',
            style: AppTextStyles.bodyTextSm.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 6),

        SizedBox(
          height: 44,
          child: TextFormField(
            controller: widget.passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Nhập mật khẩu',
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(10), // 🔥 10px all sides
                    child: Image.asset(
                      _isPasswordVisible
                          ? AppAssets.iconEye
                          : AppAssets.iconNoEye,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            validator: context.validator.apply([
              RequiredValidation(),
              PasswordValidation(minLength: 6),
            ]),
          ),
        ),

        const SizedBox(height: 24),
        _FormFooter(shouldRemember: widget.shouldRemember),
      ],
    );
  }
}
