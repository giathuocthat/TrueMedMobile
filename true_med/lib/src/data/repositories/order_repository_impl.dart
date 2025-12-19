import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../models/base_list_model.dart';
import '../models/base_object_model.dart';
import '../models/order/order_list_item_model.dart';
import '../models/order/order_list_model.dart';
import '../models/order_model.dart';
import '../services/cache/cache_service.dart';
import '../services/network/rest_client.dart';

final class OrderRepositoryImpl extends OrderRepository {
  OrderRepositoryImpl({required this.remote, required this.local});

  final RestClient remote;
  final CacheService local;

  @override
  Future<Result<BaseObjectResponseModel<OrderResponseModel>, Failure>> order(
    OrderRequestEntity request,
  ) {
    return asyncGuard(() async {
      final model = OrderRequestModel.fromEntity(request);

      final response = await remote.order(model.toJson());

      return response.data;
    });
  }

  @override
  Future<Result<BaseObjectResponseModel<OrderListResponseModel>, Failure>>
  listOrder(Map<String, dynamic> query) async {
    return asyncGuard(() async {
      final response = await remote.listOrder(query);

      final orders = response.data;

      return orders;
    });
  }
}
