import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'product_state.freezed.dart';

@freezed
abstract class ProductState<T> with _$ProductState<T> {
  const factory ProductState({
    @Default(false) bool rememberMe,
    @Default(Status.initial) Status status,
    String? error,
  }) = _ProductState<T>;
  const ProductState._();
}
