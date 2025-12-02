import 'package:flutter/material.dart';

class TagBadge extends StatelessWidget {
  final Color background;
  final String text;
  final IconData? icon; // null = không có icon

  const TagBadge({
    super.key,
    required this.background,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      constraints: const BoxConstraints(minHeight: 30),
      color: background,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: hasIcon
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasIcon) ...[
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 6),
          ],
          // Flexible để text xuống dòng khi dài
          Flexible(
            child: Text(
              text,
              textAlign: hasIcon ? TextAlign.left : TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
