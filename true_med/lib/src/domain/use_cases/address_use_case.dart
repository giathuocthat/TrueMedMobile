import '../../core/base/result.dart';
import '../../data/models/api_response_meta_model.dart';
import '../entities/address_shipping_entity.dart';
import '../entities/base_entity.dart';
import '../entities/province_detail_entity .dart';
import '../entities/province_entity.dart';
import '../entities/ward_detail_entity.dart';
import '../entities/ward_entity.dart';
import '../repositories/address_repository.dart';

final class GetProvinceAllUseCase {
  GetProvinceAllUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<List<ProvinceResponseEntity>, String>> call() async {
    final result = await repository.getProvinceAll();

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

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

final class GetProvinceDetailUseCase {
  GetProvinceDetailUseCase(this.repository);

  final AddressRepository repository;

  Future<Result<ProvinceDetailResponseEntity, String>> call({
    required int proviceId,
  }) async {
    final result = await repository.getProvinceDetail(proviceId.toString());

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

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

final class AddAddressShippingUseCase {
  AddAddressShippingUseCase(this.repository);

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
  }) async {
    final request = AddressShippingRequestEntity(
      customerId: customerId,
      recipientName: recipientName,
      phoneNumber: phoneNumber,
      addressLine: '',
      wardId: wardId,
      provinceId: provinceId,
      isDefault: isDefault,
      addressType: addressType,
    );

    final result = await repository.addAddressShipping(request);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

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
