import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';

class RadioIcon extends StatelessWidget {
  final bool selected;

  const RadioIcon({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      selected ? AppAssets.iconCheckedBox : AppAssets.iconUnCheckBox,
      width: 16,
      height: 16,
      fit: BoxFit.contain,
    );
  }
}
