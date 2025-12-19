import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/cart_entity.dart';
import '../../../../../domain/entities/oder_entity.dart';
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

  // int get totalCartChecked => selectedIds.length;
  // //double get totalMoney => selectedIds.length;

  // int get selectedTotalQuantity => items
  //     .where((e) => selectedIds.contains(e.product.id))
  //     .fold<int>(0, (sum, e) => sum + e.quantity);

  // double get selectedTotalAmount => items
  //     .where((e) => selectedIds.contains(e.product.id))
  //     .fold<double>(
  //       0,
  //       (sum, e) =>
  //           sum + (e.product.productVariants?[0].price ?? 0) * e.quantity,
  //     );
  // List<OrderItemEntity> get checkOutItems {
  //   return items
  //       .where((e) => selectedIds.contains(e.product.id))
  //       .map(
  //         (e) => OrderItemEntity(
  //           quantity: e.quantity,
  //           productVariantId: e.product.productVariants?[0].id ?? 0,
  //         ),
  //       )
  //       .toList();
  // }

  List<CartItemEntity> get checkOutSelectItems {
    return items.where((e) => selectedIds.contains(e.product.id)).toList();
  }

  int get totalCartChecked => selectedIds.length;
  //double get totalMoney => selectedIds.length;

  int get selectedTotalQuantity => items
      .where((e) => selectedIds.contains(e.product.id))
      .fold<int>(0, (sum, e) => sum + e.quantity);

  double get selectedTotalAmount => items
      .where((e) => selectedIds.contains(e.product.id))
      .fold<double>(
        0,
        (sum, e) =>
            sum + (e.product.productVariants?[0].price ?? 0) * e.quantity,
      );
  int get selectedTotalQuantityCheckout => items
      .where((e) => selectedIds.contains(e.product.id))
      .fold<int>(0, (sum, e) => sum + e.quantity);
}
