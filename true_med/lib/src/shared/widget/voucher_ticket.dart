import 'package:flutter/material.dart';

import 'voucher_tag.dart';

class VoucherTicket extends StatelessWidget {
  final String text;
  final Color color;
  final double height;

  const VoucherTicket({
    super.key,
    required this.text,
    this.color = const Color(0xFF5B73F3),
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FullCouponPainter(color: color, stroke: 1),
      child: Container(
        alignment: Alignment.center,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class FullCouponPainter extends CustomPainter {
  final Color color;
  final double stroke;

  FullCouponPainter({this.color = const Color(0xFF5B73F3), this.stroke = 2.5});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    final rCorner = 8.0; // bo góc
    final rCut = 4.0; // khoét nửa hình tròn 2 bên

    final path = Path();

    // Start top-left corner offset
    path.moveTo(rCorner, 0);

    // Top-left corner rounded
    path.arcToPoint(
      Offset(0, rCorner),
      radius: Radius.circular(rCorner),
      clockwise: false,
    );

    // Left edge up to top cut
    path.lineTo(0, size.height / 2 - rCut);

    // Left cut (inward)
    path.arcToPoint(
      Offset(0, size.height / 2 + rCut),
      radius: Radius.circular(rCut),
      clockwise: true,
    );

    // Bottom-left corner
    path.lineTo(0, size.height - rCorner);
    path.arcToPoint(
      Offset(rCorner, size.height),
      radius: Radius.circular(rCorner),
      clockwise: false,
    );

    // Bottom edge
    path.lineTo(size.width - rCorner, size.height);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width, size.height - rCorner),
      radius: Radius.circular(rCorner),
      clockwise: false,
    );

    // Right edge up to cut
    path.lineTo(size.width, size.height / 2 + rCut);

    // Right inward cut
    path.arcToPoint(
      Offset(size.width, size.height / 2 - rCut),
      radius: Radius.circular(rCut),
      clockwise: true,
    );

    // Top-right corner
    path.lineTo(size.width, rCorner);
    path.arcToPoint(
      Offset(size.width - rCorner, 0),
      radius: Radius.circular(rCorner),
      clockwise: false,
    );

    // Top edge
    path.lineTo(rCorner, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
