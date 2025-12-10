import 'dart:math';

import 'package:flutter/material.dart';

class ProductPriceRow extends StatelessWidget {
  final double price;
  final double? oldPrice;
  final String? badgeIcon; // asset icon màu cam, tùy chọn

  const ProductPriceRow({
    super.key,
    required this.price,
    this.oldPrice,
    this.badgeIcon,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0B4D2C);
    const grey = Color(0xFF9E9E9E);

    return Row(
      children: [
        // Giá mới + icon màu cam
        Row(
          children: [
            Text(
              "${price.toStringAsFixed(0)}đ",
              style: const TextStyle(
                fontSize: 22,
                color: green,
                fontWeight: FontWeight.w700,
              ),
            ),
            //const Icon(Icons.favorite_border, size: 24, color: Colors.black54),
            if (badgeIcon != null) ...[
              const SizedBox(width: 6),
              Image.asset(
                badgeIcon!,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ] else ...[
              const SizedBox(width: 6),
              const Icon(
                Icons.confirmation_number,
                size: 20,
                color: Colors.orange,
              ),
            ],
          ],
        ),

        const Spacer(),

        // Giá cũ (nếu có)
        if (oldPrice != null)
          Text(
            "${oldPrice!.toStringAsFixed(0)}đ",
            style: const TextStyle(
              fontSize: 18,
              color: grey,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2,
            ),
          ),
      ],
    );
  }
}
