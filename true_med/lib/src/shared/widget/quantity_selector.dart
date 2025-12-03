import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int qty;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  const QuantitySelector({
    super.key,
    required this.qty,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // (-) button
          _segmentButton(
            onTap: onDecrease,
            child: const Icon(Icons.remove, size: 20, color: Colors.black),
          ),

          // Divider
          Container(width: 1, color: Colors.grey.shade300),

          // Center part: cart icon + qty
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 20,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 6),
                Text(
                  "$qty",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(width: 1, color: Colors.grey.shade300),

          // (+) button
          _segmentButton(
            onTap: onIncrease,
            child: const Icon(Icons.add, size: 22, color: Color(0xFF0B4D2C)),
          ),
        ],
      ),
    );
  }

  Widget _segmentButton({required Widget child, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(width: 40, height: 38, child: Center(child: child)),
    );
  }
}
