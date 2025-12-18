import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../domain/use_cases/address/default_address_shipping_usecase.dart';
import '../../../../domain/use_cases/product_use_case.dart';
import '../../../core/application_state/user/user_provider.dart';
import 'payment_checkout_state.dart';

part 'payment_checkout_provider.g.dart';

@riverpod
class PaymentCheckout extends _$PaymentCheckout {
  late GetProductDetailUseCase _getProductDetailUseCase;
  late DefaultAddressShippingUseCase _defaultAddressShippingUseCase;

  @override
  PaymentCheckoutState build() {
    _defaultAddressShippingUseCase = ref.read(
      defaultAddressShippingUseCaseProvider,
    );
    _getProductDetailUseCase = ref.read(getProductDetailUseCaseProvider);

    //return const ProductDetailState();
    // set initial state là loading
    final initialState = PaymentCheckoutState(status: Status.loading);

    // fire-and-forget (không await)
    //Future.microtask(fetchProductDetail);
    final user = ref.watch(userProvider).user;

    // 🚫 Chưa login → không gọi API
    if (user == null) {
      return const PaymentCheckoutState(status: Status.initial);
    }
    Future.microtask(() => fetchAll(user.id));

    return initialState;
  }

  Future<void> fetchAll(int customerId) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _defaultAddressShippingUseCase.call(
      customerId: customerId,
    );

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(status: Status.success, address: data.data);
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
    // final result2 = await _get2ProductsUseCase.call();

    // switch (result2) {
    //   case Success(:final data):
    //     // ✅ Chỉ lúc này mới set Status.success
    //     state = state.copyWith(status: Status.success, products2: data);
    //   case Error(:final error):
    //     state = state.copyWith(status: Status.error, error: error);
    //   default:
    //     state = state.copyWith(
    //       status: Status.error,
    //       error: 'Something went wrong',
    //     );
    // }
  }
}
