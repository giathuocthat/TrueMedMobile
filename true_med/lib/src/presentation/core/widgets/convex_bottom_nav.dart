import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConvexBottomNav extends StatelessWidget {
  final StatefulNavigationShell navShell;

  const ConvexBottomNav({super.key, required this.navShell});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ---- Custom Shape Background ----
          Positioned.fill(child: CustomPaint(painter: _NavBarPainter())),

          // ---- Center Button ----
          Positioned(
            top: -26, // điều chỉnh độ cao
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => navShell.goBranch(2),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 1.6,
                          ), // nhỏ hơn
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 20, // nhỏ hơn bản trước
                          color: Colors.green.shade800,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Đặt Nhanh",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: navShell.currentIndex == 2
                          ? Colors.green
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---- Icons Left & Right Groups ----
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(context, 0, Icons.home_outlined, "Trang Chủ"),
                _item(context, 1, Icons.percent, "Khuyến Mãi"),
                const SizedBox(width: 40), // space for hole
                _item(context, 3, Icons.archive_outlined, "Đơn Hàng"),
                // _itemBadge(
                //   context,
                //   3,
                //   Icons.archive_outlined,
                //   "Đơn Hàng",
                //   "23",
                // ),
                _item(context, 4, Icons.local_fire_department, "Lợi Nhuận Cao"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, int index, IconData icon, String label) {
    bool selected = navShell.currentIndex == index;
    Color c = selected ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: () => navShell.goBranch(index),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: c),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: c,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBadge(
    BuildContext context,
    int index,
    IconData icon,
    String label,
    String badge,
  ) {
    bool selected = navShell.currentIndex == index;
    Color c = selected ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: () => navShell.goBranch(index),
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 26, color: c),
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: c,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    double holeRadius = 30;
    double centerX = size.width / 2;
    double holeTopY = 0;

    Path path = Path();

    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);

    path.lineTo(centerX - holeRadius - 15, 0);

    path.quadraticBezierTo(
      centerX - holeRadius,
      holeTopY,
      centerX - holeRadius + 10,
      holeTopY + 25,
    );

    path.arcToPoint(
      Offset(centerX + holeRadius - 10, holeTopY + 25),
      radius: Radius.circular(holeRadius),
      clockwise: false,
    );

    path.quadraticBezierTo(
      centerX + holeRadius,
      holeTopY,
      centerX + holeRadius + 15,
      0,
    );

    path.lineTo(size.width - 20, 0);

    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
