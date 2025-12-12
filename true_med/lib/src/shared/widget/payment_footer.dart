import 'package:flutter/material.dart';

import '../../core/extensions/string.dart';
import 'money_section.dart';
import 'promotion_section.dart';

Widget PaymentFooter(
  BuildContext context,
  double totalMoney,
  double totalQuantity,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          offset: const Offset(0, -2),
          blurRadius: 10,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: PromotionSection(),
        ),
        Divider(height: 20, thickness: 1, color: Colors.grey.shade300),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              const Spacer(),
              MoneySection(
                totalMoneyFomart: totalMoney.toCurrency(true),
                totalMoneyDiscountFomart: 0.toCurrency(true),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
