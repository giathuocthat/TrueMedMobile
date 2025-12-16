import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../../data/models/province_model.dart';
import '../entities/page_entity.dart';
import '../entities/product_entity.dart';
import '../entities/product_page_entity.dart';
import '../entities/province_entity.dart';

abstract base class AddressRepository extends Repository {
  Future<Result<List<ProvinceResponseEntity>, Failure>> getProvinceAll();

  Future<Result<List<ProvinceResponseEntity>, Failure>> getProvinceDetail(
    String id,
  );

  Future<Result<List<ProvinceResponseEntity>, Failure>> getWardDetail(
    String id,
  );
}
