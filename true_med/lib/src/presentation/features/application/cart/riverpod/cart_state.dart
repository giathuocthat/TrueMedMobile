import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/cart_entity.dart';
import '../../../../../domain/entities/product_entity.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(<CartItemEntity>[]) List<CartItemEntity> items,
    //@Default(<int>[]) List<int> selectedIds,
    @Default(<int>{}) Set<int> selectedIds,
  }) = _CartState;

  const CartState._();

  int quantityOf(int productId) {
    final list = items.where((e) => e.product?.id == productId);
    if (list.isEmpty) return 0;
    return list.first.quantity;
  }

  int get totalQuantity => items.fold<int>(0, (sum, e) => sum + e.quantity);
}
