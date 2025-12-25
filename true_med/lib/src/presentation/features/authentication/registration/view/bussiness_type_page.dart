import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../domain/entities/bussiness_type_entity.dart';
import '../../../../core/router/routes.dart';
import '../../../shipping_address/riverpod/province/province_address_provider.dart';
import '../riverpod/register_provider.dart';
import 'model/mock_data.dart';
import 'widget/business_type_option.dart';
import 'widget/bussiness_type_section.dart';
import 'widget/register_btnNext_footer.dart';
import 'widget/register_navigation_bar.dart';

class BussinessTypePage extends ConsumerStatefulWidget {
  const BussinessTypePage({super.key});

  @override
  ConsumerState<BussinessTypePage> createState() => _BussinessTypePageState();
}

class _BussinessTypePageState extends ConsumerState<BussinessTypePage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm

  //final Set<int> selectedIds = {};
  final shouldPolicyCheck = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    final notifier = ref.read(registerProvider.notifier);
    // shouldPolicyCheck.addListener(() {
    //   notifier.updateBussinessTypesSelectedIds(selectedIds.toList());
    // });
  }

  @override
  void dispose() {
    // shouldPolicyCheck.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;
    final state = ref.watch(registerProvider);

    final stateProvice = ref.watch(provinceAddressProvider(0));

    final List<BussinessTypeResponseEntity> bussinessTypes =
        state.bussinessTypes;
    final selectedIds = ref.watch(registerProvider).bussinessTypesSelectedIds;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // 🔥 ép full size
        children: [
          // ---------- BACKGROUND ----------
          Image.asset(AppAssets.bgImage, fit: BoxFit.cover),

          // ---------- SCROLL CONTENT ----------
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              16,
              navBarTotalHeight + 32,
              16,
              footerBuffer, // 🔥 buffer an toàn
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BussinessTypeSection(),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: bussinessTypes.map((item) {
                    final isSelected = selectedIds.contains(item.id);
                    return BussinessTypeItem(
                      item: item,
                      selected: isSelected,
                      onTap: () {
                        ref
                            .read(registerProvider.notifier)
                            .toggleBusinessType(item.id);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: navBarHeight,
                child: RegisterNavigationBar(currentStep: 1, totalSteps: 3),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ResgisterButtonNextFooter(
              onNext: selectedIds.isNotEmpty
                  ? () {
                      context.pushNamed(Routes.accountInfo);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
