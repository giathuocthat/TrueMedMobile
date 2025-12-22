import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/product_model.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../shared/widget/icon_with_badge.dart';
import '../../../../shared/widget/product_cart_footer.dart';
import '../../../core/application_state/logout_provider/logout_state.dart';
import '../../../core/router/routes.dart';
import '../../application/cart/riverpod/cart_provider.dart';
import '../../home/view/widget/html_section.dart';
import '../../home/view/widget/product_banner_carousel.dart';
import '../../home/view/widget/product_info_section.dart';
import '../../home/view/widget/product_promotion_section.dart';
import '../riverpod/product_detail_provider.dart';
import '../riverpod/product_detail_state.dart';
import 'product_detail_header.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final int productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late ProductResponseModel product;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailProvider(widget.productId));
    final qty = ref.watch(cartProvider.select((s) => s.totalQuantity));
    final product = state.productDetail;

    return Scaffold(
      body: ProductDetailHeader(
        fadeHeight: 180,
        searchBar: _buildSearchBar(),
        floatingActions: _buildFloatingActions(context, qty, 0),

        // 🔥 QUAN TRỌNG
        body: _buildBody(state, product),

        footerPayment: _buildFooter(context, state, product),
      ),
    );
  }

  List<Widget> _buildBody(
    ProductDetailState state,
    ProductResponseEntity? product,
  ) {
    switch (state.status) {
      case Status.loading:
        return const [
          ProductBannerSkeleton(),
          SizedBox(height: 12),
          ProductInfoSkeleton(),
          SizedBox(height: 12),
          ProductPromotionSkeleton(),
          SizedBox(height: 80),
        ];

      case Status.error:
        return [
          const SizedBox(height: 200),
          Center(child: Text(state.error ?? 'Có lỗi xảy ra')),
        ];

      case Status.success:
        if (product == null) return const [];

        return [
          ProducBannerCarousel(listImages: product?.images ?? []),
          ProductInfoSection(product: product),
          const SizedBox(height: 12),
          const ProductPromotionSection(),
          if (product.fullDescription != null)
            HtmlSection(html: product.fullDescription!),
          const SizedBox(height: 80),
        ];
      case Status.initial:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}

class ProductBannerSkeleton extends StatelessWidget {
  const ProductBannerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class ProductInfoSkeleton extends StatelessWidget {
  const ProductInfoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _line(200),
          const SizedBox(height: 8),
          _line(120),
          const SizedBox(height: 16),
          _line(double.infinity, height: 20),
          const SizedBox(height: 6),
          _line(double.infinity, height: 20),
        ],
      ),
    );
  }

  Widget _line(double width, {double height = 16}) {
    return Container(width: width, height: height, color: Colors.grey.shade300);
  }
}

class ProductPromotionSkeleton extends StatelessWidget {
  const ProductPromotionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

Widget _buildFooter(
  BuildContext context,
  ProductDetailState state,
  ProductResponseEntity? product,
) {
  if (state.status == Status.loading) {
    return const SizedBox(
      height: 140,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  if (product == null) {
    return const SizedBox(height: 140);
  }

  return SizedBox(
    height: 140,
    child: ProductCartFooter(context, product: product),
  );
}

Widget _buildSearchBar() {
  return Container(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
    ),
    child: const Row(
      children: [
        Icon(Icons.search, color: Colors.grey),
        SizedBox(width: 8),
        Text("Tìm kiếm", style: TextStyle(color: Colors.grey)),
      ],
    ),
  );
}

Widget _buildFloatingActions(BuildContext context, int qty, int notification) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _floatingBtn(
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),

        Row(
          children: [
            _floatingBtn(
              Center(
                child: IconWithBadge(
                  icon: Icons.notifications_none,
                  badge: notification.toString(),
                  onTap: () => context.pushNamed(Routes.notification),
                ),
              ),
            ),
            const SizedBox(width: 10),
            _floatingBtn(
              Center(
                child: IconWithBadge(
                  icon: Icons.shopping_cart_outlined,
                  badge: qty.toString(),
                  onTap: () => context.pushNamed(Routes.cartOrder),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _floatingBtn(Widget child) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.06),
      shape: BoxShape.circle,
    ),
    child: child,
  );
}
