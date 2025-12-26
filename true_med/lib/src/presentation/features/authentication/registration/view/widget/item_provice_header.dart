import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../domain/enum/app_enums.dart';
import 'idicator.dart';

class ItemProvinceHeaderSection extends StatelessWidget {
  const ItemProvinceHeaderSection({
    super.key,
    required this.state,
    required this.index,
    this.text,
    this.showDot = false,
  });

  final ProvinceHeaderState state;
  final String index;
  final String? text;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Indicator(state: state, index: index, showDot: showDot),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            text ?? _defaultLabel,
            style: AppTextStyles.bodyTextSmBold.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );

    if (state == ProvinceHeaderState.disabled) {
      return Opacity(
        opacity: 0.6,
        child: AbsorbPointer(absorbing: true, child: content),
      );
    }

    return content;
  }

  String get _defaultLabel {
    switch (state) {
      case ProvinceHeaderState.current:
        return 'Tỉnh/Thành phố';
      case ProvinceHeaderState.disabled:
        return 'Xã/ Phường';
      default:
        return '';
    }
  }
}
