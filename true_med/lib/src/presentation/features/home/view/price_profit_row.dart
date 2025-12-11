import 'package:flutter/material.dart';

class ProfitPriceWidget extends StatelessWidget {
  const ProfitPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F0DC), // nền phải (màu kem)
        borderRadius: BorderRadius.circular(14),
      ),
      //padding: const EdgeInsets.symmetric(vertical: 6,),
      child: Row(
        children: [
          // ----------- LEFT GRADIENT LABEL -----------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE6452D), Color(0xFFF9A858)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(Icons.monetization_on, size: 14, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  "Lợi nhuận bán lẻ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // ----------- VALUE TEXT -----------
          const Text(
            "56.100đ",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(width: 8),

          // ----------- INFO ICON -----------
          Container(
            width: 18,
            height: 18,

            child: const Icon(
              Icons.info_outline,
              size: 13,
              color: Color(0xFF3547E3),
            ),
          ),

          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
