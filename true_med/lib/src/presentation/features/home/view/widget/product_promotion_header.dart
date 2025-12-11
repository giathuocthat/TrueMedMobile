import 'package:flutter/material.dart';

class ProductPromoHeader extends StatelessWidget {
  const ProductPromoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF7A3D), Color(0xFFE94E2E)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          // LEFT: "Ưu Đãi Mới"
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Ưu Đãi Mới",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..color = Colors.white
                    ..style = PaintingStyle.fill,
                  shadows: const [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // RIGHT SECTION
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFCEFD9), // nền be nhạt
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(160),
                  bottomLeft: Radius.circular(160),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Countdown text
                      const Text(
                        "Còn 21 ngày 07:37:51",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // PROGRESS BAR
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 14,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          // Filled progress
                          Container(
                            height: 14,
                            width: 150, // progress percent
                            decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          // TEXT ON TOP
                          const Positioned.fill(
                            child: Center(
                              child: Text(
                                "Đã bán 2758",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // child: Stack(
      //   children: [
      //     // LEFT: gradient cam
      //     Container(
      //       decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //           colors: [Color(0xFFFF7A3D), Color(0xFFE94E2E)],
      //           begin: Alignment.centerLeft,
      //           end: Alignment.centerRight,
      //         ),
      //       ),
      //     ),

      //     // RIGHT: nền be
      //     Align(
      //       alignment: Alignment.centerRight,
      //       child: Container(
      //         width: MediaQuery.of(context).size.width * 0.55,
      //         color: const Color(0xFFFCEFD9),
      //       ),
      //     ),

      //     // CURVE DIVIDER
      //     Positioned.fill(child: CustomPaint(painter: CurveDividerPainter())),

      //     // TEXT + PROGRESS đặt lên trên cùng
      //     buildContent(),
      //   ],
      // ),
    );
  }

  Widget buildContent() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Ưu Đãi Mới",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(flex: 6, child: buildRightSection()),
      ],
    );
  }

  Widget buildRightSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Countdown text
          const Text(
            "Còn 21 ngày 07:37:51",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          // PROGRESS BAR
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 14,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              // Filled progress
              Container(
                height: 14,
                width: 150, // progress percent
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              // TEXT ON TOP
              const Positioned.fill(
                child: Center(
                  child: Text(
                    "Đã bán 2758",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurveDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    // Shadow for curve
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    final path = Path();

    // Đường cong dạng elip đứng
    path.moveTo(size.width * 0.25, 0);
    path.quadraticBezierTo(
      size.width * 0.55,
      size.height * 0.5,
      size.width * 0.25,
      size.height,
    );

    // Vẽ shadow dọc đường cong
    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(_) => false;
}
