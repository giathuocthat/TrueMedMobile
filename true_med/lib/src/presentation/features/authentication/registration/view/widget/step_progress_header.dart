import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';

class StepProgressHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;

  const StepProgressHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // ---------- BACK ----------
            //IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),

            //const SizedBox(width: 8),

            // ---------- PROGRESS ----------
            Expanded(
              child: Row(
                children: List.generate(totalSteps, (index) {
                  //final stepIndex = index + 1;
                  //final isActive = stepIndex <= currentStep;
                  //final isPassed = stepIndex <= passedStep;
                  final stepIndex = index + 1;
                  final isPassed = stepIndex < currentStep;
                  final isCurrent = stepIndex == currentStep;
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: index == totalSteps - 1 ? 0 : 6,
                      ),
                      height: 6,
                      decoration: BoxDecoration(
                        color: isPassed
                            ? AppColors.borderFocus
                            : isCurrent
                            ? AppColors.success600
                            : AppColors.grayLight100,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
