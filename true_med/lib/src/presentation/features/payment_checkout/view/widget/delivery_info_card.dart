import 'package:flutter/material.dart';

class DeliveryInfoCard extends StatelessWidget {
  const DeliveryInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    const iconColor = Color(0xFF2E3192); // xanh tím giống hình
    const textColor = Colors.black87;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- HEADER ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thông tin giao hàng',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  // TODO: handle edit
                },
                child: const Text(
                  'Sửa',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1B5E20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ---------- NAME ----------
          const _InfoRow(
            icon: Icons.person_outline,
            iconColor: iconColor,
            text: 'Nhà thuốc',
            textColor: textColor,
          ),

          const SizedBox(height: 10),

          // ---------- PHONE ----------
          const _InfoRow(
            icon: Icons.phone_outlined,
            iconColor: iconColor,
            text: '0933 575 056',
            textColor: textColor,
          ),

          const SizedBox(height: 10),

          // ---------- ADDRESS ----------
          const _InfoRow(
            icon: Icons.location_on_outlined,
            iconColor: iconColor,
            text:
                '144 Nguyễn Thanh Đằng, Phường Phước Hiệp, Thành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu',
            textColor: textColor,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final int maxLines;

  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.textColor,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: maxLines > 1
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 22, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, color: textColor, height: 1.4),
          ),
        ),
      ],
    );
  }
}
