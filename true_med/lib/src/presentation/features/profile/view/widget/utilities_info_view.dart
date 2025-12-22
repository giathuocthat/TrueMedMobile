import 'package:flutter/material.dart';

import 'menu_item.dart';

class UtilitiesInfoSection extends StatelessWidget {
  const UtilitiesInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuItem(icon: Icons.person_outline, title: 'Đơn hàng của tôi'),
        // MenuItem(
        //   icon: Icons.business_outlined,
        //   title: 'Thông tin doanh nghiệp',
        // ),
        // MenuItem(icon: Icons.storage_outlined, title: 'Điểm tích lũy'),
        MenuItem(
          icon: Icons.social_distance_outlined,
          title: 'Giới thiệu bạn bè',
        ),
        // MenuItem(
        //   icon: Icons.account_balance_outlined,
        //   title: 'Tài khoản ngân hàng',
        // ),
      ],
    );
  }
}
