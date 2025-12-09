import 'package:flutter/material.dart';

Widget discountBadge(String text) {
  return ClipPath(
    clipper: TwoCornerClipper(),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: Colors.red,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
      ),
    ),
  );
}

class TwoCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const r = 12.0;

    final path = Path();

    // Bắt đầu từ top-left (bo góc)
    path.moveTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);

    // Top-left → top-right (vuông)
    path.lineTo(size.width, 0);

    // Top-right → bottom-right (bo góc)
    path.lineTo(size.width, size.height - r);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - r,
      size.height,
    );

    // Bottom-right → bottom-left (vuông)
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
