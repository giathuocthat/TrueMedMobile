import 'package:flutter/material.dart';

import '../../model/category_mock.dart';
import '../../model/shortcut_Item_mock.dart';

class DrugCard extends StatelessWidget {
  final CategoryItem item;

  const DrugCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ICON
          Image.asset(
            item.iconPath,
            //"assets/icons/${item.iconPath}",
            //'assets/images/banner_2.png',
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),

          const SizedBox(height: 12),

          // TITLE 2 LINES + ELLIPSIS
          Text(
            item.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
