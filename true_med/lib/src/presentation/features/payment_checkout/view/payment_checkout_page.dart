import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../cart_order/view/cart_product_item.dart';
import '../../cart_order/view/cart_product_item_swipe.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: PageHeader(title: context.locale.cart, showBack: true),
      ),
      body: listCard.items.isEmpty
          ? const Center(
              child: Text(
                'Chưa có sản phẩm trong giỏ hàng',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 12),
                Divider(height: 1, color: Colors.grey.shade300),

                Expanded(
                  child: ListView.builder(
                    itemCount: listCard.items.length,
                    itemBuilder: (context, index) {
                      final item = listCard.items[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CartProductItemWithSwipe(
                            product: item.product,
                            onDelete: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .remove(item.product);
                            },
                            child: CartProductItem(
                              product: item.product,
                              quantity: item.quantity,
                              onDecrease: () => ref
                                  .read(cartProvider.notifier)
                                  .decrease(item.product),
                              onIncrease: () => ref
                                  .read(cartProvider.notifier)
                                  .increase(item.product),
                            ),
                          ),

                          Divider(height: 1, color: Colors.grey.shade300),
                          //const SizedBox(height: 12),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
