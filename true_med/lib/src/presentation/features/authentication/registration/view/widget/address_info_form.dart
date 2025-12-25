import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../shipping_address/view/widget/form_input_box.dart';
import 'require_label.dart';

class AddressInfoForm extends StatelessWidget {
  const AddressInfoForm({
    required this.provinceController,
    required this.wardController,
    required this.onTapProvince,
    required this.onTapWard,
    required this.isActiveWard,
  });

  final TextEditingController provinceController;
  final TextEditingController wardController;
  final VoidCallback onTapProvince;
  final VoidCallback onTapWard;
  final bool isActiveWard;

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
          controller: provinceController,
          hintText: "Chọn tỉnh/ thành phố",
          enabled: true,
          onTap: onTapProvince,
          suffix: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(14),
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
          controller: wardController,
          hintText: "Chọn xã/ phường",
          enabled: isActiveWard,
          onTap: onTapWard,
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

        //const SizedBox(height: 24),
      ],
    );
  }
}
