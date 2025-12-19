import 'package:dart_mappable/dart_mappable.dart';

import '../../../domain/entities/order/order_list_entity.dart';
import '../page_model.dart';
import 'order_list_item_model.dart';

part 'order_list_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class OrderListResponseModel extends OrderListResponseEntity
    with OrderListResponseModelMappable {
  OrderListResponseModel({
    required List<OrderListItemResponseModel> data,
    required PageResponseModel pagination,
  }) : super(data: data, pagination: pagination);

  static const fromJson = OrderListResponseModelMapper.fromJson;
}
