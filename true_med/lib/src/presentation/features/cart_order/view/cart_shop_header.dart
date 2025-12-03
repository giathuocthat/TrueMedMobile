import 'package:flutter/material.dart';

class CartShopHeader extends StatelessWidget {
  final String logoUrl;
  final String shopName;
  final bool checked;
  final VoidCallback? onToggle;
  final VoidCallback? onEdit;

  const CartShopHeader({
    super.key,
    required this.logoUrl,
    required this.shopName,
    this.checked = false,
    this.onToggle,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Icon(
              checked ? Icons.check_box : Icons.check_box_outline_blank,
              color: checked ? Colors.orange : Colors.grey.shade400,
            ),
          ),

          const SizedBox(width: 8),

          Image.network(logoUrl, height: 18, width: 18),
          const SizedBox(width: 6),

          Expanded(
            child: Text(
              shopName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          //const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }
}
