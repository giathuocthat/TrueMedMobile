import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import 'money_section.dart';
import 'product_cart_section.dart';
import 'promotion_section.dart';

Widget ProductCartFooter(
  BuildContext context, {
  required ProductResponseEntity product,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          offset: const Offset(0, -2),
          blurRadius: 10,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ProductCartSection(
        product: product,
        productVariants: product.productVariants?.firstOrNull,
      ),
    ),
  );
}
