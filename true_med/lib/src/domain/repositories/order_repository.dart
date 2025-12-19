import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/base_entity.dart';
import '../entities/order_entity.dart';

abstract base class OrderRepository extends Repository {
  Future<Result<BaseObjectResponseEntity<OrderResponseEntity>, Failure>> order(
    OrderRequestEntity request,
  );
}
