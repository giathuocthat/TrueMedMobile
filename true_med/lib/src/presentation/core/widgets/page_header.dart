import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const PageHeader({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B4D2C),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),

          if (showBack) const SizedBox(width: 12),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
