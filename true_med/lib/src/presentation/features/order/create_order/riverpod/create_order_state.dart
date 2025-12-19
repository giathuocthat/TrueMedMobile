import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/address_shipping_entity.dart';
import '../../../../../domain/entities/order_entity.dart';
import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'create_order_state.freezed.dart';

@freezed
abstract class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState({
    @Default(Status.initial) Status status,
    String? error,

    // đang kéo để refresh, dùng cho UI
    @Default(false) bool isRefreshing,

    @Default(null) OrderResponseEntity? orderSuccess,
  }) = _CreateOrderState;

  const CreateOrderState._();
}
