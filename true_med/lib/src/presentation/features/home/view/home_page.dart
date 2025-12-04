import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../model/category_mock.dart';
import '../model/product_mock.dart';
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
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey.shade200,
                child: Column(
                  children: [if (state.isLoading) const LoadingIndicator()],
                ),
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
