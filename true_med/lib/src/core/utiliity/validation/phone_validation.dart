import 'package:flutter/material.dart';

import '../../extensions/app_localization.dart';
import 'validation.dart';

class PhoneValidation extends Validation<String> {
  static final _vnPhoneRegex = RegExp(r'^(0|\+84|84)([3|5|7|8|9])[0-9]{8}$');

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.locale.isRequired;
    }

    final phone = value.trim();

    if (!_vnPhoneRegex.hasMatch(phone)) {
      return context.locale.validPhoneNumber;
      //return null;
    }

    return null;
  }
}
