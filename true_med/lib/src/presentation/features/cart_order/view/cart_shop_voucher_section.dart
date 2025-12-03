import 'package:flutter/material.dart';

class CartShopVoucherSection extends StatelessWidget {
  final String shopId;

  const CartShopVoucherSection({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

      color: Colors.white,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4E5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE89A45), width: 1),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_offer, color: Color(0xFFE88939), size: 18),

            const SizedBox(width: 10),

            const Expanded(
              child: Text(
                "Mua thêm 572.903đ để sử dụng mã",
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFFD14F35),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Add button xanh đậm
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Color(0xFF0B4D2C),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
