import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/entities/order_item_entity.dart';
import '../../../../domain/entities/order_pricing_entity.dart';
import '../../../../domain/mappers/cart_to_order_item_mapper.dart';
import '../../application/cart/riverpod/cart_provider.dart';

part 'checkout_order_items_provider.g.dart';

@riverpod
List<OrderItemEntity> checkoutOrderItems(Ref ref) {
  final cartState = ref.watch(cartProvider);

  return CartToOrderItemMapper.map(cartState.checkOutSelectItems);
}

@riverpod
OrderPricingEntity checkoutPricing(Ref ref) {
  final cartState = ref.watch(cartProvider);

  final selectedItems = cartState.checkOutSelectItems;

  final subtotal = selectedItems.fold<double>(0, (sum, e) {
    final price = e.product.productVariants?.first.price ?? 0;
    return sum + price * e.quantity;
  });

  return OrderPricingEntity(
    subtotal: subtotal,
    shippingFee: 0,
    discount: 0,
    total: subtotal,
  );
}
