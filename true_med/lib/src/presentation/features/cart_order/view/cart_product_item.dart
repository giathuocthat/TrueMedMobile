import 'package:flutter/material.dart';

import '../../../../shared/widget/price_section.dart';
import '../../../../shared/widget/quantity_selector.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/product_footer.dart';

class CartProductItem extends StatelessWidget {
  final ProductMock product;
  final int quantity;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onToggle;

  const CartProductItem({
    super.key,
    required this.product,
    this.quantity = 1,
    this.onIncrease,
    this.onDecrease,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: Colors.white,

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkbox
              GestureDetector(
                onTap: onToggle,
                child: Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey.shade400,
                ),
              ),

              const SizedBox(width: 10),

              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
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
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    PriceSection(price: product.price),
                    const SizedBox(height: 2),
                    Text(
                      product.name_stock,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 9,
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

          Row(
            children: [
              const Spacer(),
              Text(
                "Đặt tối đa ${product.stock} sản phẩm",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 10),

              QuantitySelector(
                qty: quantity,
                onIncrease: onIncrease,
                onDecrease: onDecrease,
              ),
            ],
          ),
          const SizedBox(height: 10),
          //const Divider(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
