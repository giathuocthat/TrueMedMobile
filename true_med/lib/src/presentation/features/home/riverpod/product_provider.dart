import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../domain/use_cases/product_use_case.dart';
import 'product_state.dart';

part 'product_provider.g.dart';

@riverpod
class Product extends _$Product {
  late GetProductsUseCase _getProductsUseCase;
  late Get2ProductsUseCase _get2ProductsUseCase;

  @override
  ProductState build() {
    _getProductsUseCase = ref.read(getProductsUseCaseProvider);
    _get2ProductsUseCase = ref.read(get2ProductsUseCaseProvider);

    return const ProductState();
  }

  Future<void> fetchProducts() async {
    state = state.copyWith(status: Status.loading);

    final result = await _getProductsUseCase.call();

    state = switch (result) {
      Success(:final data) => state.copyWith(status: Status.success),
      Error(:final error) => state.copyWith(status: Status.error, error: error),
      _ => state.copyWith(status: Status.error),
    };
  }

  Future<void> fetch2Products() async {
    state = state.copyWith(status: Status.loading);

    final result = await _get2ProductsUseCase.call();

    state = switch (result) {
      Success(:final data) => state.copyWith(status: Status.success),
      Error(:final error) => state.copyWith(status: Status.error, error: error),
      _ => state.copyWith(status: Status.error),
    };
  }
}
