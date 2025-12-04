import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../model/product_mock.dart';
import 'widget/banner_carousel.dart';
import 'widget/header_tab.dart';
import 'widget/home_heaher.dart';
import 'widget/product_card.dart';
import 'widget/promotion_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
      // ⭐ HomeHeader làm appBar, KHÔNG đưa vào Sliver
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: HomeHeader(),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },

        // Vùng scroll duy nhất
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Header tab: Sản phẩm / Mã giảm giá / Tổng quan
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 50,
              flexibleSpace: HeaderTabs(
                //selectedIndex: selectedTab,
                onTap: (i) {
                  //setState(() => selectedTab = i);
                },
              ),
            ),
            // Promo chips
            const SliverToBoxAdapter(
              child: PromoChips(
                items: [
                  "Giảm liền 14K",
                  "Tặng sửa tắm Lifbuoy",
                  "Khuyến mãi 3",
                  "Khuyến mãi 4",
                  "Tặng sửa tắm Lifbuoy 122",
                  "Khuyến mãi 5",
                ],
              ),
            ),

            const SliverToBoxAdapter(child: BannerCarousel()),
            // Banner
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=60',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // “Sản phẩm mới”
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Text(
                  "Sản phẩm mới",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
            ),

            // Grid sản phẩm
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: ratio,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ProductCard(product: mockProducts[index]);
                }, childCount: mockProducts.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 55;
  @override
  double get maxExtent => 55;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            "Sản phẩm",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 24),
          Text("Mã giảm giá", style: TextStyle(fontSize: 16)),
          const SizedBox(width: 24),
          Text("Tổng quan", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _HeaderTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TabItem(icon: Icons.store, text: "Sản phẩm"),
          _Divider(),
          _TabItem(icon: Icons.discount, text: "Mã giảm giá"),
          _Divider(),
          _TabItem(icon: Icons.grid_view, text: "Tổng quan"),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _TabItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 24, color: Colors.grey.shade300);
  }
}
