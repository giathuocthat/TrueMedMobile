import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/extensions/validation.dart';
import '../../../../../../core/utiliity/validation/validation.dart';
import '../../../../shipping_address/view/widget/form_input_box.dart';
import 'require_label.dart';

class AddressInfoForm extends StatefulWidget {
  const AddressInfoForm({
    required this.provinceController,
    required this.wardController,
    required this.onTapProvince,
    required this.onTapWard,
    required this.isActiveWard,
    required this.streetController,
  });

  final TextEditingController provinceController;
  final TextEditingController wardController;
  final TextEditingController streetController;
  final VoidCallback onTapProvince;
  final VoidCallback onTapWard;
  final bool isActiveWard;
  @override
  State<AddressInfoForm> createState() => _AddressInfoFormState();
}

class _AddressInfoFormState extends State<AddressInfoForm> {
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
          validator: context.validator.apply([RequiredValidation()]),
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
          controller: widget.wardController,
          hintText: "Chọn xã/ phường",
          enabled: widget.isActiveWard,
          onTap: widget.onTapWard,
          validator: context.validator.apply([RequiredValidation()]),
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

        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          child: const RequiredLabel('Chi tiết địa chỉ'),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.streetController,
          decoration: InputDecoration(hintText: 'Số nhà, tên đường, tòa nhà'),
          validator: context.validator.apply([RequiredValidation()]),
        ),
      ],
    );
  }
}
