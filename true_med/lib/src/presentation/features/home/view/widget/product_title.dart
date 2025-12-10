import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/product_entity.dart';
import '../../model/product_mock.dart';

class ProductTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback? onInfoTap;
  final VoidCallback? onFavoriteTap;

  const ProductTitleRow({
    super.key,
    required this.title,
    this.onInfoTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TITLE
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // ICON ?
        GestureDetector(
          onTap: onInfoTap,
          child: const Icon(
            Icons.help_outline,
            size: 24,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 12),

        // ICON HEART ❤️
        GestureDetector(
          onTap: onFavoriteTap,
          child: const Icon(
            Icons.favorite_border,
            size: 24,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
