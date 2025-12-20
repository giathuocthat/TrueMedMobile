import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/order/order_list_entity.dart';
import '../../../../../domain/entities/order/order_list_item_entity.dart';
import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'order_list_state.freezed.dart';

@freezed
abstract class OrderListState with _$OrderListState {
  const factory OrderListState({
    @Default(Status.initial) Status status,
    String? error,

    // đang kéo để refresh, dùng cho UI
    @Default(false) bool isRefreshing,
    @Default(false) bool isLoadingMore, // ⭐ thêm

    @Default(true) bool hasMore,
    @Default(1) int page,

    @Default(null) OrderListResponseEntity? orderListPage,
    @Default([]) List<OrderListItemResponseEntity> orders,
  }) = _OrderListState;

  const OrderListState._();
}
