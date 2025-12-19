import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/order_item_entity.dart';
part 'order_item_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.encode)
class OrderItemRequestModel with OrderItemRequestModelMappable {
  OrderItemRequestModel({
    required this.productVariantId,
    required this.quantity,
  });

  final int productVariantId;
  final int quantity;

  factory OrderItemRequestModel.fromEntity(OrderItemEntity entity) {
    return OrderItemRequestModel(
      productVariantId: entity.productVariantId,
      quantity: entity.quantity,
    );
  }
}

@MappableClass(generateMethods: GenerateMethods.decode)
class OrderItemResponseModel extends OrderItemResponseEntity
    with OrderItemResponseModelMappable {
  OrderItemResponseModel({
    required super.id,
    required super.productVariantId,
    required super.productId,
    required super.productName,
    required super.variantSKU,
    required super.quantity,
    required super.unitPrice,
    required super.totalLineAmount,
  });

  static const fromJson = OrderItemResponseModelMapper.fromJson;
}
