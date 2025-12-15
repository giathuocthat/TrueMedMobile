import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: mở chọn phương thức thanh toán
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- HEADER --------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phương thức thanh toán',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Icon(Icons.chevron_right, size: 28, color: Colors.grey),
              ],
            ),

            SizedBox(height: 12),

            // -------- CONTENT --------
            Row(
              children: [
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thẻ Visa',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Phí 2.200đ + 2.3% giao dịch',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                // Visa logo
                Icon(Icons.credit_card, size: 28, color: Colors.grey),
                // Image.asset(
                //   'assets/images/visa.png',
                //   width: 48,
                //   height: 30,
                //   fit: BoxFit.contain,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
