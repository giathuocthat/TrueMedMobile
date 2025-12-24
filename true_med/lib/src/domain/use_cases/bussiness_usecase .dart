import '../../core/base/result.dart';
import '../entities/base_entity.dart';
import '../entities/bussiness_type_entity.dart';
import '../entities/order/order_list_entity.dart';
import '../entities/page_entity.dart';
import '../entities/product_entity.dart';
import '../entities/product_page_entity.dart';
import '../repositories/bussiness_repository.dart';

final class GetBussinessTypeUseCase {
  GetBussinessTypeUseCase(this.repository);

  final BussinessRepository repository;

  Future<Result<BaseListResponseEntity<BussinessTypeResponseEntity>, String>>
  call({required int pageNumber, required int pageSize}) async {
    // Build query map gửi cho API
    final query = {'pageNumber': pageNumber, 'pageSize': pageSize};

    final result = await repository.getListBussinessType(query);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
