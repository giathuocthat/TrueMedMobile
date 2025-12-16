import '../../core/base/result.dart';
import '../entities/province_detail_entity .dart';
import '../entities/province_entity.dart';
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

  Future<Result<List<ProvinceResponseEntity>, String>> call({
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
