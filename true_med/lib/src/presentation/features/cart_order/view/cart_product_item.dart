import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/string.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../shared/widget/circle_check_box.dart';
import '../../../../shared/widget/price_section.dart';
import '../../../../shared/widget/quantity_selector.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/product_footer.dart';

class CartProductItem extends ConsumerWidget {
  final ProductResponseEntity product;
  final bool checked;
  final int quantity;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onToggle;

  const CartProductItem({
    super.key,
    required this.product,
    this.checked = false,
    this.quantity = 1,
    this.onIncrease,
    this.onDecrease,
    this.onToggle,
  });
  //sbool get isOutOfStock => product.stock <= 0;
  bool get isOutOfStock => false == 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productVariants = product.productVariants?.firstOrNull;

    final percentPrice =
        productVariants?.price.percentChange(
          productVariants?.originalPrice ?? 0,
        ) ??
        0;

    final grayText = Colors.grey.shade500;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: Colors.white,

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- CHECKBOX (ẩn khi hết hàng) ----------
              if (!isOutOfStock)
                CircleCheckBox(
                  isChecked: ref.watch(
                    cartProvider.select(
                      (state) => state.selectedIds.contains(product.id),
                    ),
                  ),
                  onTap: () {
                    ref.read(cartProvider.notifier).toggleItem(product.id);
                  },
                )
              else
                const SizedBox(width: 24),
              const SizedBox(width: 8),
              // ---------- IMAGE + OUT OF STOCK OVERLAY ----------
              Stack(
                children: [
                  // Ảnh sản phẩm mờ nếu hết hàng
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE6E6E6)),
                    ),
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(8),
                      child: Opacity(
                        opacity: isOutOfStock ? 0.35 : 1.0,
                        child: Image.network(
                          product.thumbnailUrl ?? '',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Overlay “Hết hàng”
                  if (isOutOfStock)
                    Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade600.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "Hết hàng",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 10),

              // Right side info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isOutOfStock ? grayText : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),

                    PriceSection(
                      price: productVariants!.price,
                      isInStock: !isOutOfStock,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product.slug ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 9,
                        color: isOutOfStock ? grayText : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const SizedBox(height: 10),
          if (isOutOfStock)
            Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.orange.shade300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 16,
                        color: Colors.orange.shade700,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Sản phẩm này đã hết hàng",
                        style: TextStyle(
                          color: Colors.orange.shade700,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (!isOutOfStock) ...[
            Row(
              children: [
                const Spacer(),
                Text(
                  "Đặt tối đa ${productVariants!.maxSalesQuantity} sản phẩm",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),

                QuantitySelector(
                  product: product,
                  qty: quantity,
                  onIncrease: onIncrease,
                  onDecrease: onDecrease,
                ),
              ],
            ),
          ],
          //const Divider(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
