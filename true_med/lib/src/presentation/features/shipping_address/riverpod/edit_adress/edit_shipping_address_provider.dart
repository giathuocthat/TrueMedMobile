import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/use_cases/product_use_case.dart';

import 'edit_shipping_address_state.dart';

part 'edit_shipping_address_provider.g.dart';

@riverpod
class EditShippingAddressProvider extends _$EditShippingAddressProvider {
  late GetProductDetailUseCase _getProductDetailUseCase;

  @override
  EditShippingAddressState build(int productId) {
    _getProductDetailUseCase = ref.read(getProductDetailUseCaseProvider);
    //return const ProductDetailState();
    // set initial state là loading
    final initialState = EditShippingAddressState(status: Status.loading);
    // fire-and-forget (không await)
    //Future.microtask(fetchProductDetail);

    Future.microtask(() => fetchListAddress());

    return initialState;
  }

  Future<void> fetchListAddress() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getProductDetailUseCase.call(productId: productId);

    switch (result1) {
      case Success(:final data):
        //state = state.copyWith(products: data);
        state = state.copyWith(status: Status.success, productDetail: data);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
      //return; // stop luôn, khỏi call API 2
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }

  /// Dùng khi pull-to-refresh
  Future<void> refreshAll(int productId) async {
    // giữ nguyên status (vẫn success), chỉ bật cờ refresh
    state = state.copyWith(isRefreshing: true, error: null);

    final r1 = await _getProductDetailUseCase.call(productId: productId);

    switch (r1) {
      case Success(:final data):
        //state = state.copyWith(products: data);
        state = state.copyWith(status: Status.success, productDetail: data);
      case Error(:final error):
        state = state.copyWith(error: error);
      default:
        state = state.copyWith(error: 'Something went wrong');
    }

    // tắt cờ refresh
    state = state.copyWith(isRefreshing: false);
  }
}
