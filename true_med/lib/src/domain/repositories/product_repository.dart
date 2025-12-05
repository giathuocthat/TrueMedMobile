import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/product_entity.dart';

abstract base class ProductRepository extends Repository {
  Future<Result<List<ProductEntity>, Failure>> getProducts();
}
