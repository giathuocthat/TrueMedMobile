import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/oder_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../models/api_response_meta_model.dart';
import '../models/order_model.dart';
import '../services/cache/cache_service.dart';
import '../services/network/rest_client.dart';

final class OrderRepositoryImpl extends OrderRepository {
  OrderRepositoryImpl({required this.remote, required this.local});

  final RestClient remote;
  final CacheService local;

  @override
  Future<Result<ApiResponseMetaModel, Failure>> order(
    OrderRequestEntity request,
  ) {
    return asyncGuard(() async {
      final model = OrderRequestModel.fromEntity(request);

      final response = await remote.order(model.toJson());

      return response.data;
    });
  }
}
