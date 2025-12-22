import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/address_shipping_entity.dart';
import '../../../../../domain/entities/order_entity.dart';
import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'order_success_state.freezed.dart';

@freezed
abstract class OrderSuccessState with _$OrderSuccessState {
  const factory OrderSuccessState({
    @Default(Status.initial) Status status,
    String? error,

    // đang kéo để refresh, dùng cho UI
    @Default(false) bool isRefreshing,

    @Default(null) OrderResponseEntity? orderSuccess,
  }) = _OrderSuccessState;

  const OrderSuccessState._();
}
