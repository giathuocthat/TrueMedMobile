import '../../../core/base/result.dart';
import '../../entities/page_entity.dart';
import '../../entities/product_entity.dart';
import '../../entities/product_page_entity.dart';
import '../../repositories/payment_repository.dart';

final class GetProductDetailUseCase {
  GetProductDetailUseCase(this.repository);

  final PaymentRepository repository;

  Future<Result<ProductResponseEntity, String>> call({
    required int productId,
  }) async {
    final result = await repository.getProductDetail(productId.toString());

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
