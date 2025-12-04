import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  final double progress; // 0 → 1
  final double indicatorWidth; // độ dài thanh xanh
  final double barWidth; // tổng chiều dài thanh xám

  const ScrollIndicator({
    super.key,
    required this.progress,
    required this.indicatorWidth,
    this.barWidth = 60,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Colors.black12.withOpacity(0.15);
    const activeColor = Color(0xFF0B4D2C);

    return SizedBox(
      height: 8,
      child: Center(
        child: SizedBox(
          width: barWidth,
          height: 8,
          child: Stack(
            children: [
              // Nền xám
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),

              // Thanh xanh di chuyển theo scroll
              AnimatedPositioned(
                duration: const Duration(milliseconds: 50),
                curve: Curves.linear,
                left: (barWidth - indicatorWidth) * progress,
                top: 0,
                bottom: 0,
                child: Container(
                  width: indicatorWidth,
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
