import 'package:flutter/material.dart';

import 'menu_item.dart';

class SupportInfoSection extends StatelessWidget {
  const SupportInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuItem(icon: Icons.person_outline, title: 'Hướng dẫn đặt hàng'),
        MenuItem(icon: Icons.business_outlined, title: 'Hot line 1900123456'),
      ],
    );
  }
}
