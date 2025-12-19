import 'package:flutter/material.dart';

class OrderSummarySection extends StatelessWidget {
  final String itemsFormat;
  final String moneyTotalFormat;
  final String moneySubFormat;
  final String moneyServiceFeeFormat;
  final String? moneyServiceFeeSubTitle;
  final String moneyShippingFormat;
  final String? moneyTotalDiscountFormart;
  final String moneyFinalFormat;
  final List<String>? promoCodes;

  const OrderSummarySection({
    super.key,
    required this.itemsFormat,
    required this.moneyTotalFormat,
    required this.moneySubFormat,
    required this.moneyServiceFeeFormat,
    this.moneyServiceFeeSubTitle,
    required this.moneyShippingFormat,
    required this.moneyFinalFormat,
    this.moneyTotalDiscountFormart,
    this.promoCodes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title("Chi tiết đơn hàng"),

          _row("Tổng số lượng", itemsFormat),
          _row("Tổng tiền hàng", moneySubFormat),

          _dashedDivider(),

          _row("Phí vận chuyển", moneyShippingFormat),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _row("Phí tiện ích", moneyServiceFeeFormat),
              if (moneyServiceFeeSubTitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  moneyServiceFeeSubTitle!,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ],
          ),

          _dashedDivider(),
          if (moneyTotalDiscountFormart != null) ...[
            _row(
              "Tổng ưu đãi",
              moneyTotalDiscountFormart ?? '',
              valueColor: Colors.red,
            ),
            if (promoCodes != null)
              ...promoCodes!.map(
                (code) =>
                    _bulletRow("Mã $code", "x1 🎁", valueColor: Colors.blue),
              ),

            //_bulletRow("Mã BMSE_T12_AMOXSP", "x1 🎁", valueColor: Colors.blue),
            _dashedDivider(),
          ],

          _row(
            "Tổng thanh toán",
            moneyFinalFormat,
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "1. TrueMed được phép huỷ đơn của bạn nếu giá thị trường biến động lớn hơn 5% giá trị đơn hàng.",
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
