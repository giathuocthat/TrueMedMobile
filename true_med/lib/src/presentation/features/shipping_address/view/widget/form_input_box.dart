import 'package:flutter/material.dart';

class FormInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool requiredField;
  final bool enabled;
  final VoidCallback? onTap;
  final Widget? suffix;

  const FormInputBox({
    super.key,
    required this.controller,
    required this.hintText,
    this.requiredField = false,
    this.enabled = true,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = enabled ? Colors.grey.shade300 : Colors.grey.shade200;
    final textColor = enabled ? Colors.black : Colors.grey.shade400;

    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          readOnly: onTap != null, // 👈 giống SelectBox
          style: TextStyle(fontSize: 13, color: textColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon:
                suffix ??
                (requiredField
                    ? const Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      )
                    : null),
          ),
        ),
      ),
    );
  }
}
