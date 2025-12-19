import '../../../core/base/result.dart';
import '../../entities/base_entity.dart';
import '../../entities/order_entity.dart';
import '../../entities/order_item_entity.dart';
import '../../repositories/order_repository.dart';

final class CreateOrderUseCase {
  CreateOrderUseCase(this.repository);

  final OrderRepository repository;

  Future<Result<BaseObjectResponseEntity<OrderResponseEntity>, String>> call({
    required String customerFullName,
    required String customerEmail,
    required String customerPhone,
    required int wardId,
    required int provinceId,
    required String shippingName,
    required String shippingPhone,
    required String shippingAddress,
    required double? shippingFee,
    required double? discountAmount,
    required List<OrderItemEntity> orderItems,
    required String paymentMethod,
  }) async {
    final request = OrderRequestEntity(
      customerFullName: customerFullName,
      customerEmail: customerEmail,
      customerPhone: customerPhone,
      orderItems: orderItems,
      paymentMethod: paymentMethod,
      shippingFee: shippingFee ?? 0,
      discountAmount: discountAmount ?? 0,
      shippingName: shippingName,
      shippingAddress: shippingAddress,
      shippingPhone: shippingPhone,
      wardId: wardId,
      provinceId: provinceId,
    );
    final result = await repository.order(request);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
