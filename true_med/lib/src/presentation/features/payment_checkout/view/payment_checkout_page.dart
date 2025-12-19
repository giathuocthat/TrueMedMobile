import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../core/extensions/string.dart';
import '../../../core/application_state/address_shipping/selected_shipping_address_provider.dart';
import '../../../core/base/status.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../checkout/riverpod/checkout_order_items_provider.dart';
import '../../order/create_order/riverpod/create_order_provider.dart';
import '../../order/create_order/riverpod/create_order_state.dart';
import '../riverpod/payment_checkout_provider.dart';
import 'widget/delivery_info_card.dart';
import 'widget/delivery_method_card.dart';
import 'widget/invoice_info_section.dart';
import 'widget/order_product_section.dart';
import 'widget/order_summary_section.dart';
import 'widget/payment_checkout_footer.dart';
import 'widget/payment_method_card.dart';

class PaymentCheckoutPage extends ConsumerStatefulWidget {
  const PaymentCheckoutPage({super.key});

  @override
  ConsumerState<PaymentCheckoutPage> createState() =>
      _PaymentCheckoutPageState();
}

class _PaymentCheckoutPageState extends ConsumerState<PaymentCheckoutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CreateOrderState>(createOrderProvider, (prev, next) {
      if (prev?.status != next.status && next.status.isSuccess) {
        // final order = next.order; // ✅ DATA Ở ĐÂY

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Đặt hàng thành công - Mã đơn: ${order?.id}')),
        // );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đặt hàng thành công')));
      }

      if (next.status.isError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đặt hàng thất bại')));
      }
    });
    final selectedAddress = ref.watch(selectedShippingAddressProvider);

    final pricing = ref.watch(checkoutPricingProvider);
    final moneyTotal = pricing.total;

    final totalItems = ref.watch(
      cartProvider.select((s) => s.selectedTotalQuantity),
    );
    final listProducts = ref.watch(
      cartProvider.select((s) => s.checkOutSelectItems),
    );

    final state = ref.watch(paymentCheckoutProvider);

    if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == Status.error) {
      return Center(child: Text(state.error ?? 'Có lỗi xảy ra'));
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: PageHeader(title: context.locale.payment, showBack: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  DeliveryInfoCard(address: selectedAddress ?? state.address),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),
                  OrderProductSection(
                    listProducts: listProducts,
                    itemCheckouts: totalItems,
                  ),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),
                  const DeliveryMethodCard(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  const PaymentMethodCard(isCash: true, isNoChagePay: true),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  const InvoiceInfoSection(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  OrderSummarySection(
                    itemsFormat: '$totalItems sản phẩm',
                    moneyTotalFormat: moneyTotal.toCurrency(true),
                    moneySubFormat: moneyTotal.toCurrency(true),
                    moneyServiceFeeFormat: 0.toCurrency(true),
                    moneyShippingFormat: 0.toCurrency(true),
                    moneyFinalFormat: moneyTotal.toCurrency(true),
                    //moneyTotalDiscountFormart: "-${0.toCurrency(true)}",
                  ),
                  const SizedBox(height: 16),
                  Divider(height: 1, color: Colors.grey.shade300),
                ],
              ),
            ),
          ),
          ////
          SizedBox(
            height: 100,
            child: PaymentCheckOutFooter(
              totalMoney: moneyTotal,
              totalMoneyDiscount: 0,
              onCheckout: () {
                ref.read(createOrderProvider.notifier).creatOrder();
              },
            ),
          ),
        ],
      ),
    );
  }
}
