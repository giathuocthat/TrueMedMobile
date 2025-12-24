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
  });

  final TextEditingController provinceController;
  final TextEditingController wardController;
  final TextEditingController streetController;

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
        TextFormField(
          controller: widget.provinceController,
          //decoration: InputDecoration(hintText: context.locale.email),
          decoration: InputDecoration(
            hintText: 'Nhập số điện thoại',
            helperText: '',
          ),
          validator: context.validator.apply([RequiredValidation()]),
        ),
        TextFormField(
          controller: widget.provinceController,
          decoration: InputDecoration(
            hintText: 'Tỉnh/Thành phố',
            suffixIcon: GestureDetector(
              onTap: _togglePasswordVisibility,
              child: Container(
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
          ),
        ),
        const SizedBox(height: 14),
        FormInputBox(
          controller: widget.streetController,
          hintText: "Huyện/Quận",
          requiredField: true,
          enabled: true,
          onTap: () {
            // open bottom sheet chọn tỉnh
          },
          suffix: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              AppAssets.iconChevronDown,
              width: 16,
              height: 16,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: SelectBox(
                label: "Phường/Xã",
                value: null,
                requiredField: true,
                enabled: true,
                onCallBak: () {},
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),

        const SizedBox(height: 4),

        Container(
          width: double.infinity,
          child: const RequiredLabel('Mật khẩu'),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.wardController,
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
          controller: widget.streetController,
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
          ]),
        ),

        //const SizedBox(height: 24),
      ],
    );
  }
}
