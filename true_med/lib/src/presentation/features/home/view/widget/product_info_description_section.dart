import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/product_entity.dart';
import '../../model/product_mock.dart';
import 'product_detail/product_price_row.dart';
import 'product_price_feed_back_section.dart';
import 'product_title.dart';

class ProductPromotionSection extends StatefulWidget {
  //  final ProductRequestEntity product;
  final ProductMock product;
  const ProductPromotionSection({super.key, required this.product});

  @override
  State<ProductPromotionSection> createState() =>
      _ProductPromotionSectionState();
}

class _ProductPromotionSectionState extends State<ProductPromotionSection> {
  final PageController _pageController = PageController();
  final List<String> _banners = [
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0B4D2C);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 12),
        //ProductInfoSection(product: productMock),
        ProductTitleRow(
          title: widget.product.name,
          onInfoTap: () {
            // Handle info tap
          },
          onFavoriteTap: () {
            // Handle favorite tap
          },
        ),
      ],
    );
  }
}
