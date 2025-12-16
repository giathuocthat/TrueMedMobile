import 'package:flutter/material.dart';

import '../../../../../domain/entities/cart_entity.dart';
import 'dashed_divider.dart';
import 'delivery_method_card.dart';
import 'header_product_list.dart';
import 'product_item_card.dart';

class ProductListSheet extends StatelessWidget {
  final int itemCheckouts;
  final List<CartItemEntity> listProducts;

  const ProductListSheet({
    super.key,
    required this.itemCheckouts,
    required this.listProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadeProductListCheckOut(itemCheckouts: itemCheckouts),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: listProducts.length,
            itemBuilder: (context, index) {
              final item = listProducts[index];
              return Column(
                children: [
                  ProductItemCard(item: item),
                  const DashedDivider(),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
          ),
        ),
      ],
    );
  }
}
