import 'package:flutter/material.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../../shared/widget/price_row.dart';

Widget MoneySectionCheckout({
  VoidCallback? onCheckout,
  required String totalMoneyFomart,
  required String totalMoneyDiscountFomart,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "Tổng thanh toán",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "${totalMoneyFomart}",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0B4D2C),
            ),
          ),
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
            "Đặt Hàng",
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

Widget priceRowCheckout(String label, String value, double fontSize) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      const SizedBox(width: 6),
      Text(
        value,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF0B4D2C), // green
        ),
      ),
    ],
  );
}
