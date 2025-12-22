import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      // decoration: BoxDecoration(
      //   color: const Color(0xFFF1F7F4), // xanh nhạt như thiết kế
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF0B4D2C), // xanh đậm brand
        ),
      ),
    );
  }
}
