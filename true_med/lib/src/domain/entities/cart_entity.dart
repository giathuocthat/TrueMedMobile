import 'product_entity.dart';

interface class CartItemEntity {
  const CartItemEntity({required this.product, required this.quantity});

  final ProductResponseEntity product;
  final int quantity;

  CartItemEntity copyWith({ProductResponseEntity? product, int? quantity}) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

// class CartItemRequestEntity extends CartItemEntity {}

// class CartItemResponseEntity extends CartItemEntity {
//   CartItemResponseEntity({required this.product, required this.quantity});

//   final ProductResponseEntity product;
//   final int quantity;
// }
