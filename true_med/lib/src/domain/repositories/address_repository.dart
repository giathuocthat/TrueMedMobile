import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../../data/models/api_response_meta_model.dart';
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

  Future<Result<ApiResponseMetaModel, Failure>> addAddressShipping(
    AddressShippingRequestEntity request,
  );
  Future<Result<ApiResponseMetaModel, Failure>> editAddressShipping(
    String id,
    AddressShippingRequestEntity request,
  );

  Future<Result<ApiResponseMetaModel, Failure>> deleteAddressShipping(
    String id,
  );

  Future<
    Result<BaseObjectResponseEntity<AddressShippingResponseEntity>, Failure>
  >
  defaultAddressShipping(String customerId);
}
