import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final bool isCash;
  final bool isNoChagePay;
  const PaymentMethodCard({
    super.key,
    required this.isCash,
    required this.isNoChagePay,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: mở chọn phương thức thanh toán
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- HEADER --------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Phương thức thanh toán',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                if (!isNoChagePay) ...[
                  const Icon(Icons.chevron_right, size: 28, color: Colors.grey),
                ],
              ],
            ),

            const SizedBox(height: 12),
            if (isCash) ...const [
              Row(
                children: [
                  // Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tiền mặt khi nhận hàng',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ] else ...const [
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
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Phí 2.200đ + 2.3% giao dịch',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
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
          ],
        ),
      ),
    );
  }
}
