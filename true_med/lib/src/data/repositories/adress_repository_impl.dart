import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_page_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../models/province_model.dart';
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
  Future<Result<List<ProvinceResponseEntity>, Failure>> getProvinceDetail(
    String id,
  ) {
    return asyncGuard(() async {
      final response = await remote.getProvinceDetail(id);

      final provinces = response.data;
      return provinces;
    });
  }

  @override
  Future<Result<List<ProvinceResponseEntity>, Failure>> getWardDetail(
    String id,
  ) {
    return asyncGuard(() async {
      final response = await remote.getWardDetail(id);

      final provinces = response.data;
      return provinces;
    });
  }
}
