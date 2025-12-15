import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../shared/widget/payment_footer.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../cart_order/view/cart_product_item.dart';
import '../../cart_order/view/cart_product_item_swipe.dart';
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
    final listCard = ref.watch(cartProvider);
    final moneyTotal = ref.watch(
      cartProvider.select((s) => s.selectedTotalAmount),
    );

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: PageHeader(title: 'Thanh toán', showBack: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),
                  const DeliveryInfoCard(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),
                  const OrderProductSection(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),
                  const DeliveryMethodCard(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  const PaymentMethodCard(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  const InvoiceInfoSection(),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade300),

                  const OrderSummarySection(),
                  const SizedBox(height: 16),
                  Divider(height: 1, color: Colors.grey.shade300),
                ],
              ),
            ),
          ),
          ////
          SizedBox(
            height: 100,
            child: PaymentCheckOutFooter(context, moneyTotal, 0),
          ),
        ],
      ),
    );
  }
}
