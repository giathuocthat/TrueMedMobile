import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/base_entity.dart';

import '../shipping_address_state.dart';
import '../../../../core/base/status.dart';
export 'package:true_med/src/presentation/core/base/status.dart';

part 'address_state.freezed.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @Default(Status.initial) Status status,

    String? error,

    // đang kéo để refresh, dùng cho UI
    @Default(false) bool isRefreshing,

    // list dữ liệu từ API,
    @Default(null) BaseResponseEntity? responseData,
  }) = _AddressState;

  const AddressState._();
}
