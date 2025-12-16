import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/use_cases/address_use_case.dart';

import 'edit_shipping_address_state.dart';

part 'edit_shipping_address_provider.g.dart';

@riverpod
class EditShippingAddress extends _$EditShippingAddress {
  //late GetProductDetailUseCase _getProductDetailUseCase;

  late GetProvinceAllUseCase _getProvinceAllUseCase;
  late GetProvinceDetailUseCase _getProvinceDetailUseCase;
  late GetWardDetailUseCase _getWardDetailUseCase;

  @override
  EditShippingAddressState build() {
    _getProvinceAllUseCase = ref.read(getProvinceAllUseCaseProvider);
    _getProvinceDetailUseCase = ref.read(getProvinceDetailUseCaseProvider);
    _getWardDetailUseCase = ref.read(getWardDetailUseCaseProvider);

    // set initial state là loading
    final initialState = EditShippingAddressState(status: Status.loading);
    // fire-and-forget (không await)
    //Future.microtask(fetchProductDetail);

    Future.microtask(() => fetchListProvince());

    return initialState;
  }

  Future<void> fetchListProvince() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result = await _getProvinceAllUseCase.call();

    switch (result) {
      case Success(:final data):
        state = state.copyWith(status: Status.success, listProvince: data);
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

  Future<void> fetchProvinceDetail(int id) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result = await _getProvinceDetailUseCase.call(proviceId: id);

    switch (result) {
      case Success(:final data):
        state = state.copyWith(
          status: Status.success,
          listWard: data.wards,
          provinceDetail: data,
        );
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

  Future<void> fetchWardDetail(int id) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result = await _getWardDetailUseCase.call(wardId: id);

    switch (result) {
      case Success(:final data):
        state = state.copyWith(status: Status.success, listProvince: data);
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

    //   final r1 = await _getProductDetailUseCase.call(productId: productId);

    //   switch (r1) {
    //     case Success(:final data):
    //       //state = state.copyWith(products: data);
    //       state = state.copyWith(status: Status.success, productDetail: data);
    //     case Error(:final error):
    //       state = state.copyWith(error: error);
    //     default:
    //       state = state.copyWith(error: 'Something went wrong');
    //   }

    //   // tắt cờ refresh
    //   state = state.copyWith(isRefreshing: false);
  }
}
