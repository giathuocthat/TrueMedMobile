import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../domain/entities/bussiness_type_entity.dart';
import '../model/mock_data.dart';
import 'radio_icon.dart';

class BussinessTypeItem extends StatelessWidget {
  final BussinessTypeResponseEntity item;
  final bool selected;
  final VoidCallback onTap;

  const BussinessTypeItem({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 56, // 👈 giữ item đều chiều cao
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: selected ? 2 : 1,
              color: selected ? AppColors.borderFocus : AppColors.gray200,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // ⭐ rất quan trọng
            children: [
              // radio
              RadioIcon(selected: selected),

              const SizedBox(width: 8),

              Text(
                item.name,
                style: AppTextStyles.bodyTextSmMedium.copyWith(
                  color: AppColors.textSecondary700,
                ),
                softWrap: false, // giống thiết kế
              ),
            ],
          ),
        ),
      ),
    );
  }
}
