import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../domain/use_cases/address/get_address_shipping_usecase.dart';
import '../../../core/application_state/user/user_provider.dart';
import 'shipping_address_state.dart';

part 'shipping_address_provider.g.dart';

@riverpod
class ShippingAddress extends _$ShippingAddress {
  late GetAddressShippingUseCase _getAddressShippingUseCase;

  @override
  ShippingAddressState build() {
    // set initial instance của use case
    _getAddressShippingUseCase = ref.read(getAddressShippingUseCaseProvider);

    // set initial state là loading
    final initialState = ShippingAddressState(status: Status.loading);

    final user = ref.watch(userProvider).user;

    // 🚫 Chưa login → không gọi API
    if (user == null) {
      return const ShippingAddressState(status: Status.initial);
    }
    Future.microtask(() => fetchAddressShipping(user.id));
    //fetchAddressShipping(user.id);

    return initialState;
  }

  Future<void> fetchAddressShipping(int customerId) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getAddressShippingUseCase.call(
      customerId: customerId,
    );

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(
          status: Status.success,
          listAddressShipping: data.data,
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
}
