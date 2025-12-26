import 'package:flutter/material.dart';

import '../../../../../../domain/enum/app_enums.dart';
import 'item_provice_header.dart';

class ProvinceHeaderSection extends StatelessWidget {
  const ProvinceHeaderSection({super.key, this.valueProvice, this.valueWard});

  final String? valueProvice;
  final String? valueWard;

  @override
  Widget build(BuildContext context) {
    final stateProvice = valueProvice != null
        ? ProvinceHeaderState.completed
        : ProvinceHeaderState.current;

    var stateWard = ProvinceHeaderState.disabled;

    if (valueWard != null && stateProvice == ProvinceHeaderState.completed) {
      stateWard = ProvinceHeaderState.completed;
    } else if (stateProvice == ProvinceHeaderState.completed) {
      stateWard = ProvinceHeaderState.current;
    } else {
      stateWard = ProvinceHeaderState.disabled;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemProvinceHeaderSection(
          state: stateProvice,
          index: '1',
          text: valueProvice ?? 'Tỉnh/ Thành phố',
          showDot: true,
        ),
        const SizedBox(height: 6),

        ItemProvinceHeaderSection(
          state: stateWard,
          index: '2',
          text: valueWard ?? 'Xã/ Phường',
        ),
      ],
    );
  }
}
