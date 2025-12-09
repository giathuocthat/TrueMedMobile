import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/cart_entity.dart';
import '../../../../../domain/entities/product_entity.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(<CartItemEntity>[]) List<CartItemEntity> items,
  }) = _CartState;

  const CartState._();

  // int quantityFor(int productId) {
  //   return items
  //       .firstWhere(
  //         (e) => e.product.id == productId,
  //         // orElse: () => CartItemEntity(
  //         //   product: ProductResponseEntity.empty(), // hoặc xử lý khác
  //         //   quantity: 0,
  //         // ),
  //       )
  //       .quantity;
  // }

  int quantityOf(int productId) {
    final item = items.firstWhere(
      (e) => e.product?.id == productId,
      // orElse: () => const CartItemEntity(
      //   product: null, // hoặc tạo CartItemEntity? nullable
      //   quantity: 0,
      // ),
    );
    return item.quantity;
  }

  int get totalQuantity => items.fold<int>(0, (sum, e) => sum + e.quantity);
}
