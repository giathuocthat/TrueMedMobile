import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  Widget _row(String label, Widget value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150, // cố định cột trái
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6B6B6B)),
            ),
          ),
          Expanded(child: value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _row(
            'Dự Kiến Giao Hàng',
            const Text(
              'Thứ Hai (15/12/2025)',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
          _row(
            'Mã Đơn',
            const Text('37101310', style: TextStyle(fontSize: 11)),
          ),
          _row(
            'Thanh Toán',
            const Text(
              '2.942.000đ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
          ),
          _row(
            'Hình Thức Thanh Toán',
            const Text(
              'Thanh toán tiền mặt khi nhận hàng',
              style: TextStyle(fontSize: 11),
            ),
          ),
          _row(
            'Xuất Hóa Đơn',
            const Text('Chưa yêu cầu', style: TextStyle(fontSize: 11)),
          ),

          const SizedBox(height: 2),
          _row(
            '',
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  // TODO: xử lý chỉnh sửa
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Chỉnh sửa',
                      style: TextStyle(
                        color: Color(0xFF3F51E3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.edit, size: 20, color: Color(0xFF3F51E3)),
                  ],
                ),
              ),
            ),
          ),

          /// ---- ACTION ----
        ],
      ),
    );
  }
}
