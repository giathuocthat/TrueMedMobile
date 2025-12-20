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

  Future<void> fetchOrders({bool loadMore = false}) async {
    //if (state.status == Status.loading) return;
    if (loadMore && (state.isLoadingMore || !state.hasMore)) return;
    //if (loadMore && !state.hasMore) return;
    // reset state trước
    state = state.copyWith(
      //status: Status.loading,
      status: loadMore ? state.status : Status.loading,
      isLoadingMore: loadMore,
      error: null,
      isRefreshing: !loadMore,
    );

    final result1 = await _orderListUseCase.call(
      pageNumber: state.page,
      pageSize: 20,
    );

    switch (result1) {
      case Success(:final data):
        final newOrders = data.data as OrderListResponseEntity;
        //final newOrders = pageData.data ?? [];
        final pagination = newOrders.pagination;
        state = state.copyWith(
          status: Status.success,
          orders: loadMore
              ? [...state.orders, ...newOrders.data ?? []]
              : newOrders.data ?? [],
          page: (pagination.pageNumber) + 1,
          hasMore: pagination.hasMore,
          isLoadingMore: false,
          isRefreshing: false,
        );
      case Error(:final error):
        state = state.copyWith(
          status: Status.error,
          error: error,
          isRefreshing: false,
          isLoadingMore: false,
        );
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
          isLoadingMore: false,
          isRefreshing: false,
        );
        return;
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(page: 1, hasMore: true, orders: []);

    await fetchOrders();
  }
}
