import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../../domain/entities/product_entity.dart';
import '../../../../../domain/entities/product_variants_entity.dart';
import '../../model/product_mock.dart';
import '../price_profit_row.dart';
import 'product_detail/product_price_row.dart';
import 'product_price_feed_back_section.dart';
import 'product_title.dart';

class ProductInfoSection extends StatefulWidget {
  final ProductResponseEntity product;
  const ProductInfoSection({super.key, required this.product});

  @override
  State<ProductInfoSection> createState() => _ProductInfoSectionState();
}

class _ProductInfoSectionState extends State<ProductInfoSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productVariants = widget.product.productVariants?.firstOrNull;

    const green = Color(0xFF0B4D2C);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: _buildContent(productVariants),
    );
  }

  Widget _buildContent(ProductVariantsResponseEntity? productVariants) {
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

        ProductPriceRow(
          priceFormat: productVariants?.price.toCurrency(true) ?? '',
          oldPriceFormat: productVariants?.originalPrice.toDouble().toCurrency(
            true,
          ),
          //badgeIcon: 'assets/icons/badge_discount_orange.png',
        ),
        const SizedBox(height: 4),
        const ProfitPriceWidget(),
        const SizedBox(height: 4),
        PriceFeedbackSection(
          unitPrice: "999,999 đ",
          slug: widget.product.slug ?? '',
        ),

        //const SizedBox(height: 12),
        const SizedBox(height: 12),
      ],
    );
  }
}
