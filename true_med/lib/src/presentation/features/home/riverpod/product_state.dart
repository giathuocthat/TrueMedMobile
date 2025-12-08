import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'product_state.freezed.dart';

//@freezed
// abstract class ProductState<T> with _$ProductState<T> {
//   const factory ProductState({
//     @Default(false) bool rememberMe,
//     @Default(Status.initial) Status status,
//     String? error,
//   }) = _ProductState<T>;
//   const ProductState._();
// }

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default(Status.initial) Status status,
    String? error,

    // đang kéo để refresh, dùng cho UI
    @Default(false) bool isRefreshing,

    // @Default(false) bool isLoadingMore,
    // @Default(false) bool hasMore,
    // @Default(1) int page,

    // list dữ liệu từ API 1
    @Default(<ProductEntity>[]) List<ProductEntity> products,

    // list dữ liệu từ API 2
    @Default(<ProductEntity>[]) List<ProductEntity> products2,
  }) = _ProductState;

  const ProductState._();
}
