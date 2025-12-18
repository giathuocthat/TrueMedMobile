import '../../../core/base/result.dart';
import '../../../data/models/api_response_meta_model.dart';
import '../../entities/address_shipping_entity.dart';
import '../../entities/base_entity.dart';
import '../../repositories/address_repository.dart';

final class DefaultAddressShippingUseCase {
  DefaultAddressShippingUseCase(this.repository);

  final AddressRepository repository;

  Future<
    Result<BaseObjectResponseEntity<AddressShippingResponseEntity>, String>
  >
  call({required int customerId}) async {
    final result = await repository.defaultAddressShipping(
      customerId.toString(),
    );

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
