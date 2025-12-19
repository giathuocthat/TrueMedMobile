import '../../../core/base/result.dart';
import '../../entities/base_entity.dart';
import '../../entities/order/order_list_entity.dart';
import '../../repositories/order_repository.dart';

final class OrderListUseCase {
  OrderListUseCase(this.repository);

  final OrderRepository repository;

  Future<Result<BaseObjectResponseEntity<OrderListResponseEntity>, String>>
  call({required int pageNumber, required int pageSize}) async {
    final query = {'pageNumber': pageNumber, 'pageSize': pageSize};

    final result = await repository.listOrder(query);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
