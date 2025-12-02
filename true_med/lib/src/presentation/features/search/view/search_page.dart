import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/product_card.dart';
import 'widget/search_hearder.dart';
//import 'widget/home_heaher.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchController = TextEditingController();

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
          SearchHeader(controller: searchController), // ⭐ đặt header lên đầu
          Padding(
            padding: EdgeInsets.all(8),
            child: ProductCard(product: mockProducts[0]),
          ),
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
        ],
      ),
    );
  }
}
