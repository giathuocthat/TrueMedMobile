import 'package:flutter/material.dart';

import 'price_row.dart';

Widget MoneySection({VoidCallback? onCheckout}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          priceRow("Tạm tính:", "123.000đ", 13),
          const SizedBox(height: 2),
          priceRow("Tổng giảm giá:", "10.000đ", 11),
        ],
      ),
      const SizedBox(width: 12),

      // Right: Buy button
      SizedBox(
        height: 44,
        width: 140,
        child: ElevatedButton(
          onPressed: onCheckout ?? () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B4D2C),
            padding: const EdgeInsets.symmetric(horizontal: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Mua Hàng",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
