import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../domain/enum/select_location_mode.dart';
import '../../../../core/router/routes.dart';
import '../riverpod/register_provider.dart';
import '../riverpod/register_state.dart';
import 'widget/address_info_form.dart';
import 'widget/bussiness_address_section.dart';
import 'widget/register_btnNext_footer.dart';
import 'widget/register_navigation_bar.dart';
import 'widget/register_policy_footer.dart';
import 'widget/register_stepper.dart';
import 'widget/require_label.dart';

class BussinessAddressPage extends ConsumerStatefulWidget {
  const BussinessAddressPage({super.key});

  @override
  ConsumerState<BussinessAddressPage> createState() =>
      _BussinessAddressPageState();
}

class _BussinessAddressPageState extends ConsumerState<BussinessAddressPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm
  final provinceController = TextEditingController();
  final wardController = TextEditingController();
  final streetController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(registerProvider.notifier).onPageOpened();
    // });
  }

  @override
  void dispose() {
    provinceController.dispose();
    wardController.dispose();
    streetController.dispose();
    super.dispose();
  }

  void _updateAddressFields(RegisterState state) {
    final province = state.provinceSelected;
    final ward = state.wardSelected;

    provinceController.text = province?.name ?? '';
    wardController.text = ward?.name ?? '';
  }

  void _onCheckValidate() {
    if (_formKey.currentState!.validate()) {
      _onPushToScreen();
    }
  }

  void _onPushToScreen() {
    ref.read(registerProvider.notifier).setAdressStreet(streetController.text);
    context.pushNamed(Routes.confirmOTP);
  }

  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;
    final state = ref.watch(registerProvider);

    _updateAddressFields(state);

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
                //Container(color: Colors.red, height: 2),
                const BussinessAddressSection(),
                Form(
                  key: _formKey,
                  child: AddressInfoForm(
                    provinceController: provinceController,
                    wardController: wardController,
                    isActiveWard: provinceController.text.isNotEmpty,
                    onTapProvince: () {
                      context.pushNamed(
                        Routes.selectProvinceDistrict,
                        extra: SelectLocationMode.province,
                      );
                    },
                    onTapWard: () {
                      context.pushNamed(
                        Routes.selectProvinceDistrict,
                        extra: SelectLocationMode.ward,
                      );
                    },
                    streetController: streetController,
                  ),
                ),

                const SizedBox(height: 14),
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
                child: RegisterNavigationBar(currentStep: 3, totalSteps: 3),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ResgisterButtonNextFooter(
              textDisplay: 'Nhận mã xác thực',
              onNext: () {
                _onCheckValidate();
                //context.pushNamed(Routes.confirmOTP);
              },
            ),
          ),
        ],
      ),
    );
  }
}
