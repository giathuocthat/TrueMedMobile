import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/address_shipping_entity.dart';
import '../../domain/entities/base_entity.dart';
import '../../domain/entities/province_detail_entity .dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/ward_detail_entity.dart';
import '../../domain/entities/ward_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../services/cache/cache_service.dart';
import '../services/network/rest_client.dart';

final class AddressRepositoryImpl extends AddressRepository {
  AddressRepositoryImpl({required this.remote, required this.local});

  final RestClient remote;
  final CacheService local;

  @override
  Future<Result<List<ProvinceResponseEntity>, Failure>> getProvinceAll() {
    return asyncGuard(() async {
      final response = await remote.getProvinces();

      final provinces = response.data;
      return provinces;
    });
  }

  @override
  Future<Result<List<WardResponseEntity>, Failure>> getWardAll() {
    return asyncGuard(() async {
      final response = await remote.getWards();

      final wards = response.data;
      return wards;
    });
  }

  @override
  Future<Result<ProvinceDetailResponseEntity, Failure>> getProvinceDetail(
    String id,
  ) {
    return asyncGuard(() async {
      final response = await remote.getProvinceDetail(id);

      final provinces = response.data;
      return provinces;
    });
  }

  @override
  Future<Result<WardDetailResponseEntity, Failure>> getWardDetail(String id) {
    return asyncGuard(() async {
      final response = await remote.getWardDetail(id);

      return response.data;
    });
  }

  @override
  Future<Result<BaseListResponseEntity<AddressShippingResponseEntity>, Failure>>
  getAddressAll(String id) {
    return asyncGuard(() async {
      final response = await remote.getAddressShippingUser(id);

      return response.data;
    });
  }

  // @override
  // Future<Result<WardDetailResponseEntity, Failure>> getWardDetail(String id) {
  //   return asyncGuard(() async {
  //     final response = await remote.getWardDetail(id);

  //     return response.data;
  //   });
  // }
}
