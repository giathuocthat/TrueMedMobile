import '../../core/base/result.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

final class GetProductsUseCase {
  GetProductsUseCase(this.repository);

  final ProductRepository repository;

  Future<Result<List<ProductEntity>, String>> call() async {
    final result = await repository.getProducts();

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
