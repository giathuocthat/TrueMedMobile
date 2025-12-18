import '../../../core/base/result.dart';
import '../../../data/models/api_response_meta_model.dart';
import '../../entities/address_shipping_entity.dart';
import '../../repositories/address_repository.dart';

final class EditAddressShippingUseCase {
  EditAddressShippingUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<ApiResponseMetaModel, String>> call({
    required int customerId,
    required String recipientName,
    required String phoneNumber,
    required String addressLine,
    required int wardId,
    required int provinceId,
    required bool isDefault,
    int? addressType,
    required int addressId,
  }) async {
    final request = AddressShippingRequestEntity(
      customerId: customerId,
      recipientName: recipientName,
      phoneNumber: phoneNumber,
      addressLine: addressLine,
      wardId: wardId,
      provinceId: provinceId,
      isDefault: isDefault,
      addressType: addressType,
    );

    final result = await repository.editAddressShipping(
      addressId.toString(),
      request,
    );

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
