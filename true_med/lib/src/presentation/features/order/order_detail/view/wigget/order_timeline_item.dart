import 'package:flutter/material.dart';

import '../../model/mock_order_status_step.dart';

class OrderTimelineItem extends StatelessWidget {
  final OrderStatusStep step;
  final bool isLast;

  const OrderTimelineItem({
    super.key,
    required this.step,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final color = statusColor(step.type, step.isActive);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===== LEFT: ICON + LINE =====
        Column(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: step.isActive
                    ? color.withOpacity(0.15)
                    : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(statusIcon(step.type), color: color, size: 14),
            ),
            if (!isLast)
              Container(width: 2, height: 40, color: Colors.grey.shade300),
          ],
        ),

        const SizedBox(width: 12),

        // ===== RIGHT: TEXT =====
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: step.isActive ? color : Colors.grey,
                  ),
                ),
                if (step.time != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      _format(step.time!),
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _format(DateTime dt) {
    return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}, "
        "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}";
  }
}

IconData statusIcon(OrderStatusType type) {
  switch (type) {
    case OrderStatusType.pending:
      return Icons.access_time;
    case OrderStatusType.confirmed:
      return Icons.receipt_long;
    case OrderStatusType.processing:
      return Icons.calendar_today;
    case OrderStatusType.shipping:
      return Icons.inventory_2;
    case OrderStatusType.delivering:
      return Icons.local_shipping;
    case OrderStatusType.delivered:
    case OrderStatusType.completed:
      return Icons.check;
    case OrderStatusType.cancelled:
      return Icons.close;
  }
}

Color statusColor(OrderStatusType type, bool isActive) {
  if (!isActive) return Colors.grey.shade400;

  switch (type) {
    case OrderStatusType.completed:
      return Colors.green;
    case OrderStatusType.cancelled:
      return Colors.red;
    default:
      return Colors.grey.shade700;
  }
}
