import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../model/mock_data.dart';
import 'radio_icon.dart';

class BusinessTypeItem extends StatelessWidget {
  final BusinessType item;
  final bool selected;
  final VoidCallback onTap;

  const BusinessTypeItem({
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
              // Container(
              //   width: 16,
              //   height: 16,

              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     border: Border.all(
              //       color: selected ? AppColors.borderFocus : AppColors.gray200,
              //       width: 2,
              //     ),
              //   ),
              //   child: selected
              //       ? Center(
              //           child: Container(
              //             width: 10,
              //             height: 10,
              //             decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: AppColors.borderFocus,
              //             ),
              //           ),
              //         )
              //       : null,
              // ),
              const SizedBox(width: 8),

              // text
              // Text(
              //   item.name,
              //   maxLines: 2,
              //   style: AppTextStyles.bodyTextSmMedium.copyWith(
              //     color: AppColors.textSecondary700,
              //   ),
              // ),
              // ---------- TEXT (BẮT BUỘC Expanded) ----------
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
