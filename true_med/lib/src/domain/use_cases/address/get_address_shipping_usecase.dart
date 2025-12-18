import '../../../core/base/result.dart';
import '../../entities/address_shipping_entity.dart';
import '../../entities/base_entity.dart';
import '../../repositories/address_repository.dart';

final class GetAddressShippingUseCase {
  GetAddressShippingUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<BaseListResponseEntity<AddressShippingResponseEntity>, String>>
  call({required int customerId}) async {
    final result = await repository.getAddressAll(customerId.toString());

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
