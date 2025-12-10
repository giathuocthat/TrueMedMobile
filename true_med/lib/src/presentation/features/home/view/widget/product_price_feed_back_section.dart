import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/product_entity.dart';
import '../../model/product_mock.dart';
import 'product_detail/product_price_row.dart';
import 'product_title.dart';

class PriceFeedbackSection extends StatelessWidget {
  final String unitPrice;

  const PriceFeedbackSection({super.key, required this.unitPrice});

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF3D3D3D);
    const iconColor = Color.fromARGB(
      255,
      129,
      129,
      244,
    ); // xanh tím như thiết kế
    const priceColor = Color(0xFF0B4D2C);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hộp 10 vĩ, mỗi vĩ 10 Viên Nén",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF3D3D3D),
            fontWeight: FontWeight.w500,
          ),
        ),
        // --- Top line: "Bạn thấy giá này?" + icons ---
        const Row(
          children: [
            Text(
              "Bạn thấy giá này?",
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(width: 12),

            // 👍 Hợp lí
            Row(
              children: [
                Icon(Icons.thumb_up_alt_outlined, size: 15, color: iconColor),
                SizedBox(width: 4),
                Text(
                  "Hợp lí",
                  style: TextStyle(fontSize: 15, color: textColor),
                ),
              ],
            ),

            const SizedBox(width: 20),

            // 👎 Cao
            Row(
              children: [
                Icon(Icons.thumb_down_alt_outlined, size: 15, color: iconColor),
                const SizedBox(width: 4),
                const Text(
                  "Cao",
                  style: TextStyle(fontSize: 15, color: textColor),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 10),

        // --- Bottom line: Giá từng viên ---
        Row(
          children: [
            // icon circle with $
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1.3),
              ),
              child: const Icon(
                Icons.attach_money,
                size: 8,
                color: Colors.grey,
              ),
            ),

            const SizedBox(width: 8),

            const Text(
              "Giá mua lẻ trên từng viên ",
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),

            Text(
              unitPrice,
              style: const TextStyle(
                fontSize: 12,
                color: priceColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
