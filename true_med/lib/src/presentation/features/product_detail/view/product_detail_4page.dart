import 'package:flutter/material.dart';

import 'product_detail_4header.dart';

class ProductDetail4Page extends StatelessWidget {
  final int productId;
  const ProductDetail4Page({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return ProductDetail4Header(
      bannerHeight: 320,

      // banner: Image.network(
      //   "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
      //   fit: BoxFit.cover,
      // ),
      // floatingActions: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     _circleBtn(Icons.arrow_back),
      //     Row(
      //       children: [
      //         _circleBtn(Icons.notifications_none),
      //         const SizedBox(width: 10),
      //         _circleBtn(Icons.shopping_cart_outlined),
      //       ],
      //     ),
      //   ],
      // ),

      // searchBar: Container(
      //   height: 40,
      //   padding: const EdgeInsets.symmetric(horizontal: 12),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(22),
      //   ),
      //   child: Row(
      //     children: const [
      //       Icon(Icons.search, color: Colors.grey),
      //       SizedBox(width: 8),
      //       Text("Tìm kiếm sản phẩm", style: TextStyle(color: Colors.grey)),
      //     ],
      //   ),
      // ),
      searchBar: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: const [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Text("Tìm kiếm", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),

      floatingActions: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _floatingBtn(Icons.arrow_back),

            Row(
              children: [
                _floatingBtn(Icons.notifications_none),
                const SizedBox(width: 10),
                _floatingBtn(Icons.shopping_cart_outlined),
              ],
            ),
          ],
        ),
      ),

      body: [
        _img(),
        const SizedBox(height: 12),
        _img(),
        const SizedBox(height: 12),
        _img(),
        const SizedBox(height: 12),
        _img(),
        const SizedBox(height: 12),
        _img(),
        _img(),
      ],

      // ========================
      //     FOOTER PAYMENT
      // ========================
      footerPayment: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              "131.000đ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  static Widget _circleBtn(IconData icon) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black54),
    );
  }

  static Widget _img() => Image.network(
    "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    height: 280,
    fit: BoxFit.cover,
  );
  static Widget _floatingBtn(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black54),
    );
  }
}
