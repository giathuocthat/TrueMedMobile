import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_assets.dart';
import 'step_progress_header.dart';

class RegisterNavigationBar extends StatelessWidget {
  final int? currentStep;
  final int? totalSteps;
  const RegisterNavigationBar({super.key, this.currentStep, this.totalSteps});
  bool get hasProgress => currentStep != null && totalSteps != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            padding: const EdgeInsets.all(12), // spacing-lg
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // radius-md
              ),
            ),
            icon: Image.asset(
              AppAssets.arrowNarrowLeft,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 2),
          Expanded(
            child: hasProgress
                ? StepProgressHeader(
                    currentStep: currentStep!,
                    totalSteps: totalSteps!,
                  )
                : const SizedBox(), // hoặc Spacer()
          ),
        ],
      ),
    );
  }
}
