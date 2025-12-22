import 'package:flutter/material.dart';

class PaymentInfoSection extends StatefulWidget {
  const PaymentInfoSection({super.key});

  @override
  State<PaymentInfoSection> createState() => _PaymentInfoSectionState();
}

class _PaymentInfoSectionState extends State<PaymentInfoSection>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          const Row(
            children: [
              Icon(Icons.receipt_long, color: Color(0xFF1B5E20), size: 20),
              SizedBox(width: 8),
              Text(
                'Thanh Toán',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ===== ALWAYS SHOWN (KHI THU GỌN) =====
          _infoItem('Người Nhận Hàng', 'Nhà thuốc'),

          // ===== EXPAND CONTENT =====
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                _infoItem(
                  'Địa Chỉ Giao Hàng',
                  '144 Nguyễn Thanh Đằng, Phường Phước Hiệp, '
                      'Thành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu',
                ),
                _infoItem('Số Điện Thoại', '0933575056'),
                _infoItem('Email', 'nhathuocminhchau.brvt@gmail.com'),
                _infoItem(
                  'Hình Thức Thanh Toán',
                  'Thanh toán tiền mặt khi nhận hàng',
                ),
                _infoItem('Hình Thức Giao Hàng', 'Giao hàng tiêu chuẩn'),
                _infoItem('Đơn Vị Vận Chuyển', 'Chưa có'),
                _infoItem('Mã Vận Đơn', 'Chưa có'),
                _infoItem('Ghi Chú', ''),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ===== TOGGLE BUTTON =====
          Center(
            child: InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _expanded ? 'Ẩn' : 'Xem Thêm',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF1A237E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: const Color(0xFF1A237E),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 4),
          Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
