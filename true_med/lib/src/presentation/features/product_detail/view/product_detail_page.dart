import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/product_model.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../shared/widget/product_cart_footer.dart';
import '../../../core/application_state/logout_provider/logout_state.dart';
import '../../home/view/widget/html_section.dart';
import '../../home/view/widget/product_banner_carousel.dart';
import '../../home/view/widget/product_info_section.dart';
import '../../home/view/widget/product_promotion_section.dart';
import '../riverpod/product_detail_provider.dart';
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
    // ref.listenManual(logoutProvider, (previous, next) {
    //   if (next.isSuccess) context.pushReplacementNamed(Routes.login);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailProvider(widget.productId));
    final ProductResponseEntity? productDetail = state.productDetail;

    if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == Status.error) {
      return Center(child: Text(state.error ?? 'Detail Có lỗi xảy ra'));
    }
    return Scaffold(
      body: ProductDetailHeader(
        fadeHeight: 180,
        searchBar: Container(
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
        ),

        floatingActions: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _floatingBtn(Icons.arrow_back),

              Row(
                children: [
                  _floatingBtn(Icons.notifications_none),
                  const SizedBox(width: 10),
                  _floatingBtn(Icons.shopping_cart_outlined),
                ],
              ),
            ],
          ),
        ),

        body: [
          ProducBannerCarousel(listImages: productDetail?.images ?? []),
          //const ProductPromoHeader(),
          ProductInfoSection(product: productDetail!),
          const SizedBox(height: 12),

          // Mã giảm giá section
          const ProductPromotionSection(),
          const SizedBox(height: 12),

          // Mua kèm deal tốt
          // const ProductBuyWithDealSection(),

          /// Mô tả sản phẩm
          if (productDetail.fullDescription != null)
            HtmlSection(html: productDetail.fullDescription ?? ''),
          const SizedBox(height: 80),
        ],

        // ========================
        //     FOOTER PAYMENT
        // ========================
        footerPayment: SizedBox(
          height: 140,
          child: ProductCartFooter(context, product: productDetail),
        ),
      ),
    );
  }

  static Widget _floatingBtn(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black54),
    );
  }
}
