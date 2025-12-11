import 'package:flutter/material.dart';

import 'quantity_detail_selector.dart';
import 'quantity_selector.dart';

class ProductCartSection extends StatelessWidget {
  const ProductCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Đặt tối đa 5 sản phẩm",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),

            Spacer(),

            Text(
              "3 điểm",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 6),

        // --- TITLE ROW: Icon + "Khuyến mãi" + vouchers tags ---
        QuantityDetailSelector(
          //product: null,
          qty: 0,
          onIncrease: null,
          onDecrease: null,
        ),

        SizedBox(height: 12),

        Row(
          children: [
            // icon circle with $
            const Icon(Icons.shopping_cart, size: 14, color: Colors.grey),
            const SizedBox(width: 6),
            const Text(
              "284 ",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Lượt mua trong 24h",
              style: TextStyle(
                fontSize: 11,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ---------------- Voucher Tag ----------------
  Widget _voucherTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: const ShapeDecoration(
        color: Colors.transparent,
        shape: _TicketShapeBorder(
          side: BorderSide(color: Color(0xFF3F5FFF), width: 1),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF3F5FFF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TicketShapeBorder extends ShapeBorder {
  final BorderSide side;

  const _TicketShapeBorder({this.side = BorderSide.none});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const radius = 6.0;
    final path = Path()
      ..moveTo(rect.left + radius, rect.top)
      ..lineTo(rect.right - radius, rect.top)
      ..quadraticBezierTo(rect.right, rect.top, rect.right, rect.top + radius)
      ..lineTo(rect.right, rect.bottom - radius)
      ..quadraticBezierTo(
        rect.right,
        rect.bottom,
        rect.right - radius,
        rect.bottom,
      )
      ..lineTo(rect.left + radius, rect.bottom)
      ..quadraticBezierTo(
        rect.left,
        rect.bottom,
        rect.left,
        rect.bottom - radius,
      )
      ..lineTo(rect.left, rect.top + radius)
      ..quadraticBezierTo(rect.left, rect.top, rect.left + radius, rect.top)
      ..close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(
      getOuterPath(rect),
      Paint()
        ..color = side.color
        ..strokeWidth = side.width
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return _TicketShapeBorder(side: side.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }
}
