import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/entities/order/order_list_entity.dart';
import '../../../../../domain/entities/order/order_list_item_entity.dart';
import '../../../../../domain/use_cases/order/create_order_usecase.dart';
import '../../../../../domain/use_cases/order/order_list_usecase.dart';
import '../../../../core/application_state/address_shipping/selected_shipping_address_provider.dart';
import '../../../../core/application_state/user/user_provider.dart';
import '../../../checkout/riverpod/checkout_order_items_provider.dart';
import 'order_list_state.dart';

part 'order_list_provider.g.dart';

@riverpod
class OrderList extends _$OrderList {
  late OrderListUseCase _orderListUseCase;

  @override
  OrderListState build() {
    _orderListUseCase = ref.read(orderListUseCaseProvider);

    //return const ProductDetailState();
    // set initial state là loading
    final initialState = OrderListState(status: Status.loading);

    // fire-and-forget (không await)
    //Future.microtask(fetchProductDetail);
    final user = ref.watch(userProvider).user;

    // 🚫 Chưa login → không gọi API
    if (user == null) {
      return const OrderListState(status: Status.initial);
    }

    Future.microtask(fetchOrders);

    return initialState;
  }

  Future<void> fetchOrders() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _orderListUseCase.call(pageNumber: 1, pageSize: 20);

    switch (result1) {
      case Success(:final data):
        final orders = data.data as OrderListResponseEntity;
        state = state.copyWith(
          status: Status.success,
          orders: orders.data ?? [],
        );
      //state = state.copyWith(status: Status.success, orders: data.data ?? []);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
        return; // stop luôn, khỏi call API 2
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }
}
