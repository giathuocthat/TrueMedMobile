import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_sheet.dart';
import '../../../home/model/product_mock.dart';
import 'dashed_divider.dart';
import 'product_list_sheet.dart';

class OrderProductSection extends StatelessWidget {
  const OrderProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _Header(),
          //const Divider(height: 1),
          Divider(height: 1, color: Colors.grey.shade300),
          _ShopRow(),
          //const Divider(height: 1),
          Divider(height: 1, color: Colors.grey.shade300),
          _ProductItem(),
          const SizedBox(height: 2),
          //const Divider(thickness: 1, height: 1),
          const DashedDivider(),
          _ViewAll(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Danh sách sản phẩm',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text('Số lượng: 25', style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

class _ShopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = ProductMock(
      name: "Neutri Fore Bidiphar (hộp/100 Viên Nén)",
      name_stock: "Hôp 10 vĩ, mỗi vĩ 10 Viên Nén",
      image:
          "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
      manufacturer: "Bidiphar",
      price: 127100,
      oldPrice: 141800,
      discount: 3,
      isShowStock: true,
      hasAlternative: true,
      isDiscount: true,
      isCombo: false,
      isPromotion: true,
      isNearOut: true,
      stock: 947,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Image.network(
            product.image ?? '',
            fit: BoxFit.contain,
            width: 24,
            height: 24,
          ),
          //Image.asset('assets/images/buymed_logo.png', width: 24, height: 24),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Buymed',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          const Text(
            '1 sản phẩm',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", "vi_VN");
    final product = ProductMock(
      name: "Neutri Fore Bidiphar (hộp/100 Viên Nén)",
      name_stock: "Hôp 10 vĩ, mỗi vĩ 10 Viên Nén",
      image:
          "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
      manufacturer: "Bidiphar",
      price: 127100,
      oldPrice: 141800,
      discount: 3,
      isShowStock: true,
      hasAlternative: true,
      isDiscount: true,
      isCombo: false,
      isPromotion: true,
      isNearOut: true,
      stock: 947,
    );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- IMAGE --------
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE6E6E6)),
            ),
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: 1.0,
                child: Image.network(
                  product.image ?? '',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // -------- INFO --------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Amoxicilin/ Acid Clavulanic 875mg/12...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 12),

                _InfoRow(label: 'SL đặt:', value: '5'),
                _InfoRow(
                  label: 'Giá mua:',
                  value: '${formatter.format(49000)}đ',
                  valueColor: const Color(0xFF2E7D32),
                ),
                _InfoRow(
                  label: 'Tổng cộng:',
                  value: '${formatter.format(245000)}đ',
                  valueColor: const Color(0xFF1B5E20),
                  bold: true,
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
  final String label;
  final String value;
  final Color? valueColor;
  final bool bold;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontWeight: bold ? FontWeight.w500 : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: TextButton(
          onPressed: () {
            AppSheet.show(
              context,
              heightFactor: 0.95,
              child: ProductListSheet(),
            );
          },
          child: const Text(
            'Xem tất cả',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF3F51B5),
              //fontStyle: .,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
