import 'package:flutter/material.dart';

import '../../../../../domain/entities/product_entity.dart';
import '../../../../../shared/widget/quantity_controller.dart';

class ProductFooter extends StatelessWidget {
  final int quantity;
  final ProductResponseEntity product;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductFooter({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(height: 1, color: Colors.grey.shade300),
            Row(
              children: [
                // LEFT (-)
                SizedBox(
                  width: 44,
                  child: Center(
                    child: IconButton(
                      onPressed: onRemove,
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.grey,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),

                // DIVIDER
                Container(width: 1, height: 42, color: Colors.grey.shade300),

                // MIDDLE (cart + quantity)
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        // const SizedBox(width: 6),
                        // Text(
                        //   "$quantity",
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.grey.shade700,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        TextQuantityControl(product: product),
                      ],
                    ),
                  ),
                ),

                // DIVIDER
                Container(width: 1, height: 42, color: Colors.grey.shade300),

                // RIGHT (+)
                SizedBox(
                  width: 44,
                  child: Center(
                    child: IconButton(
                      onPressed: onAdd,
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF006633),
                        size: 22,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
