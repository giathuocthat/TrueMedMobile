import 'package:flutter/material.dart';

import '../../model/category_mock.dart';
import '../../model/shortcut_Item_mock.dart';
import 'drug_card.dart';
import 'scroll_indicator_bar.dart';
import 'shortcurt_card.dart';

class DrugCategoriesSection extends StatefulWidget {
  final List<CategoryItem> items;
  const DrugCategoriesSection({super.key, required this.items});

  @override
  State<DrugCategoriesSection> createState() => _DrugCategoriesSectionState();
}

class _DrugCategoriesSectionState extends State<DrugCategoriesSection> {
  final ScrollController _scrollController = ScrollController();
  double progress = 0; // 0–1

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;

      setState(() {
        progress = max == 0 ? 0 : (_scrollController.offset / max);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210, // đủ cho 2 hàng card + indicator
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 hàng
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1.2, // tỉ lệ card
                ),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return DrugCard(item: item);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          ScrollIndicator(progress: progress, indicatorWidth: 18, barWidth: 60),
        ],
      ),
    );
  }
}
