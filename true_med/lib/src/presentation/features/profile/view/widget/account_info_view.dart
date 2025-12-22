import 'package:flutter/material.dart';

import 'menu_item.dart';

class AccountInfoView extends StatelessWidget {
  const AccountInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuItem(icon: Icons.person_outline, title: 'Thông tin tài khoản'),
        // MenuItem(
        //   icon: Icons.business_outlined,
        //   title: 'Thông tin doanh nghiệp',
        // ),
        // MenuItem(icon: Icons.storage_outlined, title: 'Điểm tích lũy'),
        MenuItem(
          icon: Icons.local_shipping_outlined,
          title: 'Thông tin giao hàng',
        ),
        // MenuItem(
        //   icon: Icons.account_balance_outlined,
        //   title: 'Tài khoản ngân hàng',
        // ),
      ],
    );
  }
}
