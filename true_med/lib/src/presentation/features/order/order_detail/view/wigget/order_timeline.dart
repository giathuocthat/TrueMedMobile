import 'package:flutter/material.dart';

import '../../model/mock_order_status_step.dart';
import 'order_timeline_item.dart';

class OrderTimeline extends StatelessWidget {
  final List<OrderStatusStep> steps;

  const OrderTimeline({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
        (index) => OrderTimelineItem(
          step: steps[index],
          isLast: index == steps.length - 1,
        ),
      ),
    );
  }
}
