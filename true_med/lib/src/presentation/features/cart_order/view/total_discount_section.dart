import 'package:flutter/material.dart';

import '../../../../shared/widget/price_row.dart';

class TotalDiscountSection extends StatelessWidget {
  final String shopId;

  const TotalDiscountSection({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

      color: Colors.white,

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          Icon(Icons.info_outline, size: 16, color: Colors.orange.shade700),
          const SizedBox(width: 6),
          priceRow("Tiết kiệm được", "123.000 đ", 13),
        ],
      ),
    );
  }
}
