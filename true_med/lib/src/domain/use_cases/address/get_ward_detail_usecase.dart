import '../../../core/base/result.dart';
import '../../entities/ward_detail_entity.dart';
import '../../repositories/address_repository.dart';

final class GetWardDetailUseCase {
  GetWardDetailUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<WardDetailResponseEntity, String>> call({
    required int wardId,
  }) async {
    final result = await repository.getWardDetail(wardId.toString());

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
