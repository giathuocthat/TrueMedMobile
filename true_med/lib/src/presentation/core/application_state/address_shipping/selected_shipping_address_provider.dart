import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/address_shipping_entity.dart';

final selectedShippingAddressProvider =
    StateNotifierProvider<
      SelectedShippingAddressNotifier,
      AddressShippingResponseEntity?
    >((ref) {
      return SelectedShippingAddressNotifier();
    });

class SelectedShippingAddressNotifier
    extends StateNotifier<AddressShippingResponseEntity?> {
  SelectedShippingAddressNotifier() : super(null);

  void set(AddressShippingResponseEntity? address) {
    state = address;
  }

  void clear() {
    state = null;
  }
}
