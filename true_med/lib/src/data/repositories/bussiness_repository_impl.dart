import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/base_entity.dart';
import '../../domain/entities/bussiness_type_entity.dart';
import '../../domain/entities/order/order_list_entity.dart';
import '../services/cache/cache_service.dart';
import '../services/network/rest_client.dart';
import '../../domain/repositories/bussiness_repository.dart';

final class BussinessRepositoryImpl extends BussinessRepository {
  BussinessRepositoryImpl({required this.remote, required this.local});

  final RestClient remote;
  final CacheService local;

  @override
  Future<Result<BaseListResponseEntity<BussinessTypeResponseEntity>, Failure>>
  getListBussinessType(Map<String, dynamic> query) async {
    return asyncGuard(() async {
      final response = await remote.listBussinessType(query);

      final bussinessTypes = response.data;

      return bussinessTypes;
    });
  }
}
