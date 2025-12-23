import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../core/theme/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: context.color.onPrimary,
    //   body: const Center(child: FlutterLogo(size: 210)),
    // );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ---------- BACKGROUND IMAGE ----------
          Image.asset(AppAssets.bgImage, fit: BoxFit.cover),

          // ---------- OVERLAY (optional) ----------
          Container(
            color: Colors.black.withOpacity(0.1), // làm dịu ảnh
          ),

          // ---------- LOGO ----------
          LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: screenWidth - 32, // cách trái phải 16
                    height: screenHeight * 0.5, // cao = 1/2 màn hình
                    child: Image.asset(
                      AppAssets.logoApp,
                      fit: BoxFit.contain, // 🔥 quan trọng
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
