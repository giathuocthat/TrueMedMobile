import 'package:flutter/material.dart';

import '../../model/shortcut_Item_mock.dart';
import 'scroll_indicator_bar.dart';
import 'shortcurt_card.dart';

class ShortcutSection extends StatefulWidget {
  const ShortcutSection({super.key});

  @override
  State<ShortcutSection> createState() => _ShortcutSectionState();
}

class _ShortcutSectionState extends State<ShortcutSection> {
  final ScrollController _scrollController = ScrollController();
  double progress = 0; // 0–1

  static const int itemsPerPage = 6; // 2 hàng x 3 cột

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
    final pageCount = (shortcutItems.length / itemsPerPage).ceil();

    return SizedBox(
      height: 280, // đủ cho 2 hàng card + indicator
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
                itemCount: shortcutItems.length,
                itemBuilder: (context, index) {
                  final item = shortcutItems[index];
                  return ShortcutCard(item: item);
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
