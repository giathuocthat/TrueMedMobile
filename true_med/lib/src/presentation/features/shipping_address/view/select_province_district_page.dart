import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/app_localization.dart';
import '../../../../data/models/product_model.dart';
import '../../../../domain/entities/bussiness_type_entity.dart';
import '../../../../domain/enum/select_location_mode.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/page_header.dart';
import '../../application/cart/riverpod/cart_state.dart';
import '../../authentication/registration/riverpod/register_provider.dart';
import '../../authentication/registration/view/widget/business_type_option.dart';
import '../../authentication/registration/view/widget/bussiness_type_section.dart';
import '../../authentication/registration/view/widget/register_btnNext_footer.dart';
import '../../authentication/registration/view/widget/register_navigation_bar.dart';
import '../model/shipp_addres_mock.dart';
import '../riverpod/shipping_address_provider.dart';
import 'widget/shipping_addess_item.dart';

class SelectProvinceDistrictPage extends ConsumerStatefulWidget {
  final SelectLocationMode mode;
  final int? provinceId;
  final int? wardId;

  const SelectProvinceDistrictPage({
    super.key,
    this.provinceId,
    this.wardId,
    required this.mode,
  });

  bool get isProvince => mode == SelectLocationMode.province;

  @override
  ConsumerState<SelectProvinceDistrictPage> createState() =>
      _SelectProvinceDistrictPageState();
}

class _SelectProvinceDistrictPageState
    extends ConsumerState<SelectProvinceDistrictPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm
  late ProductResponseModel product;
  final listAdress = mockAddressData;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(registerProvider.notifier).onPageOpened();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;
    final state = ref.watch(registerProvider);

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
                child: RegisterNavigationBar(),
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
