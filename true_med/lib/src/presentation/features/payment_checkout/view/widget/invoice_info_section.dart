import 'package:flutter/material.dart';

class InvoiceInfoSection extends StatelessWidget {
  const InvoiceInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    const iconColor = Color(0xFF1F3C88);
    const errorBg = Color(0xFFFDECEA);
    const errorText = Color(0xFFB71C1C);
    const successGreen = Color(0xFF1B5E20);
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
                'Thông tin xuất hoá đơn',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sửa',
                      style: TextStyle(
                        color: Color(0xFF1B5E20),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Hủy yêu cầu',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ---------- INFO ----------
          _InfoRow(
            icon: Icons.person_outline,
            text: 'Nhà thuốc Minh Châu',
            iconColor: iconColor,
          ),
          _InfoRow(
            icon: Icons.storefront_outlined,
            text: 'Nhà Thuốc Minh Châu',
            iconColor: iconColor,
          ),
          _InfoRow(
            icon: Icons.description_outlined,
            text: '8878781257-001',
            iconColor: iconColor,
          ),
          _InfoRow(
            icon: Icons.location_on_outlined,
            text:
                '144 Nguyễn Thanh Đằng, Tổ 5, KP5, Phường. Phước Hiệp, TP. Bà Rịa',
            iconColor: iconColor,
            maxLines: 2,
          ),

          const SizedBox(height: 16),

          // ---------- ERROR BOX ----------
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: errorBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kết quả kiểm tra thông tin mã số thuế của khách hàng\n'
                  'trên TCT: gdt.gov.vn KHÔNG HỢP LỆ.',
                  style: TextStyle(
                    fontSize: 15,
                    color: errorText,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lý do: NNT ngừng HĐ nhưng chưa hoàn thành thủ tục '
                  'chấm dứt hiệu lực MST',
                  style: TextStyle(fontSize: 15, color: errorText, height: 1.4),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Khách hàng vui lòng cập nhật thông tin Mã số thuế hợp lệ '
                  'nếu không hệ thống sẽ không xuất hóa đơn cho đơn hàng.',
                  style: TextStyle(fontSize: 15, color: errorText, height: 1.4),
                ),
                const SizedBox(height: 16),

                // ---------- CTA ----------
                InkWell(
                  onTap: () {
                    // TODO: open invoice edit screen
                  },
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: successGreen,
                        child: Icon(
                          Icons.arrow_forward,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Vui lòng cập nhật thông tin xuất hóa đơn tại đây',
                          style: TextStyle(
                            fontSize: 16,
                            color: successGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final int maxLines;

  const _InfoRow({
    required this.icon,
    required this.text,
    required this.iconColor,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
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
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
