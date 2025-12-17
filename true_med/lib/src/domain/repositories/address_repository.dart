import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/address_shipping_entity.dart';
import '../entities/base_entity.dart';
import '../entities/province_detail_entity .dart';
import '../entities/province_entity.dart';
import '../entities/ward_detail_entity.dart';
import '../entities/ward_entity.dart';

abstract base class AddressRepository extends Repository {
  Future<Result<List<ProvinceResponseEntity>, Failure>> getProvinceAll();

  Future<Result<List<WardResponseEntity>, Failure>> getWardAll();

  Future<Result<ProvinceDetailResponseEntity, Failure>> getProvinceDetail(
    String id,
  );

  Future<Result<WardDetailResponseEntity, Failure>> getWardDetail(String id);

  Future<Result<BaseListResponseEntity<AddressShippingResponseEntity>, Failure>>
  getAddressAll(String id);
}
