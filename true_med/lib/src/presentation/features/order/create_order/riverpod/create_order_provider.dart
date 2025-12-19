import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/entities/customer_entity.dart';
import '../../../../../domain/use_cases/order/create_order_usecase.dart';
import '../../../../core/application_state/address_shipping/selected_shipping_address_provider.dart';
import '../../../../core/application_state/user/user_provider.dart';
import '../../../checkout/riverpod/checkout_order_items_provider.dart';
import 'create_order_state.dart';

part 'create_order_provider.g.dart';

@riverpod
class CreateOrder extends _$CreateOrder {
  late CreateOrderUseCase _createOrderUseCase;
  late CustomerResponseEntity? _customer;
  @override
  CreateOrderState build() {
    _createOrderUseCase = ref.read(createOrderUseCaseProvider);

    //return const ProductDetailState();
    // set initial state là loading
    final initialState = CreateOrderState(status: Status.loading);

    // fire-and-forget (không await)
    //Future.microtask(fetchProductDetail);
    final user = ref.watch(userProvider).user;

    // 🚫 Chưa login → không gọi API
    if (user == null) {
      return const CreateOrderState(status: Status.initial);
    }
    _customer = user;
    //Future.microtask(() => fetchAll(user.id));

    return initialState;
  }

  Future<void> creatOrder() async {
    //final ordersId = ref.watch(shippingAddressProvider);

    final ordersId = ref.watch(checkoutOrderItemsProvider);
    final shippingAddress = ref.watch(selectedShippingAddressProvider);
    if (shippingAddress == null) {
      state = state.copyWith(
        status: Status.error,
        error: 'Vui lòng chọn địa chỉ giao hàng',
      );
      return;
    }
    final pricing = ref.watch(checkoutPricingProvider);
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _createOrderUseCase.call(
      customerFullName: 'LocTb',
      customerEmail: 'LocTb@gmail.com',
      customerPhone: '0976973925',

      wardId: shippingAddress.wardId,
      provinceId: shippingAddress.provinceId,
      shippingName: shippingAddress.recipientName,
      shippingPhone: shippingAddress.phoneNumber,
      shippingAddress: shippingAddress.fullAddress,

      shippingFee: pricing.shippingFee,
      discountAmount: pricing.discount,
      //totalAmount: pricing.total,
      orderItems: ordersId,
      paymentMethod: 'Cash',
    );

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(status: Status.success, orderSuccess: data.data);
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
