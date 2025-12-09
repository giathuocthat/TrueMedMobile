import 'package:flutter/material.dart';

import '../../../../domain/entities/product_entity.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

Widget CartProductItemWithSwipe({
  required ProductResponseEntity product,
  required VoidCallback onDelete,
  required Widget child, // nội dung item cũ
}) {
  return Slidable(
    key: ValueKey(product.name),

    endActionPane: ActionPane(
      motion: const DrawerMotion(),
      extentRatio: 0.24, // phần trăm lộ ra của nút delete
      children: [
        SlidableAction(
          onPressed: (_) => onDelete(),
          backgroundColor: const Color(0xFFE53935),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Xóa',
          borderRadius: BorderRadius.circular(0),
        ),
      ],
    ),

    child: child, // item UI bạn đã làm
  );
}
