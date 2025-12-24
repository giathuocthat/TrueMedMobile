import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/base_entity.dart';
import '../entities/bussiness_type_entity.dart';

abstract base class BussinessRepository extends Repository {
  Future<Result<BaseListResponseEntity<BussinessTypeResponseEntity>, Failure>>
  getListBussinessType(Map<String, dynamic> query);
}
