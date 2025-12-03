// --------------------- Helper Widget ---------------------

import 'package:flutter/material.dart';

Widget priceRow(String label, String value, double fontSize) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      const SizedBox(width: 6),
      Text(
        value,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF0B4D2C), // green
        ),
      ),
    ],
  );
}
