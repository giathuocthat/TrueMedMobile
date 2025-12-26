import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String? buttonText;

  const EmptyView({
    Key? key,
    required this.message,
    this.onRetry,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('empty'),
      //mainAxisSize: MainAxisSize,
      children: [
        const SizedBox(height: 24),

        Icon(Icons.inbox_outlined, size: 64, color: Colors.grey.shade400),

        const SizedBox(height: 12),

        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),

        if (onRetry != null) ...[
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            ),
            child: Text(buttonText ?? 'Thử lại'),
          ),
        ],
      ],
    );
  }
}
