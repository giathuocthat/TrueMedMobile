import 'package:flutter/material.dart';

import '../../model/category_mock.dart';
import 'drug_categories_section .dart';
import 'shortcut_section.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<CategoryItem> items;

  const CategorySection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),

        // Grid + Scroll ngang + progress bar
        //ShortcutSection(items: items),
        //ShortcutSection(),
        DrugCategoriesSection(items: items),
      ],
    );
  }
}
