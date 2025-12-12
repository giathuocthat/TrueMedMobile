import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product_entity.dart';
import 'quantity_controller.dart';

class QuantityDetailSelector extends ConsumerWidget {
  final int qty;
  final ProductResponseEntity product;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  const QuantityDetailSelector({
    super.key,
    required this.qty,
    this.onIncrease,
    this.onDecrease,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40,
      //width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // (-) button
          _leftButton(
            onTap: onDecrease,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Colors.deepOrange.shade200,
            ),
          ),

          // Divider
          Container(width: 1, color: Colors.deepOrange.shade200),

          Expanded(
            child: Center(child: TextQuantityControl(product: product)),
          ),

          // Divider
          Container(width: 1, color: Colors.deepOrange.shade200),

          // (+) button
          _rightButton(
            onTap: onIncrease,
            child: Icon(Icons.add, size: 22, color: Colors.deepOrange.shade200),
          ),
        ],
      ),
    );
  }

  Widget _segmentButton({required Widget child, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(20),
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
      //child: SizedBox(width: 60, height: 40, child: Center(child: child)),
      child: Container(
        width: 60,
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(22)),
          // gradient: LinearGradient(
          //   colors: [Color(0xFFECA04A), Color(0xFFB6661C)],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          color: Colors.deepOrange,
        ),
        child: const Center(
          child: Icon(Icons.add, size: 22, color: Colors.white),
        ),
      ),
    );
  }

  Widget _rightButton({required Widget child, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(20),
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
      //child: SizedBox(width: 60, height: 40, child: Center(child: child)),
      child: Container(
        width: 60,
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(22)),
          // gradient: LinearGradient(
          //   colors: [Color(0xFFECA04A), Color(0xFFB6661C)],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          color: Colors.deepOrange,
        ),
        child: const Center(
          child: Icon(Icons.add, size: 22, color: Colors.white),
        ),
      ),
    );
  }

  Widget _leftButton({required Widget child, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(20),
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
      //child: SizedBox(width: 60, height: 40, child: Center(child: child)),
      child: Container(
        width: 60,
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(22)),

          color: Colors.black12,
        ),
        child: const Center(
          child: Icon(Icons.remove, size: 22, color: Colors.black),
        ),
      ),
    );
  }
}
