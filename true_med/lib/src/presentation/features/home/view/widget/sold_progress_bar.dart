import 'package:flutter/material.dart';

class SoldProgressBar extends StatelessWidget {
  final bool iSShowSold; // số lượng đã bán
  final int sold; // số lượng đã bán
  final int total; // tổng số lượng tối đa

  const SoldProgressBar({
    super.key,
    required this.iSShowSold,
    required this.sold,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final double percent = (sold / total).clamp(0, 1);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Background bar
          Container(
            height: 14,
            decoration: BoxDecoration(
              color: Colors.pink.shade200.withOpacity(0.6),
            ),
          ),

          // Filled bar (progress)
          FractionallySizedBox(
            widthFactor: percent,
            child: Container(
              height: 14,
              decoration: BoxDecoration(color: Colors.red.shade600),
            ),
          ),

          // Text overlay
          Positioned.fill(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: iSShowSold ? "Đã bán" : "Đang bán chạy",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    if (iSShowSold) ...[
                      TextSpan(
                        text: " $sold",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
