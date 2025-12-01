import 'package:flutter/material.dart';
import '../../../../core/widgets/app_search_bar.dart';
import 'package:go_router/go_router.dart';

class SearchHeader extends StatelessWidget {
  final TextEditingController controller;

  const SearchHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B4D2C),
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 12),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 16),

          // Focusable search bar
          Expanded(
            child: AppSearchBar(
              hint: "Tìm kiếm",
              autoFocus: true,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
