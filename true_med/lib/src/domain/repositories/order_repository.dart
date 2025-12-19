import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../../data/models/api_response_meta_model.dart';
import '../entities/oder_entity.dart';

abstract base class OrderRepository extends Repository {
  Future<Result<ApiResponseMetaModel, Failure>> order(
    OrderRequestEntity request,
  );
}
