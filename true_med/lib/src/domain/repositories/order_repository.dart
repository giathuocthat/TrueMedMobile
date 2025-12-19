import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/base_entity.dart';
import '../entities/order/order_list_entity.dart';
import '../entities/order_entity.dart';
import '../entities/order/order_list_item_entity.dart';

abstract base class OrderRepository extends Repository {
  Future<Result<BaseObjectResponseEntity<OrderResponseEntity>, Failure>> order(
    OrderRequestEntity request,
  );

  Future<Result<BaseObjectResponseEntity<OrderListResponseEntity>, Failure>>
  listOrder(Map<String, dynamic> query);
}
