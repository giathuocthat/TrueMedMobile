import 'package:flutter/material.dart';

class VoucherPainter extends CustomPainter {
  final Color color;
  final double height;

  VoucherPainter(this.color, this.height);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = height * 0.33; // Kích thước notch
    final r = Radius.circular(radius);

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Bắt đầu từ góc trên trái
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // Vòng cung bên phải (nửa tròn xen vào)
    path.arcToPoint(Offset(size.width, height), radius: r, clockwise: false);

    path.lineTo(0, height);

    // Vòng cung bên trái (nửa tròn xen vào)
    path.arcToPoint(Offset(0, 0), radius: r, clockwise: false);

    canvas.drawPath(path, paint);

    // Vẽ notch giữa (hình tròn lõm vào ở hai bên)
    final notchRadius = radius * 0.5; // Kích thước notch giữa
    final notchPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    // Vẽ notch bên trái
    canvas.drawCircle(Offset(0, height / 2), notchRadius, paint);

    // Vẽ notch bên phải
    canvas.drawCircle(Offset(size.width, height / 2), notchRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
