import '../../../core/base/result.dart';
import '../../../data/models/api_response_meta_model.dart';
import '../../repositories/address_repository.dart';

final class DeleteAddressShippingUseCase {
  DeleteAddressShippingUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<ApiResponseMetaModel, String>> call({
    required int addressId,
  }) async {
    final result = await repository.deleteAddressShipping(addressId.toString());

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
