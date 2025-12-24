import 'package:flutter/material.dart';

import '../../extensions/app_localization.dart';
import 'validation.dart';

class ConfirmPasswordValidation extends Validation<String> {
  ConfirmPasswordValidation({required this.passwordProvider});

  final String Function() passwordProvider;

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final password = passwordProvider();

    if (value != password) {
      return context.locale.passwordNotMatchValidation;
    }

    return null;
  }
}
