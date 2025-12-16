import 'package:flutter/material.dart';

import 'required_text_field.dart';

class AddressFormSection extends StatelessWidget {
  final String? province;
  final String? ward;
  final VoidCallback? onProvinceTap;
  final VoidCallback? onWardTap;

  final TextEditingController streetController;

  const AddressFormSection({
    super.key,
    this.province,
    this.ward,
    this.onProvinceTap,
    this.onWardTap,
    required this.streetController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- TITLE ----------
          const Text(
            "Địa chỉ",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          // ---------- Province + WARD ----------
          Row(
            children: [
              Expanded(
                child: _SelectBox(
                  label: "Tỉnh/Thành phố",
                  value: province,
                  requiredField: province != null ? false : true,
                  enabled: true,
                  onCallBak: onProvinceTap,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SelectBox(
                  label: "Phường/Xã",
                  value: ward,
                  requiredField: ward != null ? false : true,
                  enabled: province != null,
                  onCallBak: onWardTap,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ---------- STREET ---------
          RequiredTextField(
            controller: streetController,
            hintText: "Nhập tên đường, số nhà",
          ),
        ],
      ),
    );
  }
}

class _SelectBox extends StatelessWidget {
  final String label;
  final String? value;
  final bool requiredField;
  final bool enabled;
  final VoidCallback? onCallBak;

  const _SelectBox({
    required this.label,
    this.value,
    this.requiredField = false,
    this.enabled = true,
    this.onCallBak,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = enabled ? Colors.black : Colors.grey.shade400;

    return GestureDetector(
      onTap: enabled ? onCallBak : null,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: enabled ? Colors.grey.shade300 : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: value ?? label,
                  style: TextStyle(
                    fontSize: 13,
                    color: value != null ? textColor : Colors.grey,
                  ),
                  children: requiredField
                      ? const [
                          TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            Icon(
              Icons.unfold_more,
              size: 20,
              color: enabled ? Colors.indigo.shade700 : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}

class _InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool requiredField;

  const _InputBox({
    required this.controller,
    required this.hintText,
    this.requiredField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      //padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: requiredField
              ? const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                )
              : null,
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
