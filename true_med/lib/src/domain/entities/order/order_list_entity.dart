import '../page_entity.dart';
import 'order_list_item_entity.dart';

interface class OrderListEntity {}

class OrderListResponseEntity extends OrderListEntity {
  OrderListResponseEntity({required this.data, required this.pagination});

  final List<OrderListItemResponseEntity> data;
  final PageResponseEntity pagination;
}
