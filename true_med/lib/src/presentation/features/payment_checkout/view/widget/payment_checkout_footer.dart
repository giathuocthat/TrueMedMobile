import 'package:flutter/material.dart';

import '../../../../../core/extensions/string.dart';
import 'money_section_checkout.dart';

class PaymentCheckOutFooter extends StatelessWidget {
  const PaymentCheckOutFooter({
    super.key,
    required this.totalMoney,
    required this.totalMoneyDiscount,
    required this.onCheckout,
  });

  final double totalMoney;
  final double totalMoneyDiscount;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
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
                  onCheckout: onCheckout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
