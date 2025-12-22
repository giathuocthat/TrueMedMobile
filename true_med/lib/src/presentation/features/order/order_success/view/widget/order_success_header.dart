import 'package:flutter/material.dart';

class OrderSuccessHeader extends StatelessWidget {
  const OrderSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      color: const Color(0xFF1B5E20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24), // canh tay cho status bar

          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 6),
            ),
            child: const Icon(
              Icons.hourglass_empty,
              size: 24,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Đặt hàng thành công',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Cảm ơn bạn đã đặt hàng bằng hình thức Thanh toán tiền mặt khi nhận hàng tại TrueMed!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}
