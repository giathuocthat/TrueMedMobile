import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/string.dart';
import '../../presentation/core/router/routes.dart';
import 'money_section.dart';
import 'promotion_section.dart';

class PaymentFooter extends StatelessWidget {
  final double items;
  final double totalMoney;
  final double totalMoneyDiscount;
  final int totalItems;

  const PaymentFooter(
    BuildContext context, {
    super.key,
    required this.items,
    required this.totalMoney,
    required this.totalMoneyDiscount,
    required this.totalItems,
  });

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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: PromotionSection(totalCartChecked: totalItems),
          ),
          Divider(height: 20, thickness: 1, color: Colors.grey.shade300),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                const Spacer(),
                MoneySection(
                  totalMoneyFomart: totalMoney.toCurrency(true),
                  totalMoneyDiscountFomart: totalMoneyDiscount.toCurrency(true),
                  onCheckout: () {
                    if (totalMoney <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Vui lòng chọn sản phẩm')),
                      );
                      return;
                    }
                    context.pushNamed(Routes.paymentCheckout);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget PaymentFooter(
//   BuildContext context,
//   double items,
//   double totalMoney,
//   double totalMoneyDiscount,
//   int totalItems,
// ) {
//   ;
// }
