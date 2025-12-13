import 'package:flutter/material.dart';

class ProductListSheet extends StatelessWidget {
  const ProductListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const _DragHandle(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Danh sách sản phẩm',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(height: 1),
        const Expanded(
          child: Placeholder(), // List sản phẩm của bạn
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
          ),
        ),
      ],
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
