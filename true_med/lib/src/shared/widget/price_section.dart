import 'package:flutter/material.dart';

import '../../core/extensions/string.dart';

Widget PriceSection({
  required double price,
  required bool isInStock,
  double? oldPrice,
  int? discountPercent,
  bool showTrendDown = false,
  bool showTrendUp = false, // optional
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (showTrendDown && isInStock)
        Icon(Icons.trending_down, color: const Color(0xFF4450C8), size: 22),

      if (showTrendUp && isInStock)
        Icon(Icons.trending_up, color: const Color(0xFFE53935), size: 22),

      if (showTrendDown || showTrendUp) const SizedBox(width: 6),

      // --- PRICE NEW ---
      Text(
        price.toCurrency(true),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: isInStock
              ? const Color(0xFF0B4D2C)
              : Colors
                    .grey
                    .shade500, // màu xám khi hết hàng, // màu xanh khi còn hàng
        ),
      ),

      const SizedBox(width: 8),

      // --- OLD PRICE ---
      if (oldPrice != null)
        Text(
          oldPrice.toCurrency(true),
          style: TextStyle(
            fontSize: 11,
            color: isInStock
                ? Colors
                      .grey
                      .shade500 // xám nhạt hơn
                : Colors.grey.shade400,
            decoration: TextDecoration.lineThrough,
          ),
        ),

      const SizedBox(width: 8),

      // --- DISCOUNT BADGE ---
      if (discountPercent != null && isInStock)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            color: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "-$discountPercent%",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ),
    ],
  );
}
