import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../shared/widget/payment_footer.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../cart_order/model/cart_oder_mock.dart';
import '../../cart_order/view/cart_product_item.dart';
import '../../cart_order/view/cart_product_item_swipe.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final int productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    // ref.listenManual(logoutProvider, (previous, next) {
    //   if (next.isSuccess) context.pushReplacementNamed(Routes.login);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final listCard = ref.watch(cartProvider);

    final cart = mockCartData;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: PageHeader(title: context.locale.detail, showBack: true),
      ),
      body: Column(
        children: [
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
                        ref.read(cartProvider.notifier).remove(item.product);
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

          SizedBox(height: 230, child: PaymentFooter(context)),
        ],
      ),
    );
  }
}
