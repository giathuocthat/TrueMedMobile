import 'package:flutter/material.dart';

class HeadeProductListCheckOut extends StatelessWidget {
  final int itemCheckouts;

  const HeadeProductListCheckOut({required this.itemCheckouts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Danh sách sản phẩm',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Text('Số lượng: $itemCheckouts', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
