import '../../core/base/result.dart';
import '../entities/product_entity.dart';
import '../repositories/address_repository.dart';

final class GetListAddressUseCase {
  GetListAddressUseCase(this.repository);

  final AddressRepository repository;

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

final class GetDefaultAddressUseCase {
  GetDefaultAddressUseCase(this.repository);

  final AddressRepository repository;

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

final class AddAddressUseCase {
  AddAddressUseCase(this.repository);

  final AddressRepository repository;

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

final class RemoveAddressUseCase {
  RemoveAddressUseCase(this.repository);

  final AddressRepository repository;

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

final class SetAddressDefaultUseCase {
  SetAddressDefaultUseCase(this.repository);

  final AddressRepository repository;

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
