import '../../../core/base/result.dart';
import '../../entities/ward_entity.dart';
import '../../repositories/address_repository.dart';

final class GetWardAllUseCase {
  GetWardAllUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<List<WardResponseEntity>, String>> call() async {
    final result = await repository.getWardAll();

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
