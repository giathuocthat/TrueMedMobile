import 'package:flutter/material.dart';

class ScrollProgressBar extends StatelessWidget {
  final double progress; // từ 0 -> 1

  const ScrollProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE0E0E0);
    const activeColor = Color(0xFF0B4D2C);

    return SizedBox(
      height: 8,
      child: Center(
        child: Container(
          width: 90,
          height: 8,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress.clamp(0, 1),
            child: Container(
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
