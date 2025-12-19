import '../entities/cart_entity.dart';
import '../entities/order_entity.dart';
import '../entities/order_item_entity.dart';

class CartToOrderItemMapper {
  static List<OrderItemEntity> map(List<CartItemEntity> items) {
    return items.map((e) {
      final variants = e.product.productVariants;
      if (variants == null || variants.isEmpty) {
        throw Exception('Product ${e.product.id} has no variant');
      }

      return OrderItemEntity(
        quantity: e.quantity,
        productVariantId: variants.first.id,
      );
    }).toList();
  }
}
