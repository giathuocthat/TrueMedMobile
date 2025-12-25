import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/extensions/validation.dart';
import '../../../../../../core/utiliity/validation/validation.dart';
import '../../../../shipping_address/view/widget/address_form_section.dart';
import '../../../../shipping_address/view/widget/form_input_box.dart';
import 'require_label.dart';

//part of 'register_info_form.dart';
//part of 'account_info_section.dart';

class AddressInfoForm extends StatefulWidget {
  const AddressInfoForm({
    required this.provinceController,
    required this.wardController,
    required this.streetController,
    required this.onTapProvince,
    required this.onTapWard,
  });

  final TextEditingController provinceController;
  final TextEditingController wardController;
  final TextEditingController streetController;
  final VoidCallback onTapProvince;
  final VoidCallback onTapWard;

  @override
  State<AddressInfoForm> createState() => _AddressInfoFormState();
}

class _AddressInfoFormState extends State<AddressInfoForm> {
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
          child: const RequiredLabel('Địa chỉ'),
        ),

        const SizedBox(height: 6),

        FormInputBox(
          controller: widget.provinceController,
          hintText: "Chọn tỉnh/ thành phố",
          enabled: true,
          onTap: widget.onTapProvince,
          suffix: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Image.asset(
                AppAssets.iconChevronDown,
                width: 16,
                height: 16,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        FormInputBox(
          controller: widget.wardController,
          hintText: "Chọn xã/ phường",
          enabled: false,
          onTap: widget.onTapWard,
          suffix: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Image.asset(
                AppAssets.iconChevronDown,
                width: 16,
                height: 16,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          child: const RequiredLabel('Chi tiết địa chỉ'),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.streetController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(hintText: 'Số nhà, tên đường, tòa nhà'),
          validator: context.validator.apply([
            RequiredValidation(),
            PasswordValidation(minLength: 6),
          ]),
        ),

        //const SizedBox(height: 24),
      ],
    );
  }
}
