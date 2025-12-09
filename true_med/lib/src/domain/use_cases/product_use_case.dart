import '../../core/base/result.dart';
import '../entities/page_entity.dart';
import '../entities/product_entity.dart';
import '../entities/product_page_entity.dart';
import '../repositories/product_repository.dart';

final class GetProductsUseCase {
  GetProductsUseCase(this.repository);

  final ProductRepository repository;

  Future<Result<List<ProductResponseEntity>, String>> call() async {
    final result = await repository.getProducts();

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

// LOCTB Hard Code
final class Get2ProductsUseCase {
  Get2ProductsUseCase(this.repository);

  final ProductRepository repository;

  Future<Result<List<ProductResponseEntity>, String>> call() async {
    final result = await repository.get2Products();

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class GetProductStoresUseCase {
  GetProductStoresUseCase(this.repository);

  final ProductRepository repository;

  Future<Result<ProductPageResponseEntity, String>> call({
    required int pageNumber,
    required int pageSize,
  }) async {
    // Build query map gửi cho API
    final query = {'pageNumber': pageNumber, 'pageSize': pageSize};

    final result = await repository.getProductStores(query);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
