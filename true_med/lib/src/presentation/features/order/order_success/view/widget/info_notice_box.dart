import 'package:flutter/material.dart';

class InfoNoticeBox extends StatelessWidget {
  final String text;

  const InfoNoticeBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3F51E3), width: 1),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF3F51E3),
          fontSize: 11,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
