import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/image_entity.dart';
import '../../../../../domain/entities/product_entity.dart';

class ProducBannerCarousel extends StatefulWidget {
  final List<ImageResponseEntity> listImages;
  const ProducBannerCarousel({super.key, required this.listImages});

  @override
  State<ProducBannerCarousel> createState() => _ProducBannerCarouselState();
}

class _ProducBannerCarouselState extends State<ProducBannerCarousel> {
  final PageController _pageController = PageController();

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
      height: 240, // chỉnh theo thiết kế của bạn
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // ----- BANNER -----
          PageView.builder(
            controller: _pageController,
            itemCount: widget.listImages.length,
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
                        widget.listImages[index].imageUrl.trim() ?? '',
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
              children: List.generate(widget.listImages.length, (index) {
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
