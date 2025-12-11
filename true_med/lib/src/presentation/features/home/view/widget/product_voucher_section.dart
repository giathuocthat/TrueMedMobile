import 'package:flutter/material.dart';

import '../../../../../shared/widget/voucher_ticket.dart';

class ProductVoucherSection extends StatelessWidget {
  final List<String> items;

  const ProductVoucherSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0B4D2C);

    return SizedBox(
      height: 44,
      //padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return VoucherTicket(text: items[index]);
        },
      ),
    );
  }
}
