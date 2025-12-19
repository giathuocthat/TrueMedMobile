import '../../data/models/order_item_model.dart';

class OrderItemEntity {
  OrderItemEntity({required this.productVariantId, required this.quantity});

  final int productVariantId;
  final int quantity;
}

class OrderItemResponseEntity {
  OrderItemResponseEntity({
    required this.id,
    required this.productVariantId,
    required this.productId,
    required this.productName,
    required this.variantSKU,
    required this.quantity,
    required this.unitPrice,
    required this.totalLineAmount,
  });

  final int id;
  final int productVariantId;
  final int productId;
  final String productName;
  final String variantSKU;
  final int quantity;
  final double unitPrice;
  final double totalLineAmount;
}
