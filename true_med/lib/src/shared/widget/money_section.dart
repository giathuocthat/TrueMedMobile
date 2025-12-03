import 'package:flutter/material.dart';

Widget MoneySection({VoidCallback? onCheckout}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _priceRow("Tạm tính:", "123.000đ", 13),
          const SizedBox(height: 2),
          _priceRow("Tổng giảm giá:", "10.000đ", 11),
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

// --------------------- Helper Widget ---------------------

Widget _priceRow(String label, String value, double fontSize) {
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
