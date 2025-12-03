import 'package:flutter/material.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Số lượng sản phẩm",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),

            Spacer(),

            Text(
              "3",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // --- TITLE ROW: Icon + "Khuyến mãi" + vouchers tags ---
        Row(
          children: [
            const Icon(
              Icons.confirmation_number,
              color: Color(0xFFE88939),
              size: 24,
            ),

            const SizedBox(width: 8),

            const Text(
              "Khuyến mãi",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),

            const Spacer(),

            _voucherTag("30.000đ"),
            const SizedBox(width: 6),
            _voucherTag("22.600đ"),

            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xFF3F5FFF),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // --- LOWER BOX: cảnh báo mua thêm ---
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF4E5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFE89A45), width: 1),
          ),
          child: Row(
            children: [
              const Icon(Icons.local_offer, color: Color(0xFFE88939), size: 18),

              const SizedBox(width: 10),

              const Expanded(
                child: Text(
                  "Mua thêm 572.903đ để sử dụng mã",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFD14F35),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Add button xanh đậm
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xFF0B4D2C),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 14),
              ),
            ],
          ),
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
