import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BussinessTypeSkeleton extends StatelessWidget {
  const BussinessTypeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: IntrinsicWidth(
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 56, // 🔥 giống item thật
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // fake radio
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),

              // fake text
              Container(
                width: 100,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
