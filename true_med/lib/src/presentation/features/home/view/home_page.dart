import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/product_entity.dart';
import '../model/category_mock.dart';
import '../riverpod/product_provider.dart';
import '../riverpod/product_state.dart';
import 'widget/banner_carousel.dart';
import 'widget/category_section.dart';
import 'widget/header_tab.dart';
import 'widget/home_heaher.dart';
import 'widget/product_card.dart';
import 'widget/promotion_section.dart';
import 'widget/shortcut_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 36) / 2; // padding tổng
    double itemHeight = 340; // ⬅️ chiều cao bạn muốn
    final ratio = itemWidth / itemHeight;

    final state = ref.watch(productProvider);
    final List<ProductResponseEntity> products = state.productPage?.data ?? [];

    if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == Status.error) {
      return Center(child: Text(state.error ?? 'Có lỗi xảy ra'));
    }
    return Scaffold(
      // ⭐ HomeHeader làm appBar, KHÔNG đưa vào Sliver
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: HomeHeader(),
      ),

      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(productProvider.notifier).refreshAll(), // <- dùng hàm mới
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

            // Promotion section + Banner carousel
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey.shade200, // chung background
                padding: const EdgeInsets.only(bottom: 10, top: 12),
                child: const Column(
                  children: [
                    PromoChips(
                      items: [
                        "Giảm liền 14K",
                        "Tặng sữa tắm Lifebuoy",
                        "Khuyến mãi 3",
                        "Khuyến mãi 4",
                        "Tặng sữa tắm Lifebuoy 122",
                        "Khuyến mãi 5",
                      ],
                    ),
                    SizedBox(height: 8),
                    BannerCarousel(),
                  ],
                ),
              ),
            ),

            // Shortcut section
            //SliverToBoxAdapter(child: ShortcutSection()),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white30, // chung background
                padding: const EdgeInsets.only(bottom: 10, top: 12),
                child: const ShortcutSection(),
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
                  return ProductCard(product: products[index]);
                }, childCount: products.length),
              ),
            ),

            // “Sản phẩm mới 1”
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Text(
                  "Sản phẩm mới 1",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
            ),

            // // Banner
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

            // Category section
            SliverToBoxAdapter(
              child: Container(
                color: const Color.fromARGB(
                  255,
                  210,
                  248,
                  221,
                ), // chung background
                padding: const EdgeInsets.only(bottom: 10, top: 12),
                child: CategorySection(
                  title: "Nhóm thuốc",
                  items: drugCategories,
                ),
              ),
            ),

            // // Banner
            // SliverToBoxAdapter(child: ShortcutSection()),

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
          ],
        ),
      ),
    );
  }
}
