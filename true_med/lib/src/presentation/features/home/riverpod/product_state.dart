import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/entities/product_page_entity.dart';
import '../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'product_state.freezed.dart';

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
    @Default(<ProductResponseEntity>[]) List<ProductResponseEntity> products,

    // list dữ liệu từ API 2
    @Default(<ProductResponseEntity>[]) List<ProductResponseEntity> products2,

    // list dữ liệu từ API
    @Default(null) ProductPageResponseEntity? productPage,
  }) = _ProductState;

  const ProductState._();
}
