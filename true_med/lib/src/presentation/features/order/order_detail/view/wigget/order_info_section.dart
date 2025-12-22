import 'package:flutter/material.dart';

import '../../model/mock_order_status_step.dart';
import 'order_timeline.dart';

class OrderInfoSection extends StatefulWidget {
  const OrderInfoSection({super.key});

  @override
  State<OrderInfoSection> createState() => _OrderInfoSectionState();
}

class _OrderInfoSectionState extends State<OrderInfoSection>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoItem('Ngày Mua', '19:13 20/10/2025'),
          _infoItem('Ngày Giao', 'Dự kiến giao hàng T7 23/10/2025'),

          OrderTimeline(steps: stepAll),
          // ===== HEADER =====
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 4),
          Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
