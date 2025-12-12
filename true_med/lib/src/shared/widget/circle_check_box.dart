import 'package:flutter/material.dart';

class CircleCheckBox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback? onTap;
  final double size;

  const CircleCheckBox({
    super.key,
    required this.isChecked,
    this.onTap,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked
              ? Colors
                    .blue // xanh giống hình
              : Colors.transparent,
          border: Border.all(
            color: isChecked ? Colors.blue : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: isChecked
            ? const Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }
}
