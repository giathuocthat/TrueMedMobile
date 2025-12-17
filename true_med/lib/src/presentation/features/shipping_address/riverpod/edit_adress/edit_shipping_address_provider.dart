import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/use_cases/address_use_case.dart';

import 'edit_shipping_address_state.dart';

part 'edit_shipping_address_provider.g.dart';

@riverpod
class EditShippingAddress extends _$EditShippingAddress {
  late GetProvinceAllUseCase _getProvinceAllUseCase;
  late GetWardAllUseCase _getWardAllUseCase;
  late GetProvinceDetailUseCase _getProvinceDetailUseCase;
  late GetWardDetailUseCase _getWardDetailUseCase;

  @override
  EditShippingAddressState build() {
    _getProvinceAllUseCase = ref.read(getProvinceAllUseCaseProvider);
    _getWardAllUseCase = ref.read(getWardAllUseCaseProvider);
    _getProvinceDetailUseCase = ref.read(getProvinceDetailUseCaseProvider);
    _getWardDetailUseCase = ref.read(getWardDetailUseCaseProvider);

    // set initial state là loading
    final initialState = EditShippingAddressState(status: Status.loading);
    // fire-and-forget (không await)

    Future.microtask(() => fetchAll());

    return initialState;
  }

  Future<void> fetchAll() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getProvinceAllUseCase.call();

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(status: Status.success, listProvince: data);
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
    final result2 = await _getWardAllUseCase.call();

    switch (result2) {
      case Success(:final data):
        // ✅ Chỉ lúc này mới set Status.success
        state = state.copyWith(status: Status.success, listWard: data);
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
    }
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
        state = state.copyWith(status: Status.success, wardDetail: data);
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
}
