import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorView({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('error'),
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, size: 40, color: Colors.redAccent),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
        ElevatedButton(onPressed: onRetry, child: const Text('Thử lại')),
      ],
    );
  }
}
