import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../shared/widget/payment_footer.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../../core/widgets/page_header.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/product_card.dart';

class CartOrderPage extends ConsumerStatefulWidget {
  const CartOrderPage({super.key});

  @override
  ConsumerState<CartOrderPage> createState() => _CartOrderPageState();
}

class _CartOrderPageState extends ConsumerState<CartOrderPage> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(logoutProvider, (previous, next) {
      if (next.isSuccess) context.pushReplacementNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(logoutProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 36) / 2; // padding tổng
    double itemHeight = 340; // ⬅️ chiều cao bạn muốn
    final ratio = itemWidth / itemHeight;

    return Scaffold(
      body: Column(
        children: [
          //PageHeader(title: context.locale.profile), // ⭐ đặt header lên đầu
          PageHeader(
            title: context.locale.cart,
            showBack: true,
          ), // ⭐ đặt header lên đầu
          Expanded(
            // ⭐ nội dung HomePage phía dưới
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(12),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: ratio,
                    ),
                    itemCount: mockProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: mockProducts[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 230, child: PaymentFooter(context)),
        ],
      ),
    );
  }
}
