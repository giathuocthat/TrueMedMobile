import 'package:flutter/material.dart';

import '../../../../../../core/extensions/validation.dart';
import '../../../../../../core/utiliity/validation/phone_validation.dart';
import '../../../../../../core/utiliity/validation/validation.dart';
import 'require_label.dart';

class LoginOTPInfoForm extends StatefulWidget {
  const LoginOTPInfoForm({required this.phoneController});

  final TextEditingController phoneController;
  @override
  State<LoginOTPInfoForm> createState() => _LoginOTPInfoFormState();
}

class _LoginOTPInfoFormState extends State<LoginOTPInfoForm> {
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
          decoration: InputDecoration(
            hintText: 'Nhập số điện thoại',
            helperText: '',
          ),
          validator: context.validator.apply([
            RequiredValidation(),
            PhoneValidation(),
          ]),
        ),
      ],
    );
  }
}
