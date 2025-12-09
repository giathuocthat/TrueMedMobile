import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../domain/use_cases/product_use_case.dart';
import 'product_state.dart';

part 'product_provider.g.dart';

// @riverpod
// class Product extends _$Product {
//   late GetProductsUseCase _getProductsUseCase;
//   late Get2ProductsUseCase _get2ProductsUseCase;

//   @override
//   ProductState build() {
//     _getProductsUseCase = ref.read(getProductsUseCaseProvider);
//     _get2ProductsUseCase = ref.read(get2ProductsUseCaseProvider);

//     return const ProductState();
//   }

//   Future<void> fetchProducts() async {
//     state = state.copyWith(status: Status.loading);

//     final result = await _getProductsUseCase.call();

//     state = switch (result) {
//       Success(:final data) => state.copyWith(status: Status.success),
//       Error(:final error) => state.copyWith(status: Status.error, error: error),
//       _ => state.copyWith(status: Status.error),
//     };
//   }

//   Future<void> fetch2Products() async {
//     state = state.copyWith(status: Status.loading);

//     final result = await _get2ProductsUseCase.call();

//     state = switch (result) {
//       Success(:final data) => state.copyWith(status: Status.success),
//       Error(:final error) => state.copyWith(status: Status.error, error: error),
//       _ => state.copyWith(status: Status.error),
//     };
//   }
// }

@riverpod
class Product extends _$Product {
  late GetProductsUseCase _getProductsUseCase;
  late Get2ProductsUseCase _get2ProductsUseCase;

  late GetProductStoresUseCase _getProductStoresUseCase;

  @override
  ProductState build() {
    _getProductsUseCase = ref.read(getProductsUseCaseProvider);
    _get2ProductsUseCase = ref.read(get2ProductsUseCaseProvider);

    _getProductStoresUseCase = ref.read(getProductStoresUseCaseProvider);

    //return const ProductState();
    // set initial state là loading
    final initialState = ProductState(status: Status.loading);

    // fire-and-forget (không await)
    //Future.microtask(fetchProduct1);

    Future.microtask(() => fetchProductStores(pageNumber: 1, pageSize: 10));

    return initialState;
  }

  Future<void> fetchAll() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getProductsUseCase.call();

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(products: data);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
        return; // stop luôn, khỏi call API 2
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }

    // 2) Call API 2
    final result2 = await _get2ProductsUseCase.call();

    switch (result2) {
      case Success(:final data):
        // ✅ Chỉ lúc này mới set Status.success
        state = state.copyWith(status: Status.success, products2: data);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
    }
  }

  Future<void> fetchProduct1() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getProductsUseCase.call();

    switch (result1) {
      case Success(:final data):
        //state = state.copyWith(products: data);
        state = state.copyWith(status: Status.success, products: data);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
        return; // stop luôn, khỏi call API 2
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }

  /// Dùng khi pull-to-refresh
  Future<void> refreshAll() async {
    // giữ nguyên status (vẫn success), chỉ bật cờ refresh
    state = state.copyWith(isRefreshing: true, error: null);

    final r1 = await _getProductsUseCase.call();
    final r2 = await _get2ProductsUseCase.call();

    switch (r1) {
      case Success(:final data):
        state = state.copyWith(products: data);
      case Error(:final error):
        state = state.copyWith(error: error);
      default:
        state = state.copyWith(error: 'Something went wrong');
    }

    switch (r2) {
      case Success(:final data):
        state = state.copyWith(products2: data, status: Status.success);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
    }

    // tắt cờ refresh
    state = state.copyWith(isRefreshing: false);
  }

  Future<void> fetchProductStores({
    required int pageNumber,
    required int pageSize,
  }) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getProductStoresUseCase.call(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );

    switch (result1) {
      case Success(:final data):
        //state = state.copyWith(products: data);
        state = state.copyWith(status: Status.success, productPage: data);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
        return; // stop luôn, khỏi call API 2
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }
}
