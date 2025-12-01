import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final String hint;
  final bool autoFocus;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const AppSearchBar({
    super.key,
    required this.hint,
    this.autoFocus = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.search, size: 22, color: Colors.grey),
          const SizedBox(width: 8),

          // Search text
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: autoFocus,
              readOnly: onTap != null, // HomePage không cho nhập
              onTap: onTap, // HomePage → mở SearchPage
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                isDense: true,
              ),
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
