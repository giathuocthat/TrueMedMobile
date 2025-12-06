import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../services/cache/cache_service.dart';
import '../services/network/rest_client.dart';

final class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({required this.remote, required this.local});

  final RestClient remote;
  final CacheService local;

  @override
  Future<Result<List<ProductEntity>, Failure>> getProducts() async {
    return asyncGuard(() async {
      final response = await remote.getProducts();

      // response.data is List<ProductModel>
      final products = response.data;

      return products; // ProductModel extends ProductEntity
    });
  }
}
