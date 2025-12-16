import 'package:flutter/material.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../../domain/entities/cart_entity.dart';

class ProductItemCard extends StatelessWidget {
  final CartItemEntity item;

  const ProductItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final productVariants = item.product.productVariants?.firstOrNull;
    final price = productVariants?.price ?? 0;
    final totalMoney = price * item.quantity;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- IMAGE --------
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
                opacity: 1.0,
                child: Image.network(
                  item.product.thumbnailUrl ?? '',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // -------- INFO --------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.product.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 12),

                InfoRow(label: 'SL đặt:', value: '${item.quantity}'),
                InfoRow(
                  label: 'Giá mua:',
                  value: '${price.toCurrency(true)}',
                  valueColor: const Color(0xFF2E7D32),
                ),
                InfoRow(
                  label: 'Tổng cộng:',
                  value: '${totalMoney.toCurrency(true)}',
                  valueColor: const Color(0xFF1B5E20),
                  bold: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool bold;

  const InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontWeight: bold ? FontWeight.w500 : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
