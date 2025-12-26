import 'package:flutter/material.dart';

import 'bussiness_type_skeleton.dart';

class BussinessTypeSkeletonGrid extends StatelessWidget {
  const BussinessTypeSkeletonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(5, (_) => const BussinessTypeSkeleton()),
    );
  }
}
