import 'package:flutter/material.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title("Chi tiết đơn hàng"),

          _row("Tổng số lượng", "2 sản phẩm"),
          _row("Tổng tiền hàng", "2.957.000đ"),

          _dashedDivider(),

          _row("Phí vận chuyển", "0đ"),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _row("Phí tiện ích", "71.500đ"),
              const SizedBox(height: 4),
              Text(
                "Phí 2.200đ + 2.30% giao dịch",
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
            ],
          ),

          _dashedDivider(),

          _row("Tổng ưu đãi", "-15.000đ", valueColor: Colors.red),

          const SizedBox(height: 8),

          _bulletRow("Mã DDMEDX-DEC13-1238-BD", "-15.000đ"),

          _bulletRow("Mã BMSE_T12_AMOXSP", "x1 🎁", valueColor: Colors.blue),

          _dashedDivider(),

          _row(
            "Tổng thanh toán",
            "3.013.500đ",
            isBold: true,
            valueColor: Colors.green.shade700,
          ),

          const SizedBox(height: 16),

          _noteInput(),

          const SizedBox(height: 16),

          _terms(),

          const SizedBox(height: 8),

          _policyText(),
        ],
      ),
    );
  }

  // ---------- Components ----------

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _row(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• "),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: valueColor ?? Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _dashedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount = (constraints.maxWidth / 8).floor();
          return Row(
            children: List.generate(
              dashCount,
              (_) => Expanded(
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _noteInput() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "Nhập ghi chú",
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _terms() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (_) {},
          activeColor: Colors.green.shade700,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 14),
              children: [
                const TextSpan(text: "Tôi đồng ý với "),
                TextSpan(
                  text: "Điều khoản sử dụng",
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _policyText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "1. Buymed được phép huỷ đơn của bạn nếu giá thị trường biến động lớn hơn 5% giá trị đơn hàng.",
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(height: 4),
        Text(
          "2. Số lượng sản phẩm khi giao có thể không đảm bảo đúng nhu cầu ban đầu tuỳ thuộc vào nhà cung cấp.",
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
