import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_variants_entity.dart';
import '../../presentation/features/application/cart/riverpod/cart_provider.dart';
import 'quantity_detail_selector.dart';

class ProductCartSection extends ConsumerWidget {
  final ProductResponseEntity product;
  final ProductVariantsResponseEntity? productVariants;
  final bool isShowQuantitySelector = false;
  const ProductCartSection({
    super.key,
    required this.product,
    required this.productVariants,
    //this.isShowQuantitySelector = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

            // const Text(
            //   "999 điểm",
            //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            // ),
          ],
        ),
        const SizedBox(height: 6),

        // Quantity selector
        QuantityDetailSelector(
          product: product,
          onIncrease: () => ref.read(cartProvider.notifier).increase(product),
          onDecrease: () => ref.read(cartProvider.notifier).decrease(product),
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
