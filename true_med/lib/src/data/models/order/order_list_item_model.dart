import 'package:dart_mappable/dart_mappable.dart';

import '../../../domain/entities/order/order_list_item_entity.dart';

part 'order_list_item_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class OrderListItemResponseModel extends OrderListItemResponseEntity
    with OrderListItemResponseModelMappable {
  OrderListItemResponseModel({
    required super.id,
    required super.orderNumber,
    required super.customerName,
    required super.customerPhone,
    super.customerEmail,
    required super.createdDate,
    required super.orderStatus,
    required super.paymentStatus,
    required super.totalAmount,
  });

  static const fromJson = OrderListItemResponseModelMapper.fromJson;
}
