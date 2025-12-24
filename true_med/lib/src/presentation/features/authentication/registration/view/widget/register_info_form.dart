import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/extensions/validation.dart';
import '../../../../../../core/utiliity/validation/confirm_pass_validation.dart';
import '../../../../../../core/utiliity/validation/phone_validation.dart';
import '../../../../../../core/utiliity/validation/validation.dart';
import 'require_label.dart';

//part of 'register_info_form.dart';
//part of 'account_info_section.dart';

class RegisterInfoForm extends StatefulWidget {
  const RegisterInfoForm({
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.emailController,
  });

  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController? emailController;

  @override
  State<RegisterInfoForm> createState() => _RegisterInfoFormState();
}

class _RegisterInfoFormState extends State<RegisterInfoForm> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: const RequiredLabel('Số điện thoại'),
        ),

        const SizedBox(height: 6),
        TextFormField(
          controller: widget.phoneController,
          //decoration: InputDecoration(hintText: context.locale.email),
          decoration: InputDecoration(
            hintText: 'Nhập số điện thoại',
            helperText: '',
          ),
          validator: context.validator.apply([
            RequiredValidation(),
            PhoneValidation(),
          ]),
        ),

        const SizedBox(height: 4),

        Container(
          width: double.infinity,
          child: const RequiredLabel('Mật khẩu'),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Nhập mật khẩu',
            helperText: '',
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
        const SizedBox(height: 4),
        Container(
          width: double.infinity, // 🔥 QUAN TRỌNG
          child: const RequiredLabel('Xác nhận mật khẩu'),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.confirmPasswordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Nhập lại mật khẩu',
            helperText: '',
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
            ConfirmPasswordValidation(
              passwordProvider: () => widget.passwordController.text,
            ),
          ]),
        ),

        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          child: Text(
            'Email',
            style: AppTextStyles.bodyTextSm.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.emailController,
          decoration: InputDecoration(hintText: 'Nhập email'),
          validator: context.validator.apply([EmailValidation()]),
        ),
      ],
    );
  }
}
