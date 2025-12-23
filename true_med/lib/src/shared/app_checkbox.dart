import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque, // tap dễ
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: value ? AppColors.fgPrimarySolid : Colors.transparent,
          borderRadius: BorderRadius.circular(4), // spacing-xs
          border: Border.all(
            color: AppColors.borderPrimaryCheck, // #D5D7DA
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: value
            ? const Icon(Icons.check, size: 12, color: Colors.white)
            : null,
      ),
    );
  }
}
