import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/page_entity.dart';
import '../entities/product_entity.dart';
import '../entities/product_page_entity.dart';

abstract base class ProductRepository extends Repository {
  Future<Result<List<ProductResponseEntity>, Failure>> getProducts();
  // LOCTB Hard Code
  Future<Result<List<ProductResponseEntity>, Failure>> get2Products();

  Future<Result<ProductPageResponseEntity, Failure>> getProductStores(
    Map<String, dynamic> query,
  );

  Future<Result<ProductResponseEntity, Failure>> getProductDetail(String id);
}
