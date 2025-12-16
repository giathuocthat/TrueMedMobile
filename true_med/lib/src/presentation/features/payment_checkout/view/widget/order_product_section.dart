import 'package:flutter/material.dart';

import '../../../../../domain/entities/cart_entity.dart';
import '../../../../core/widgets/app_sheet/app_sheet.dart';
import '../../../home/model/product_mock.dart';
import 'dashed_divider.dart';
import 'header_product_list.dart';
import 'product_item_card.dart';
import 'product_list_sheet.dart';

class OrderProductSection extends StatelessWidget {
  final int itemCheckouts;
  final List<CartItemEntity> listProducts;

  const OrderProductSection({
    super.key,
    required this.listProducts,
    required this.itemCheckouts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //Header(itemCheckouts: itemCheckouts),
          HeadeProductListCheckOut(itemCheckouts: itemCheckouts),
          //const Divider(height: 1),
          Divider(height: 1, color: Colors.grey.shade300),
          _ShopRow(),
          //const Divider(height: 1),
          Divider(height: 1, color: Colors.grey.shade300),
          ProductItemCard(item: listProducts[0]),
          const SizedBox(height: 2),
          //const Divider(thickness: 1, height: 1),
          const DashedDivider(),
          _ViewAll(itemCheckouts: itemCheckouts, listProducts: listProducts),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final int itemCheckouts;

  const Header({required this.itemCheckouts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Danh sách sản phẩm',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Text('Số lượng: $itemCheckouts', style: TextStyle(fontSize: 12)),
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

// class _ProductItem extends StatelessWidget {
//   final CartItemEntity item;

//   const _ProductItem({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     final productVariants = item.product.productVariants?.firstOrNull;
//     final price = productVariants?.price ?? 0;
//     final totalMoney = price * item.quantity;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // -------- IMAGE --------
//           Container(
//             width: 80,
//             height: 80,
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: const Color(0xFFE6E6E6)),
//             ),
//             child: ClipRRect(
//               //borderRadius: BorderRadius.circular(8),
//               child: Opacity(
//                 opacity: 1.0,
//                 child: Image.network(
//                   item.product.thumbnailUrl ?? '',
//                   width: 70,
//                   height: 70,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),

//           // -------- INFO --------
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${item.product.name}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//                 ),

//                 const SizedBox(height: 12),

//                 _InfoRow(label: 'SL đặt:', value: '${item.quantity}'),
//                 _InfoRow(
//                   label: 'Giá mua:',
//                   value: '${price.toCurrency(true)}',
//                   valueColor: const Color(0xFF2E7D32),
//                 ),
//                 _InfoRow(
//                   label: 'Tổng cộng:',
//                   value: '${totalMoney.toCurrency(true)}',
//                   valueColor: const Color(0xFF1B5E20),
//                   bold: true,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _InfoRow extends StatelessWidget {
//   final String label;
//   final String value;
//   final Color? valueColor;
//   final bool bold;

//   const _InfoRow({
//     required this.label,
//     required this.value,
//     this.valueColor,
//     this.bold = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 140,
//             child: Text(label, style: const TextStyle(color: Colors.black54)),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               color: valueColor ?? Colors.black,
//               fontWeight: bold ? FontWeight.w500 : FontWeight.w500,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _ViewAll extends StatelessWidget {
  final int itemCheckouts;
  final List<CartItemEntity> listProducts;

  const _ViewAll({required this.itemCheckouts, required this.listProducts});

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
              child: ProductListSheet(
                listProducts: listProducts,
                itemCheckouts: itemCheckouts,
              ),
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
