import 'package:flutter/material.dart';

class PromoChips extends StatelessWidget {
  final List<String> items;

  const PromoChips({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0B4D2C);

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: green, width: 1.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                items[index],
                style: const TextStyle(
                  color: green,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
