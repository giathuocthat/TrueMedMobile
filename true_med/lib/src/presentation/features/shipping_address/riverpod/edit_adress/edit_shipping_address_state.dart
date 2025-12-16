import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/product_entity.dart';

import '../shipping_address_state.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'edit_shipping_address_state.freezed.dart';

@freezed
abstract class EditShippingAddressState with _$EditShippingAddressState {
  const factory EditShippingAddressState({
    @Default(Status.initial) Status status,
    String? error,

    // đang kéo để refresh, dùng cho UI
    @Default(false) bool isRefreshing,

    // @Default(false) bool isLoadingMore,
    // @Default(false) bool hasMore,
    // @Default(1) int page,

    // list dữ liệu từ API
    @Default(null) ProductResponseEntity? productDetail,
  }) = _EditShippingAddressState;

  const EditShippingAddressState._();
}
