import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.orderCode,
    required this.statusText,
    required this.statusColor,
    required this.productCount,
    required this.totalQuantity,
    required this.totalPrice,
    required this.timeText,
  });

  final String orderCode;
  final String statusText;
  final Color statusColor;
  final int productCount;
  final int totalQuantity;
  final String totalPrice;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          Row(
            children: [
              Text(
                '#$orderCode',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    timeText,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade300, height: 1),
          const SizedBox(height: 12),

          // ===== STATUS =====
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: statusColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ===== INFO =====
          Text(
            'Sản phẩm: $productCount - Tổng SL: $totalQuantity',
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),

          const SizedBox(height: 6),

          // ===== PRICE =====
          Text(
            totalPrice,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
