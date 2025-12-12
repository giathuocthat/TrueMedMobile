import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/cart_entity.dart';
import '../../../../domain/entities/product_entity.dart';
import 'riverpod/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void increase(ProductResponseEntity product) {
    final list = List<CartItemEntity>.from(state.items);
    final index = list.indexWhere((e) => e.product.id == product.id);

    if (index == -1) {
      list.add(CartItemEntity(product: product, quantity: 1));
    } else {
      final item = list[index];
      list[index] = item.copyWith(quantity: item.quantity + 1);
    }

    state = state.copyWith(items: list);
  }

  void decrease(ProductResponseEntity product) {
    final list = List<CartItemEntity>.from(state.items);
    final index = list.indexWhere((e) => e.product.id == product.id);

    if (index == -1) return;

    final item = list[index];
    if (item.quantity <= 1) {
      list.removeAt(index);
    } else {
      list[index] = item.copyWith(quantity: item.quantity - 1);
    }

    state = state.copyWith(items: list);
  }

  void setQuantity(ProductResponseEntity product, int qty) {
    const maxQty = 9999;
    qty = qty.clamp(0, maxQty);

    final items = List<CartItemEntity>.from(state.items);
    final index = items.indexWhere((e) => e.product?.id == product.id);

    if (qty == 0) {
      if (index != -1) items.removeAt(index);
    } else {
      if (index == -1) {
        items.add(CartItemEntity(product: product, quantity: qty));
      } else {
        items[index] = items[index].copyWith(quantity: qty);
      }
    }

    state = state.copyWith(items: items);
  }

  void remove(ProductResponseEntity product) => setQuantity(product, 0);

  void toggleItem(int productId) {
    final selected = Set<int>.from(state.selectedIds);

    if (selected.contains(productId)) {
      selected.remove(productId);
    } else {
      selected.add(productId);
    }

    state = state.copyWith(selectedIds: selected);
  }

  void toggleSelectAll() {
    final allIds = state.items.map((e) => e.product.id).toSet();

    final isAllSelected = state.selectedIds.length == allIds.length;

    state = state.copyWith(selectedIds: isAllSelected ? {} : allIds);
  }

  bool isSelected(int productId) {
    return state.selectedIds.contains(productId);
  }

  bool get isAllSelected {
    return state.items.isNotEmpty &&
        state.selectedIds.length == state.items.length;
  }
}
