import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../core/router/routes.dart';
import '../../../../../shared/widget/money_section.dart';
import 'money_section_checkout.dart';

Widget PaymentCheckOutFooter(
  BuildContext context,
  double totalMoney,
  double totalMoneyDiscount,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              const Spacer(),
              MoneySectionCheckout(
                totalMoneyFomart: totalMoney.toCurrency(true),
                totalMoneyDiscountFomart: totalMoneyDiscount.toCurrency(true),
                onCheckout: () => context.pushNamed(Routes.paymentCheckout),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
