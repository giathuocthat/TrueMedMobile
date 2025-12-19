import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../shared/widget/circle_check_box.dart';
import '../../../../shared/widget/payment_footer.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import 'cart_product_item.dart';
import 'cart_product_item_swipe.dart';

class CartOrderPage extends ConsumerStatefulWidget {
  const CartOrderPage({super.key});

  @override
  ConsumerState<CartOrderPage> createState() => _CartOrderPageState();
}

class _CartOrderPageState extends ConsumerState<CartOrderPage> {
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
                if (listCard.items.isNotEmpty)
                  _CartHeader(listCard.items.length),
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

                SizedBox(
                  height: 230,
                  child: PaymentFooter(
                    context,
                    items: listCard.selectedTotalQuantity.toDouble(),
                    totalMoney: moneyTotal,
                    totalMoneyDiscount: 0,
                    totalItems: listCard.selectedTotalQuantity,
                  ),
                ),
              ],
            ),
    );
  }
}

class _CartHeader extends ConsumerWidget {
  final int count;
  const _CartHeader(this.count, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      color: const Color(0xFFF6F7F9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleCheckBox(
                isChecked: ref.watch(
                  cartProvider.select(
                    (state) =>
                        state.items.isNotEmpty &&
                        state.selectedIds.length == state.items.length,
                  ),
                ),
                onTap: () {
                  ref.read(cartProvider.notifier).toggleSelectAll();
                },
              ),
              const SizedBox(width: 8),

              Text(
                "Chọn tất cả ($count)",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
