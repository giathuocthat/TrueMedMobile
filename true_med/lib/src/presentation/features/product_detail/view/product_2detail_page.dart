import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../data/models/product_model.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../shared/widget/payment_footer.dart';
import '../../../../shared/widget/product_cart_footer.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../cart_order/model/cart_oder_mock.dart';
import '../../cart_order/view/cart_product_item.dart';
import '../../cart_order/view/cart_product_item_swipe.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/banner_carousel.dart';
import '../../home/view/widget/html_section.dart';
import '../../home/view/widget/product_banner_carousel.dart';
import '../../home/view/widget/product_price_feed_back_section.dart';
import '../../home/view/widget/product_info_section.dart';
import '../../home/view/widget/product_promotion_header.dart';
import '../../home/view/widget/product_promotion_section.dart';
import 'product_detail_3header.dart';
import 'product_detail_header.dart';

class Product2DetailPage extends StatelessWidget {
  final int productId;

  const Product2DetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetail3Header(
        fadeHeight: 140,

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

        banner: Column(
          children: [
            _img(),
            const SizedBox(height: 12),
            _img(),
            const SizedBox(height: 12),
            _img(),
            const SizedBox(height: 12),
            _img(),
            const SizedBox(height: 12),
            _img(),
          ],
        ),
        // ========================
        //     FOOTER PAYMENT
        // ========================
        // footerPayment: Container(
        //   height: 100,
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: Row(
        //     children: [
        //       const Text(
        //         "131.000đ",
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.green,
        //         ),
        //       ),
        //       const Spacer(),
        //     ],
        //   ),
        // ),
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
        ],
      ),
    );
  }

  Widget _img() => Image.network(
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

class Product3DetailPage extends StatelessWidget {
  final int productId;

  const Product3DetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetail3Header(
        fadeHeight: 140,

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

        floatingActions: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _btn(Icons.arrow_back),
            Row(
              children: [
                _btn(Icons.notifications_none),
                const SizedBox(width: 10),
                _btn(Icons.shopping_cart_outlined),
              ],
            ),
          ],
        ),

        banner: Column(
          children: [
            _img(),
            const SizedBox(height: 12),
            _img(),
            const SizedBox(height: 12),
            _img(),
          ],
        ),
        body: [],
        // ========================
        //     FOOTER PAYMENT
        // ========================
        // footerPayment: Container(
        //   height: 100,
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: Row(
        //     children: [
        //       const Text(
        //         "131.000đ",
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.green,
        //         ),
        //       ),
        //       const Spacer(),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget _img() => Image.network(
    "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    height: 280,
    width: double.infinity,
    fit: BoxFit.cover,
  );

  static Widget _btn(IconData icon) {
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
