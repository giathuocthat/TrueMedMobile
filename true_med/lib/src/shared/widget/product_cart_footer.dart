import 'package:flutter/material.dart';

import 'money_section.dart';
import 'product_cart_section.dart';
import 'promotion_section.dart';

Widget ProductCartFooter(BuildContext context) {
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
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ProductCartSection(),
    ),
  );
}
