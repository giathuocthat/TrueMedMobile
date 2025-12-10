import 'dart:async';
import 'package:flutter/material.dart';

class ProducBannerCarousel extends StatefulWidget {
  const ProducBannerCarousel({super.key});

  @override
  State<ProducBannerCarousel> createState() => _ProducBannerCarouselState();
}

class _ProducBannerCarouselState extends State<ProducBannerCarousel> {
  final PageController _pageController = PageController();
  final List<String> _banners = [
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
    'https://medpharco.com/wp-content/uploads/2025/09/modom.png',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0B4D2C);

    return SizedBox(
      height: 200, // chỉnh theo thiết kế của bạn
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // ----- BANNER -----
          PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                //margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),

                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.network(
                        _banners[index] ?? '',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // ----- DOT INDICATOR -----
          Positioned(
            bottom: 8,
            child: Row(
              children: List.generate(_banners.length, (index) {
                final bool isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 8 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive ? green : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(999),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
