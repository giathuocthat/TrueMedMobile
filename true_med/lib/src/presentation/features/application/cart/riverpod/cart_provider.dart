import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cart_notifier.dart';
import 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(),
);

// void setQuantity(ProductEntity product, int qty) {
//   final items = List<CartItemEntity>.from(state.items);
//   final index = items.indexWhere((e) => e.product.id == product.id);

//   if (qty <= 0) {
//     // xoá product khỏi giỏ
//     if (index != -1) {
//       items.removeAt(index);
//     }
//   } else {
//     // thêm mới hoặc cập nhật
//     if (index == -1) {
//       items.add(CartItemEntity(product: product, quantity: qty));
//     } else {
//       items[index] = items[index].copyWith(quantity: qty);
//     }
//   }

//   state = state.copyWith(items: items);
// }
