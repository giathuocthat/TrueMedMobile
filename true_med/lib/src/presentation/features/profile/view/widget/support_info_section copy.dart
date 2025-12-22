import 'package:flutter/material.dart';

import 'menu_item.dart';

class PolicyInfoSection extends StatelessWidget {
  const PolicyInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuItem(icon: Icons.person_outline, title: 'Điều khoản dịch vụ'),
        MenuItem(icon: Icons.business_outlined, title: 'Chính sách bảo mật'),
        MenuItem(icon: Icons.business_outlined, title: 'Đăng xuất'),
      ],
    );
  }
}
