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
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 8),
        DrugCategoriesSection(items: items),
      ],
    );
  }
}
