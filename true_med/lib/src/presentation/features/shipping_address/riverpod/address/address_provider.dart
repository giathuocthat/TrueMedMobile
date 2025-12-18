import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/use_cases/address/add_address_shipping_usecase.dart';
import '../../../../../domain/use_cases/address/edit_address_shipping_usecase.dart';
export 'package:true_med/src/presentation/core/base/status.dart';

import 'address_state.dart';

part 'address_provider.g.dart';

@riverpod
class Address extends _$Address {
  late AddAddressShippingUseCase _addAddressShippingUseCase;
  late EditAddressShippingUseCase _editAddressShippingUseCase;

  @override
  AddressState build() {
    _addAddressShippingUseCase = ref.read(addAddressShippingUseCaseProvider);
    _editAddressShippingUseCase = ref.read(editAddressShippingUseCaseProvider);

    // set initial state là loading
    final initialState = AddressState(status: Status.loading);
    // fire-and-forget (không await)

    //Future.microtask(() => fetchAll(provinceId));

    return initialState;
  }

  void addAddressShipping({
    required int customerId,
    required String recipientName,
    required String phoneNumber,
    required String addressLine,
    required int wardId,
    required int provinceId,
    required bool isDefault,
    int? addressType,
  }) async {
    // state = state.copyWith(statusSummit: Status.loading);
    state = state.copyWith(status: Status.loading, error: null);
    final result = await _addAddressShippingUseCase.call(
      customerId: customerId,
      recipientName: recipientName,
      phoneNumber: phoneNumber,
      addressLine: addressLine,
      wardId: wardId,
      provinceId: provinceId,
      isDefault: isDefault,
      addressType: addressType,
    );
    state = switch (result) {
      Success() => state.copyWith(status: Status.success),
      Error(:final error) => state.copyWith(status: Status.error, error: error),
      _ => state.copyWith(status: Status.error),
    };
  }

  void editAddressShipping({
    required int customerId,
    required String recipientName,
    required String phoneNumber,
    required String addressLine,
    required int wardId,
    required int provinceId,
    required bool isDefault,
    int? addressType,
    required int addressId,
  }) async {
    //state = state.copyWith(statusSummit: Status.loading);
    state = state.copyWith(status: Status.loading, error: null);

    final result = await _editAddressShippingUseCase.call(
      customerId: customerId,
      recipientName: recipientName,
      phoneNumber: phoneNumber,
      addressLine: addressLine,
      wardId: wardId,
      provinceId: provinceId,
      isDefault: isDefault,
      addressType: addressType,
      addressId: addressId,
    );

    state = switch (result) {
      Success() => state.copyWith(status: Status.success),
      Error(:final error) => state.copyWith(status: Status.error, error: error),
      _ => state.copyWith(status: Status.error),
    };
  }
}
