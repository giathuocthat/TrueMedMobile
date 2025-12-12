import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/product_entity.dart';
import '../../../../../shared/widget/voucher_tag.dart';
import '../../../../../shared/widget/voucher_ticket.dart';
import '../../model/product_mock.dart';
import 'product_detail/product_price_row.dart';
import 'product_price_feed_back_section.dart';
import 'product_title.dart';
import 'product_voucher_section.dart';

class ProductPromotionSection extends StatefulWidget {
  const ProductPromotionSection({super.key});

  @override
  State<ProductPromotionSection> createState() =>
      _ProductPromotionSectionState();
}

class _ProductPromotionSectionState extends State<ProductPromotionSection> {
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            const Expanded(
              child: Text(
                'Mã giảm giá có thể sử dụng',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ICON HEART ❤️
            GestureDetector(
              onTap: null,
              child: const Icon(
                Icons.chevron_right,
                size: 24,
                color: Colors.black54,
              ),
            ),
          ],
        ),

        const ProductVoucherSection(
          items: [
            "GIẢM 10%",
            "GIẢM 10% Tói đa 200K",
            "GIẢM 20K",
            "GIẢM 15%",
            "GIẢM 5%",
            "GIẢM 15%",
            "GIẢM 50% Tói đa 100K",
          ],
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}
