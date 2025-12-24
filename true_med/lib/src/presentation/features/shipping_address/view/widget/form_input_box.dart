import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class FormInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final VoidCallback? onTap;
  final Widget suffix;

  const FormInputBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffix,
    this.enabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = enabled ? Colors.white : Colors.grey.withOpacity(0.05);
    final borderColor = enabled
        ? AppColors.borderPrimary
        : AppColors.borderPrimary;
    final textColor = enabled ? Colors.black : Colors.grey.shade400;
    //border: OutlineInputBorder(
    //   borderRadius: _borderRadius,
    //   borderSide: const BorderSide(width: 1, color: AppColors.borderPrimary),
    // ),
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        readOnly: onTap != null, // 👈 giống SelectBox
        style: AppTextStyles.bodyTextSm.copyWith(color: textColor),
        decoration: InputDecoration(
          hintText: hintText,
          //hintStyle: TextStyle(color: Colors.grey),
          hintStyle: AppTextStyles.bodyTextSm.copyWith(
            color: AppColors.textPlaceholder,
          ),
          // 🔥 BACKGROUND
          filled: true,
          fillColor: bgColor,
          //border: InputBorder.none,
          // contentPadding: const EdgeInsets.symmetric(
          //   vertical: 10,
          //   horizontal: 14,
          // ),
          suffixIcon: suffix, // SỬ DỤNG suffixIcon ĐỂ ĐẢM BẢO KÍCH THƯỚC CHUẨN
          suffixIconConstraints: const BoxConstraints(
            minWidth: 44,
            minHeight: 44,
          ),
        ),
      ),
    );
  }
}
