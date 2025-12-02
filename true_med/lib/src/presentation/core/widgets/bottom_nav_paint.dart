// import 'package:flutter/material.dart';

// class _NavBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 2;

//     double holeRadius = 42;
//     double centerX = size.width / 2;
//     double holeTopY = 0;

//     Path path = Path();

//     path.moveTo(0, 20);
//     path.quadraticBezierTo(0, 0, 20, 0);

//     path.lineTo(centerX - holeRadius - 15, 0);

//     path.quadraticBezierTo(
//       centerX - holeRadius,
//       holeTopY,
//       centerX - holeRadius + 10,
//       holeTopY + 25,
//     );

//     path.arcToPoint(
//       Offset(centerX + holeRadius - 10, holeTopY + 25),
//       radius: Radius.circular(holeRadius),
//       clockwise: false,
//     );

//     path.quadraticBezierTo(
//       centerX + holeRadius,
//       holeTopY,
//       centerX + holeRadius + 15,
//       0,
//     );

//     path.lineTo(size.width - 20, 0);

//     path.quadraticBezierTo(size.width, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
