import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widget/icon_with_badge.dart';
import '../../../core/router/routes.dart';
import '../../application/cart/riverpod/cart_provider.dart';

class ProductDetailHeader extends ConsumerStatefulWidget {
  //final Widget banner; // Banner ở trên cùng
  final double bannerHeight; // Chiều cao banner
  final List<Widget> body; // Nội dung bên dưới banner
  final Widget searchBar; // AppBar search
  final Widget? floatingActions; // Nút Back - Bell - Cart
  final Color appBarColor;
  final double fadeHeight;
  final Future<void> Function()? onRefresh;
  final Widget footerPayment; // Footer payment cố định đáy

  const ProductDetailHeader({
    super.key,
    //required this.banner,
    this.bannerHeight = 300,
    required this.body,
    required this.searchBar,
    this.floatingActions,
    this.onRefresh,
    this.fadeHeight = 140,
    this.appBarColor = const Color(0xFF0B4D2C),
    required this.footerPayment,
  });

  @override
  ConsumerState<ProductDetailHeader> createState() =>
      _ProductDetailHeaderState();
}

class _ProductDetailHeaderState extends ConsumerState<ProductDetailHeader> {
  double offset = 0;
  //final safeTop = MediaQuery.of(context).padding.top;
  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    final safeBottom = MediaQuery.of(context).padding.bottom;
    final qty = ref.watch(cartProvider.select((s) => s.totalQuantity));

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: widget.onRefresh ?? () async {},
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.axis == Axis.vertical) {
                  setState(() => offset = n.metrics.pixels);
                }

                return false;
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // CHỪA CHỖ CHO BANNER
                        //SizedBox(height: widget.bannerHeight),

                        // BODY CONTENT
                        ...widget.body,

                        SizedBox(height: safeBottom + 80), // tránh đè footer
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =======================================================
          //             FLOATING BUTTONS (BACK – CART – ETC)
          // =======================================================
          if (widget.floatingActions != null)
            Positioned(
              top: safeTop + 16,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: offset < 20 ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: widget.floatingActions!,
              ),
            ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,

            child: Container(
              color: widget.appBarColor.withOpacity(
                (offset / widget.fadeHeight).clamp(0, 1),
              ),

              child: SafeArea(
                bottom: false,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: offset < 20 ? 0 : 56,

                  child: Row(
                    children: [
                      // LEADING
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: offset > 30 ? 1 : 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      Expanded(
                        child: Opacity(
                          opacity: (offset / 120).clamp(0, 1),
                          child: widget.searchBar,
                        ),
                      ),

                      // ACTIONS
                      Row(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 150),
                            opacity: offset > 30 ? 1 : 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: IconWithBadge(
                                icon: Icons.notifications,
                                badge: '3',
                                onTap: () =>
                                    context.pushNamed(Routes.notification),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 150),
                            opacity: offset > 30 ? 1 : 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: IconWithBadge(
                                icon: Icons.shopping_cart,
                                badge: '$qty',

                                onTap: () =>
                                    context.pushNamed(Routes.cartOrder),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ==========================================
          //               FOOTER PAYMENT FIXED
          // ==========================================
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: widget.footerPayment,
            ),
          ),
        ],
      ),
    );
  }
}
