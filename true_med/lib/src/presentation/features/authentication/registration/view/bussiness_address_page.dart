import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../core/router/routes.dart';
import 'widget/address_info_form.dart';
import 'widget/bussiness_address_section.dart';
import 'widget/register_btnNext_footer.dart';
import 'widget/register_navigation_bar.dart';
import 'widget/register_policy_footer.dart';
import 'widget/register_stepper.dart';

class BussinessAddressPage extends StatefulWidget {
  const BussinessAddressPage({super.key});

  @override
  State<BussinessAddressPage> createState() => _BussinessAddressPageState();
}

class _BussinessAddressPageState extends State<BussinessAddressPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm
  final provinceController = TextEditingController();
  final wardController = TextEditingController();
  final streetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;
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
                AddressInfoForm(
                  provinceController: provinceController,
                  wardController: wardController,
                  streetController: streetController,
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
              onNext: () {
                context.pushNamed(Routes.bussinessType);
              },
            ),
          ),
        ],
      ),
    );
  }
}
