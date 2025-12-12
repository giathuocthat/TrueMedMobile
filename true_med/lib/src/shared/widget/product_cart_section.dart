import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_variants_entity.dart';
import 'quantity_detail_selector.dart';

class ProductCartSection extends StatelessWidget {
  final ProductResponseEntity product;
  final ProductVariantsResponseEntity? productVariants;
  final bool isShowQuantitySelector = true;
  const ProductCartSection({
    super.key,
    required this.product,
    required this.productVariants,
    //this.isShowQuantitySelector = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Đặt tối đa ${productVariants?.maxSalesQuantity ?? 0} sản phẩm",
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),

            const Spacer(),

            const Text(
              "999 điểm",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Quantity selector
        QuantityDetailSelector(
          product: product,
          qty: 0,
          onIncrease: null,
          onDecrease: null,
        ),

        const SizedBox(height: 12),

        if (isShowQuantitySelector) ...[
          const Row(
            children: [
              // icon circle with $
              Icon(Icons.shopping_cart, size: 14, color: Colors.grey),
              SizedBox(width: 6),
              Text(
                "999 ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Lượt mua trong 24h",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
