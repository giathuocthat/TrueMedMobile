import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../shared/widget/price_row.dart';
import '../../../../shared/widget/product_card_cart.dart';
import '../../../../shared/widget/payment_footer.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/product_card.dart';
import '../model/cart_oder_mock.dart';
import 'cart_product_item.dart';
import 'cart_product_item_swipe.dart';
import 'cart_shop_header.dart';
import 'cart_shop_voucher_section.dart';
import 'total_discount_section.dart';

class CartOrderPage extends ConsumerStatefulWidget {
  const CartOrderPage({super.key});

  @override
  ConsumerState<CartOrderPage> createState() => _CartOrderPageState();
}

class _CartOrderPageState extends ConsumerState<CartOrderPage> {
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
        child: PageHeader(title: context.locale.cart, showBack: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              // children: cart.map((shop) {
              //   return Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CartShopHeader(
              //         shopName: shop.shopName,
              //         logoUrl: shop.shopLogo,
              //       ),
              //       ...shop.products.map(
              //         (p) => CartProductItemWithSwipe(
              //           product: p,
              //           onDelete: () {},
              //           child: CartProductItem(product: p),
              //         ),
              //       ),
              //       const Divider(height: 1, color: Colors.grey),
              //       CartShopVoucherSection(shopId: shop.shopId),
              //       TotalDiscountSection(shopId: shop.shopId),

              //       const SizedBox(height: 12),
              //     ],
              //   );
              // }).toList(),
              children: listCard.items.map((item) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CartShopHeader(
                    //   shopName: shop.shopName,
                    //   logoUrl: shop.shopLogo,
                    // ),
                    ...listCard.items.map(
                      (p) => CartProductItemWithSwipe(
                        product: p.product,
                        onDelete: () {},
                        child: CartProductItem(product: p.product),
                      ),
                    ),
                    const Divider(height: 1, color: Colors.grey),

                    //CartShopVoucherSection(shopId: shop.shopId),
                    //TotalDiscountSection(shopId: shop.shopId),
                    const SizedBox(height: 12),
                  ],
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 230, child: PaymentFooter(context)),
        ],
      ),
    );
  }
}
