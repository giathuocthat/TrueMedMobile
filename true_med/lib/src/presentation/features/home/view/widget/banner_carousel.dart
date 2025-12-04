import 'dart:async';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();
  final List<String> _banners = [
    'assets/images/banner_1.jpg',
    'assets/images/banner_2.png',
    'assets/images/banner_3.jpg',
    'assets/images/banner_5.png',
    'assets/images/banner_6.jpg',
    'assets/images/banner_7.png',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) return;
      int nextPage = _currentIndex + 1;
      if (nextPage >= _banners.length) {
        nextPage = 0; // 🔁 quay lại banner đầu
      }

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0B4D2C);

    return SizedBox(
      height: 180, // chỉnh theo thiết kế của bạn
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ----- BANNER -----
          Expanded(
            // <-- thêm cái này
            child: PageView.builder(
              controller: _pageController,
              itemCount: _banners.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(_banners[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center, // <-- GIỮA
            children: List.generate(_banners.length, (index) {
              final bool isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 22 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? green : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(999),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
