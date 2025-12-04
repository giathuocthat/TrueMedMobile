import 'package:flutter/material.dart';

import '../../model/shortcut_Item_mock.dart';
import 'page_progress_bar.dart';
import 'shortcurt_card.dart';

class ShortcutSection extends StatefulWidget {
  const ShortcutSection({super.key});

  @override
  State<ShortcutSection> createState() => _ShortcutSectionState();
}

class _ShortcutSectionState extends State<ShortcutSection> {
  final PageController _pageController = PageController(viewportFraction: 0.94);
  int _currentPage = 0;

  static const int itemsPerPage = 6; // 2 hàng x 3 cột

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageCount = (shortcutItems.length / itemsPerPage).ceil();

    return SizedBox(
      height: 300, // đủ cho 2 hàng card + indicator
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pageCount,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, pageIndex) {
                final start = pageIndex * itemsPerPage;
                final end = (start + itemsPerPage).clamp(
                  0,
                  shortcutItems.length,
                );
                final pageItems = shortcutItems.sublist(start, end);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                );
              },
            ),
          ),

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pageCount, (index) {
              final bool active = index == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 6,
                width: active ? 32 : 18,
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xFF0B8A3B)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(999),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
